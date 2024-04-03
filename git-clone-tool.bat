@echo off

setlocal enabledelayedexpansion

set /p url=Repo url : 

cd %1
git clone !url!

if %errorlevel% equ 0 (
    set "url=!url:https://=!"
    set "url=!url:www.=!"

    rem Supprimer le reste de l'URL jusqu'au dernier "/"
    for /F "tokens=* delims=/" %%a in ("!url!") do set "url=%%~nxa"

    rem Supprimer ".git" à la fin
    set "url=!url:.git=!"

    code !url!
) else (
    set /p DUMMY=Press enter to continue...
)