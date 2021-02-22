#!/bin/bash

Array=( $(find . | ggrep -P '(?<=default)/settings.php'))
SiteCount=${#Array[@]}

for (( i=0; i<$SiteCount; i++))
do
        Database=$(gsed -n "s/^\s*'database' => '\(.*\)',/\1/p" ${Array[i]})
        Username=$(gsed -n "s/^\s*'username' => '\(.*\)',/\1/p" ${Array[i]})
        Password=$(gsed -n "s/^\s*'password' => '\(.*\)',/\1/p" ${Array[i]})
        Host=$(gsed -n "s/^\s*'host' => '\(.*\)',/\1/p" ${Array[i]})
        echo 'mysql -u'$Username' -p'$Password' '$Database
done

WPArray=( $(find . -name 'wp-config.php'))
WPSiteCount=${#WPArray[@]}


for (( i=0; i<$WPSiteCount; i++))
do
	Database=$(gsed -n "s/^\s*define( 'DB_NAME', '\(.*\)' );/\1/p" ${WPArray[i]})
  Username=$(gsed -n "s/^\s*define( 'DB_USER', '\(.*\)' );/\1/p" ${WPArray[i]})
  Password=$(gsed -n "s/^\s*define( 'DB_PASSWORD', '\(.*\)' );/\1/p" ${WPArray[i]})
	echo "mysql -u"${Username%$'\r'}" -p'"${Password%$'\r'}"' "${Database%$'\r'}
done
