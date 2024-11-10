@echo off
echo Starting Custom Server...
cd BlumPayloadGenerator
start /MIN start.bat
cd ..
echo Activating virtual environment...
call venv\Scripts\activate
echo Starting the bot...
python main.py
pause
