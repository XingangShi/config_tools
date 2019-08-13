@echo off

taskkill /F  /IM python.exe

call python start_local_http_server.py 5001

pause
