#!/bin/bash

PORT=8080
_term() {
   kill -TERM "$child" 2>/dev/null
}

# When SIGTERM is sent, send it to weblab-admin
trap _term SIGTERM

# TODO: fix these two variables
FOLDER=.
VIRTUALENV_ACTIVATE=/home/user/.virtualenvs/mylab/bin/activate

cd $FOLDER
if [ -f $VIRTUALENV_ACTIVATE ]; then
    . $VIRTUALENV_ACTIVATE
else
    echo "$VIRTUALENV_ACTIVATE not found. Assuming that you are already in the right venv"
fi
date
export FLASK_DEBUG=0
export FLASK_APP=autoapp.py
flask clean-resources # Clean resources before running gunicorn

exec gunicorn -k gevent -w 1 --bind 127.0.0.1:$PORT wsgi_app:application

