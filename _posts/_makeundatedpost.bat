@echo off
setlocal

for /f "tokens=2-4 delims=/ " %%a in ('date /t') do (
    set month=%%a
    set day=%%b
    set year=%%c
)

for /f "tokens=1-3 delims=:." %%a in ('echo %time%') do (
    set hours=%%a
    set minutes=%%b
    set seconds=%%c
)

set filename=newpost-%minutes%%seconds%.md

type nul > "%filename%"
echo ## >>"%filename%"
start notepad %filename%

%SendKeys% "^{END}"

endlocal
