@echo off
tabcmd login -s "http://localhost:8000/" -u admin -p password
for /f "tokens=1-3 delims=," %%a in (D:\tableau\database.csv) do (
if not exist D:\tableau\storage\%%b (
mkdir D:\tableau\storage\%%b
)
if not exist D:\tableau\storage\%%c (
tabcmd export Report_Demographics/Countries?Country=%%a --pdf -f D:\tableau\storage\%%c
)
)
pause