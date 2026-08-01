@echo off
REM Thin wrapper: the real build lives in build.py (generators + rgbasm/rgblink/rgbfix + hash check)
python "%~dp0build.py" %*
