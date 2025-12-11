@echo off

if not exist checksum.exe obc -w -o checksum checksum.mod
if not exist listcs.exe obc -o listcs listcs.mod

checksum.exe
listcs.exe

@echo.
echo Pressione ^<Enter^> para continuar. . .
pause > nul
