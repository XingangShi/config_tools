#!/usr/bin/bash

wget https://www.python.org/ftp/python/3.7.0/Python-3.7.0.tgz
tar -zxvf Python-3.7.0.tgz && cd Python-3.7.0
./configure prefix=/usr/local/python3 && make && make install
ln -s /usr/local/python3/bin/python3.7 /usr/bin/python3
ln -s /usr/local/python3/bin/python3.7 /usr/bin/python3
python3 -V
pip3 --version
