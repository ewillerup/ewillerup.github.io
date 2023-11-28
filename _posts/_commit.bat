@echo off
for %%f in (*.md) do (
    set "filename=%%f"
    if "!filename:~0,2!"=="20" (
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

	set filename=%year%-%month%-%day%-%filename%.md
  )
)

TIMEOUT /T 2

pushd "%userprofile%\Documents\Github\ewillerup.github.io"
echo.>.gitignore
bash -c "command find . -type f -size +99M >> .gitignore"
bash -c "sed -i "s,^\./,," .gitignore" 
git add --all
git commit -m "autoCommit %date:~-4%%date:~3,2%%date:~0,2%.%time:~0,2%%time:~3,2%%time:~6,2%"
git push
popd
exit