#!/bin/bash
set -e  # Stop script if any command fails

echo "Building the project..."
python3.9 -m pip install -r requirements.txt || { echo "Pip install failed"; exit 1; }

echo "Making Migrations..."
python3.9 manage.py makemigrations --noinput || { echo "Makemigrations failed"; exit 1; }
python3.9 manage.py migrate --noinput || { echo "Migrate failed"; exit 1; }

echo "Collecting Static..."
python3.9 manage.py collectstatic --noinput --clear || { echo "Collectstatic failed"; exit 1; }
