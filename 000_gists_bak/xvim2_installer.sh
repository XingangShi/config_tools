#!/usr/bin/env bash

git clone https://github.com/XVimProject/XVim2.git
git clone https://github.com/slegetank/ResignXcode.git
cd ResignXcode
python3 ResignXcode.py #need a long time for 5-10 min
cd ../XVim2
make
