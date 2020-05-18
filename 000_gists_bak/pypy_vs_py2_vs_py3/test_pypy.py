#!/usr/bin/env python3
#
# --** coding:utf-8 --**
#

import time

t = time.time()

for i in range(10**8):
  continue
print(time.time() - t)
print("hello execute from pypy")
