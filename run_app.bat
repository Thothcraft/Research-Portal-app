@echo off
SET PATH=C:\Users\gad\AppData\Local\Programs\Git\cmd;C:\Users\gad\flutter\bin;%PATH%
cd /d "%~dp0"
flutter run -d chrome --web-renderer html
