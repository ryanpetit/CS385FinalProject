#! /bin/bash

if [ ! -d venv ]; then
        virtualenv venv;
fi

source venv/bin/activate && \  #activate venv
pip install -r requirements.txt && \
cd django_app && \
rm -f db.sqlite3 && \
./manage.py makemigrations && \
./manage.py migrate && \
cat create_su.py | ./manage.py shell; # create test superuser
