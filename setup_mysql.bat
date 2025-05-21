@echo off
REM -- MySQL Configuration Script Without Password --
REM Assumes MySQL is installed in the default location and added to PATH

set MYSQL_PATH="C:\Program Files\MySQL\MySQL Server 8.0\bin\mysql.exe"

echo Setting root user and creating database...
%MYSQL_PATH% -u root < "%~dp0init_db.sql"

echo Restoring LibraryDB.sql into library_management database...
%MYSQL_PATH% -u root library_management < "%~dp0library_management.sql"

echo MySQL setup and database restoration complete.
pause
