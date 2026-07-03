@echo off
REM Build script for Tetris Plus GBC
REM Uses RGBDS tools to assemble and link the ROM

REM Path to RGBDS tools (adjust if needed)
set RGBDS_PATH=.\rgbds-win64
set BIN_PATH=..\bin
set SRC_PATH=..\src

REM Clean previous build
if exist %BIN_PATH%\game.o del %BIN_PATH%\game.o
if exist %BIN_PATH%\game.gb del %BIN_PATH%\game.gb
if exist %BIN_PATH%\game.sym del %BIN_PATH%\game.sym
if exist %BIN_PATH%\game.map del %BIN_PATH%\game.map

REM Assemble
echo Assembling...
"%RGBDS_PATH%\rgbasm.exe" -I %SRC_PATH%\ -o %BIN_PATH%\game.o %SRC_PATH%\game.asm
if errorlevel 1 (
    echo Assembly failed!
    exit /b 1
)

REM Link
echo Linking...
"%RGBDS_PATH%\rgblink.exe" -n %BIN_PATH%\game.sym -m %BIN_PATH%\game.map -o %BIN_PATH%\game.gb %BIN_PATH%\game.o
if errorlevel 1 (
    echo Linking failed!
    exit /b 1
)

REM Fix ROM header
echo Fixing ROM header...
"%RGBDS_PATH%\rgbfix.exe" -v -p 0 %BIN_PATH%\game.gb
if errorlevel 1 (
    echo ROM fix failed!
    exit /b 1
)

echo Build successful! ROM created: %BIN_PATH%\game.gb