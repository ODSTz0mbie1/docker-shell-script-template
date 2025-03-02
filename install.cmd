@echo off

:: Ensure Docker is installed and available
where docker >nul 2>&1
if %errorlevel% neq 0 (
    echo Error: Docker is not installed or not found in PATH.
    exit /b 1
)

:: Build the Docker image
docker build -t script1 . || (
    echo Error: Docker build failed.
    exit /b 1
)

:: Define the alias string
set "ALIAS=docker run --rm -v /:/app/data script1 -d %cd:~3%"

:: Check for the Command Prompt profile file and create it if it doesn't exist
set "PROFILE_DIR=%USERPROFILE%\AppData\Local\Microsoft\Windows\Terminal"
set "PROFILE_FILE=%PROFILE_DIR%\profile"

if not exist "%PROFILE_FILE%" (
    echo Profile file does not exist. Creating it now...
    mkdir "%PROFILE_DIR%"
    echo doskey testscript=%ALIAS% > "%PROFILE_FILE%"
) else (
    :: Check if the alias already exists to avoid duplication
    findstr /c:"%ALIAS%" "%PROFILE_FILE%" >nul 2>&1
    if %errorlevel% neq 0 (
        echo doskey testscript=%ALIAS% >> "%PROFILE_FILE%"
        echo Alias added to %PROFILE_FILE%.
    ) else (
        echo Alias 'testscript' already exists in %PROFILE_FILE%.
    )
)

:: Apply the alias to the current session
doskey testscript=%ALIAS%
echo Alias 'testscript' is now available in this session.

exit /b 0
