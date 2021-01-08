#!/bin/bash

wget https://wordpress.org/latest.tar.gz

tar --strip-components=1  -zxvf  latest.tar.gz wordpress/*

rm latest.tar.gz

mkdir foobar

git clone $1 foobar

mv foobar/.git .

git reset --hard

rm -rf foobar
