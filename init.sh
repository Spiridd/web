#!/bin/sh

sudo ln -fs /home/box/web/etc/nginx.conf /etc/nginx/sites-enabled/test.conf
sudo rm -f /etc/nginx/sites-enabled/default
sudo /etc/init.d/nginx restart

gunicorn -c /home/box/web/etc/gunicorn.conf.py hello:app
