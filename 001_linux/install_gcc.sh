#!/usr/bin/bash


echo "install GCC 9.2.0"


rm -rf /home/root/temp_install/gcc-9.2.0.tar.gz /home/root/temp_install/gcc-9.2.0
mkdir -p /home/root/temp_install
cd  /home/root/temp_install

wget https://ftp.gnu.org/gnu/gcc/gcc-9.2.0/gcc-9.2.0.tar.gz
tar -xvf gcc-9.2.0.tar.gz
cd gcc-9.2.0
./contrib/download_prerequisites

mkdir /usr/local/gmp-6.1.0
cd /usr/local/gmp-6.1.0/
/home/root/temp_install/gcc-9.2.0/gmp-6.1.0/configure --prefix=/usr/local/gmp-6.1.0
make
make install

mkdir /usr/local/mpfr-3.1.4
cd /usr/local/mpfr-3.1.4
/home/root/temp_install/gcc-9.2.0/mpfr-3.1.4/configure --prefix=/usr/local/mpfr-3.1.4 --with-gmp=/usr/local/gmp-6.1.0
make
make install

mkdir /usr/local/mpc-1.0.3
cd /usr/local/mpc-1.0.3
/home/root/temp_install/gcc-9.2.0/mpc-1.0.3/configure --prefix=/usr/local/mpc-1.0.3 --with-gmp=/usr/local/gmp-6.1.0/ --with-mpfr=/usr/local/mpfr-3.1.4/
make
make install

mkdir /usr/local/gcc-9.2.0
cd /usr/local/gcc-9.2.0
/home/root/temp_install/gcc-9.2.0/configure --prefix=/usr/local/gcc-9.2.0 -enable-threads=posix  -disable-checking -disable-multilib -enable-languages=c,c++ --with-gmp=/usr/local/gmp-6.1.0 --with-mpfr=/usr/local/mpfr-3.1.4 --with-mpc=/usr/local/mpc-1.0.3
make
make install
