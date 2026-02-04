@echo off
setlocal enabledelayedexpansion

set ROOT_DIR=%~dp0
set IG_FILTER=
set HAS_FILTER=0

:parse
if "%~1"=="" goto done_parse
if /I "%~1"=="--ig" (
  set HAS_FILTER=1
  shift
  :ig_loop
  if "%~1"=="" goto done_parse
  if /I "%~1"=="--help" goto help
  echo %~1 | findstr /B /C:"--" >nul
  if %ERRORLEVEL%==0 goto parse
  set IG_FILTER=!IG_FILTER! %~1
  shift
  goto ig_loop
)
if /I "%~1"=="--help" goto help
if /I "%~1"=="-h" goto help
echo Unknown option: %~1
goto help

:done_parse
if %HAS_FILTER%==0 (
  for /D %%G in ("%ROOT_DIR%igs\*") do (
    if exist "%%~fG\_genonce.sh" (
      echo Building %%~nxG
      pushd "%%~fG" >nul
      call "%%~fG\_genonce.sh"
      popd >nul
    )
  )
  exit /b 0
)

for %%I in (!IG_FILTER!) do (
  set IG_DIR=%ROOT_DIR%igs\eflow-%%I
  if not exist "!IG_DIR!" (
    echo Error: IG not found: %%I (expected !IG_DIR!)
    exit /b 1
  )
  if exist "!IG_DIR!\_genonce.sh" (
    echo Building eflow-%%I
    pushd "!IG_DIR!" >nul
    call "!IG_DIR!\_genonce.sh"
    popd >nul
  )
)

exit /b 0

:help
echo Usage: build-all.bat [--ig ^<name^> ...]
echo Example: build-all.bat --ig core eu
exit /b 0
