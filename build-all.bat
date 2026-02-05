@echo off
setlocal enabledelayedexpansion

set ROOT_DIR=%~dp0
set IG_FILTER=
set HAS_FILTER=0

echo [build-all] Root: %ROOT_DIR%

:parse
if "%~1"=="" goto done_parse
if /I "%~1"=="--ig" (
  set HAS_FILTER=1
  shift
  :ig_loop
  if "%~1"=="" goto done_parse
  if /I "%~1"=="--help" goto help
  echo %~1 | findstr /B /C:"--" >nul
  if !ERRORLEVEL!==0 goto parse
  if defined IG_FILTER (
    set IG_FILTER=!IG_FILTER! %~1
  ) else (
    set IG_FILTER=%~1
  )
  shift
  goto ig_loop
)
if /I "%~1"=="--help" goto help
if /I "%~1"=="-h" goto help
echo %~1 | findstr /B /C:"--" >nul
if !ERRORLEVEL!==0 (
  echo Unknown option: %~1
  goto help
)
set HAS_FILTER=1
if defined IG_FILTER (
  set IG_FILTER=!IG_FILTER! %~1
) else (
  set IG_FILTER=%~1
)
shift
goto parse

:done_parse
if not "%IG_FILTER%"=="" (
  for /f "tokens=* delims= " %%A in ("%IG_FILTER%") do set "IG_FILTER=%%A"
  echo [build-all] IG filter: !IG_FILTER!
)
if %HAS_FILTER%==0 (
  echo [build-all] No IG filter provided. Building all IGs in %ROOT_DIR%igs
  for /D %%G in ("%ROOT_DIR%igs\*") do (
    if exist "%%~fG\ig.ini" (
      echo Building %%~nxG
      pushd "%%~fG" >nul
      echo [build-all] Working dir: %%~fG
      if exist "%ROOT_DIR%input-cache\publisher.jar" (
        if not exist "%%~fG\input-cache" mkdir "%%~fG\input-cache" >nul 2>&1
        if not exist "%%~fG\input-cache\publisher.jar" copy /Y "%ROOT_DIR%input-cache\publisher.jar" "%%~fG\input-cache\publisher.jar" >nul
      )
      if exist "%ROOT_DIR%_genonce.bat" (
        echo [build-all] Running _genonce.bat
        call "%ROOT_DIR%_genonce.bat"
        if errorlevel 1 (
          echo [build-all] Error: _genonce.bat failed for %%~nxG
          popd >nul
          exit /b 1
        )
      ) else (
        echo Error: _genonce.bat not found in %ROOT_DIR%
        popd >nul
        exit /b 1
      )
      popd >nul
    )
  )
  exit /b 0
)

echo [build-all] Starting filtered build loop
for %%I in (!IG_FILTER!) do (
  call :build_one %%I
  if errorlevel 1 exit /b 1
)

exit /b 0

:build_one
set "IG_NAME=%~1"
echo [build-all] Loop IG: %IG_NAME%
set "IG_DIR=%ROOT_DIR%igs\%IG_NAME%"
echo [build-all] Resolving IG %IG_NAME% -^> %IG_DIR%
echo [build-all] Checking directory exists
if not exist "%IG_DIR%" (
  echo Error: IG not found: %IG_NAME%. Expected path: %IG_DIR%
  exit /b 1
)
echo [build-all] Checking directory access
dir "%IG_DIR%" >nul 2>&1
if errorlevel 1 (
  echo Error: Access denied to %IG_DIR%
  exit /b 1
)
echo [build-all] Checking ig.ini
if not exist "%IG_DIR%\ig.ini" (
  echo Error: ig.ini not found for %IG_NAME%. Expected path: %IG_DIR%\ig.ini
  exit /b 1
)
echo Building %IG_NAME%
pushd "%IG_DIR%" >nul
if errorlevel 1 (
  echo Error: Access denied to %IG_DIR%
  exit /b 1
)
echo [build-all] Working dir: %IG_DIR%
if exist "%ROOT_DIR%input-cache\publisher.jar" (
  if not exist "%IG_DIR%\input-cache" mkdir "%IG_DIR%\input-cache" >nul 2>&1
  if not exist "%IG_DIR%\input-cache\publisher.jar" copy /Y "%ROOT_DIR%input-cache\publisher.jar" "%IG_DIR%\input-cache\publisher.jar" >nul
)
if exist "%ROOT_DIR%_genonce.bat" (
  echo [build-all] Running _genonce.bat
  call "%ROOT_DIR%_genonce.bat"
  if errorlevel 1 (
    echo [build-all] Error: _genonce.bat failed for %IG_NAME%
    popd >nul
    exit /b 1
  )
) else (
  echo Error: _genonce.bat not found in %ROOT_DIR%
  popd >nul
  exit /b 1
)
popd >nul
exit /b 0

:help
echo Usage: build-all.bat [--ig ^<name^> ...]
echo Example: build-all.bat --ig core eu
exit /b 0
