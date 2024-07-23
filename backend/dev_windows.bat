:: This method is not recommended, and we recommend you use the `start.sh` file with WSL instead.
@echo off
SETLOCAL ENABLEDELAYEDEXPANSION

IF "%PORT%"=="" SET PORT=8080
IF "%HOST%"=="" SET HOST=0.0.0.0

:: Execute uvicorn
py -m uvicorn main:app --host "%HOST%" --port "%PORT%" --forwarded-allow-ips '*'
