#!/usr/bin/bash

echo "Start install GCC 9.2.0"

yum install gcc gcc-c++ -y
yum install bzip2 -y

rm -rf /home/root/temp_install/gcc-9.2.0.tar.gz /home/root/temp_install/gcc-9.2.0
mkdir -p /home/root/temp_install
cd  /home/root/temp_install

wget https://ftp.gnu.org/gnu/gcc/gcc-9.2.0/gcc-9.2.0.tar.gz
tar -xvf gcc-9.2.0.tar.gz
cd gcc-9.2.0
./contrib/download_prerequisites

rm -rf /usr/local/gmp-6.1.0
mkdir /usr/local/gmp-6.1.0
cd /usr/local/gmp-6.1.0/
/home/root/temp_install/gcc-9.2.0/gmp-6.1.0/configure --prefix=/usr/local/gmp-6.1.0
make
make install

yum install gmp -y
yum install gmp-devel -y

rm -rf /usr/local/mpfr-3.1.4
mkdir /usr/local/mpfr-3.1.4
cd /usr/local/mpfr-3.1.4
/home/root/temp_install/gcc-9.2.0/mpfr-3.1.4/configure --prefix=/usr/local/mpfr-3.1.4 --with-gmp=/usr/local/gmp-6.1.0
make
make install

yum install mpfr -y
yum install mpfr-devel -y

rm -rf /usr/local/mpc-1.0.3
mkdir /usr/local/mpc-1.0.3
cd /usr/local/mpc-1.0.3
/home/root/temp_install/gcc-9.2.0/mpc-1.0.3/configure --prefix=/usr/local/mpc-1.0.3 --with-gmp=/usr/local/gmp-6.1.0/ --with-mpfr=/usr/local/mpfr-3.1.4/
make
make install

yum install libmpc -y
yum install libmpc-devel -y

export LD_LIBRARY_PATH="/usr/local/mpc-1.0.3/lib;/usr/local/mpfr-3.1.4/lib;/usr/local/gmp-6.1.0/lib"

rm -rf /usr/local/gcc-9.2.0
mkdir /usr/local/gcc-9.2.0
cd /usr/local/gcc-9.2.0
/home/root/temp_install/gcc-9.2.0/configure --prefix=/usr/local/gcc-9.2.0 -enable-threads=posix  -disable-checking -disable-multilib -enable-languages=c,c++ --with-gmp=/usr/local/gmp-6.1.0 --with-mpfr=/usr/local/mpfr-3.1.4 --with-mpc=/usr/local/mpc-1.0.3
make
make install


echo "end install GCC 9.2.0"

gcc --version
g++ --version
