#!/usr/bin/bash

wget https://www.python.org/ftp/python/3.7.0/Python-3.7.0.tgz
tar -zxvf Python-3.7.0.tgz && cd Python-3.7.0 
./configure prefix=/usr/local/python3 --with-ssl --enable-shared && make && make install
rm -rf /usr/bin/python3
ln -s /usr/local/python3/bin/python3.7 /usr/bin/python3
cp /usr/local/python3/lib/libpython3.7.so.1.0 /usr/lib
python3 -V
pip3 --version