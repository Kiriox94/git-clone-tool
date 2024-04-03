@echo off

set basePath=HKCU\Software\Classes\Directory
set repoUrl=https://github.com/Kiriox94/git-clone-tool
set toolName=git-clone-tool
set softwarePath=%LOCALAPPDATA%\%toolName%

if not exist "%softwarePath%" mkdir "%softwarePath%"

curl -A "Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64)" -L "%repoUrl%/raw/main/%toolName%.bat" -o %softwarePath%\%toolName%.bat
curl -A "Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64)" -L "%repoUrl%/raw/main/icon.ico" -o %softwarePath%\icon.ico

if %errorlevel% equ 0 (
    REG ADD %basePath%\shell\%toolName% /ve /f /d "Clone repo here"
    REG ADD %basePath%\shell\%toolName% /v icon /f /d "%%LOCALAPPDATA%%\%toolName%\icon.ico"
    REG ADD %basePath%\shell\%toolName%\command /ve /f /d "\"%softwarePath%\%toolName%.bat\" \"%%1\""

    REG ADD %basePath%\Background\shell\%toolName% /ve /f /d "Clone repo here"
    REG ADD %basePath%\Background\shell\%toolName% /v icon /f /d "%%LOCALAPPDATA%%\%toolName%\icon.ico"
    REG ADD %basePath%\Background\shell\%toolName%\command /ve /f /d "\"%softwarePath%\%toolName%.bat\""

    echo Successful installation
) else (
    echo Installation failed
)

set /p DUMMY=Press enter to continue...