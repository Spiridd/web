#!/bin/sh

sudo ln -fs /home/box/web/etc/nginx.conf /etc/nginx/sites-enabled/test.conf
sudo rm -f /etc/nginx/sites-enabled/default
sudo /etc/init.d/nginx restart

export PYTHONPATH=$PYTHONPATH:/home/box/web/ask/
gunicorn -c /home/box/web/etc/gunicorn.conf.py -b 0.0.0.0:8080 hello:app&
gunicorn -c /home/box/web/etc/gunicorn.conf.py -b 0.0.0.0:8000 ask.wsgi:application&
