#!/usr/bin/bash

echo "Python 2.7.11 run test_pypy.py time"
time python2 test_pypy.py

echo "Python 3.7.0  run test_pypy.py time"
time python3 test_pypy.py

echo "Pypy 2.0.2 run test_pypy.py time"
time pypy test_pypy.py

#  [s1635@localhost exec]$ bash run_test.sh
#  Python 2.7.11 run test_pypy.py time
#  6.92983484268
#  hello execute from pypy
#
#  real  0m7.539s
#  user  0m6.146s
#  sys 0m1.391s
#  Python 3.7.0  run test_pypy.py time
#  5.703943490982056
#  hello execute from pypy
#
#  real  0m5.725s
#  user  0m5.718s
#  sys 0m0.005s
#  Pypy 2.0.2 run test_pypy.py time
#  0.532782077789
#  hello execute from pypy
#
#  real  0m0.576s
#  user  0m0.566s
#  sys 0m0.010s
