@echo off
for %%f in (*.md) do (
    set "filename=%%f"
    if "!filename:~0,2!"=="20" (
        ren "%%f" "new_%%f"
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