	#!/usr/bin/bash
echo $1 |curl -F-=\<- qrenco.de

# Sanple:
#    bash generate_qrenco.sh https://github.com/xingangshi
