#!/bin/bash
echo "Starting Custom Server..."
cd BlumPayloadGenerator
bash start.sh
cd ..
echo "Activating virtual environment..."
source venv/bin/activate

echo "Starting the bot..."
python main.py

echo "Press any key to continue..."
read -n 1 -s
