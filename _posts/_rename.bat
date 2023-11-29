@echo off
setlocal enabledelayedexpansion

for %%f in (*.md) do (
    set "filename=%%f"
    if not "!filename:~0,2!"=="20" (
        for /f "tokens=2-4 delims=/ " %%a in ('date /t') do (
            set "year=%%c"
            set "month=%%a"
            set "day=%%b"
        )

        for /f "tokens=1-3 delims=:." %%a in ('echo %time%') do (
            set "hours=%%a"
            set "minutes=%%b"
            set "seconds=%%c"
        )

        rem Pad single digits with zero for consistency
        if !month! lss 10 set "month=0!month!"
        if !day! lss 10 set "day=0!day!"
        if !hours! lss 10 set "hours=0!hours!"
        if !minutes! lss 10 set "minutes=0!minutes!"
        if !seconds! lss 10 set "seconds=0!seconds!"

        set "newname=!year!-!month!-!day!_!hours!!minutes!!seconds!_!filename!"
        ren "!filename!" "!newname!"
    )
)
endlocal
