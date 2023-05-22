#! /bin/bash

git clone https://github.com/php/php-src.git
cd php-src
git checkout php-7.4.33

./buildconf --force

./configure \
    --enable-debug \
    --prefix=$HOME/php-bin/DEBUG \
    --with-config-file-path=$HOME/php-bin/DEBUG/etc

make -j4
make install
