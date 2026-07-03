"""Local server for the colorization studio.

Usage:  python tools/kit_server.py   ->  http://localhost:8765

Serves tools/kit/ (index.html, data.json, screens/*.png) plus the two
editable JSON files, and accepts:
  POST /save-colors   body = new screen_colors.json content
  POST /save-tiles    body = new tile_edits.json content
  POST /rebuild       regenerates data+patches, builds the ROM, re-exports
                      the kit captures; returns the combined log.

Stdlib only. Ctrl+C to stop.
"""

import json
import os
import subprocess
import sys
from http.server import HTTPServer, SimpleHTTPRequestHandler

TOOLS = os.path.dirname(os.path.abspath(__file__))
KIT = os.path.join(TOOLS, "kit")
PORT = 8765

EDITABLE = {
    "/screen_colors.json": os.path.join(TOOLS, "screen_colors.json"),
    "/tile_edits.json": os.path.join(TOOLS, "tile_edits.json"),
}
SAVE_ROUTES = {
    "/save-colors": os.path.join(TOOLS, "screen_colors.json"),
    "/save-tiles": os.path.join(TOOLS, "tile_edits.json"),
}
REBUILD_STEPS = [
    [sys.executable, os.path.join(TOOLS, "gen_color_data.py")],
    [sys.executable, os.path.join(TOOLS, "gen_tile_patches.py")],
    [os.path.join(TOOLS, "build.bat")],
    [sys.executable, os.path.join(TOOLS, "export_kit_data.py")],
]


class Handler(SimpleHTTPRequestHandler):
    def __init__(self, *args, **kw):
        super().__init__(*args, directory=KIT, **kw)

    def end_headers(self):
        self.send_header("Cache-Control", "no-store")
        super().end_headers()

    def do_GET(self):
        path = self.path.split("?")[0]
        if path in EDITABLE:
            return self._send_file(EDITABLE[path])
        super().do_GET()

    def do_POST(self):
        path = self.path.split("?")[0]
        body = self.rfile.read(int(self.headers.get("Content-Length", 0)))
        if path in SAVE_ROUTES:
            try:
                parsed = json.loads(body)
            except ValueError as e:
                return self._send_text(400, f"invalid JSON: {e}")
            with open(SAVE_ROUTES[path], "w", newline="\n") as f:
                json.dump(parsed, f, indent=2)
            return self._send_text(200, "saved")
        if path == "/rebuild":
            log = []
            for step in REBUILD_STEPS:
                r = subprocess.run(step, cwd=TOOLS, capture_output=True,
                                   text=True, shell=step[0].endswith(".bat"),
                                   timeout=900)
                log.append(f"$ {' '.join(os.path.basename(s) for s in step)}\n"
                           f"{r.stdout}{r.stderr}")
                if r.returncode != 0:
                    return self._send_text(500, "\n".join(log) +
                                           f"\nFAILED (exit {r.returncode})")
            return self._send_text(200, "\n".join(log) + "\nOK")
        self._send_text(404, "unknown route")

    def _send_file(self, fspath):
        with open(fspath, "rb") as f:
            data = f.read()
        self.send_response(200)
        self.send_header("Content-Type", "application/json")
        self.send_header("Content-Length", str(len(data)))
        self.end_headers()
        self.wfile.write(data)

    def _send_text(self, code, text):
        data = text.encode("utf-8")
        self.send_response(code)
        self.send_header("Content-Type", "text/plain; charset=utf-8")
        self.send_header("Content-Length", str(len(data)))
        self.end_headers()
        self.wfile.write(data)

    def log_message(self, fmt, *args):
        sys.stderr.write(f"  {self.command} {self.path}\n")


if __name__ == "__main__":
    os.chdir(KIT)
    print(f"Studio de colorisation : http://localhost:{PORT}  (Ctrl+C pour arrêter)")
    HTTPServer(("127.0.0.1", PORT), Handler).serve_forever()
