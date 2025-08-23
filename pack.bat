@echo off
IF NOT EXIST 7z.exe GOTO NO7Z
IF NOT EXIST "Twitch Drops Miner First" mkdir "Twitch Drops Miner First"
rem Prepare files
copy /y /v dist\*.exe "Twitch Drops Miner First"
copy /y /v manual.txt "Twitch Drops Miner First"
IF EXIST "Twitch Drops Miner First.zip" (
    rem Add action
    set action=a
) ELSE (
    rem Update action
    set action=u
)
rem Pack and test
7z %action% "Twitch Drops Miner First.zip" "Twitch Drops Miner First/" -r
7z t "Twitch Drops Miner First.zip" * -r
rem Cleanup
IF EXIST "Twitch Drops Miner First" rmdir /s /q "Twitch Drops Miner First"
GOTO EXIT
:NO7Z
echo No 7z.exe detected, skipping packaging!
GOTO EXIT
:EXIT
exit %errorlevel%
