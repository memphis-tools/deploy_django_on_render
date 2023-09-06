#!/usr/bin/env bash

# exit on error
set -o errexit


echo "Creating a virtual env and source it (so the render.yaml startCommand's command will run)".
python -m venv venv
source venv/bin/activate

poetry install

python manage.py makemigrations
python manage.py migrate
python manage.py init_app_topblog

python manage.py collectstatic --no-input
