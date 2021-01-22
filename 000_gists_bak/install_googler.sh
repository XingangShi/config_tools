#!/usr/bin/bash

# googler installer

sudo apt-get install python3 xsel xclip
sudo curl -o /usr/local/bin/googler https://raw.githubusercontent.com/jarun/googler/v4.0/googler
sudo chmod +x /usr/local/bin/googler
sudo googler -u
sudo googler -v
