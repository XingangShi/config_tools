@echo off

taskkill /F  /IM node.exe

reveal-md demo.md --theme solarized --port 8001

Pause
