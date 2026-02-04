@echo off
setlocal
set ROOT_DIR=%~dp0
pushd "%ROOT_DIR%" >nul
call "%ROOT_DIR%_updatePublisher.bat" %*
popd >nul
