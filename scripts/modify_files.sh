#!  /bin/bash

echo "==================================================================="
echo "WP TEMPLATE CONVERTER"
echo "This script will take the the template plugin and convert the file names and contents to point"
echo "  to a new plugin name"
echo " this code expects that the template file "../../TZ_Insult" is poplulated with a working template"
echo "==================================================================="

SRC=$(cd ..; pwd)
#cp -r  ../../TZ_Insult/* ..

echo -n "Enter name of plugin: "
read PLUGIN
rm -rf ../../$PLUGIN
mkdir ../../$PLUGIN


SRC=$(cd ../../$PLUGIN; pwd)
echo Scanning $SRC - converting to $PLUGIN
NAMETOFIX=$(find $SRC -name "TZ*"   -print)


cp  FOO.tar  $SRC
(cd $SRC; pwd;  ls ; tar xf FOO.tar)


for name in $NAMETOFIX
do
	DEST=`echo $name | sed -e "s/TZ_Insult/$PLUGIN/"`
	mv  $name  $DEST
	cat $DEST | sed -e "s/TZ_Insult/$PLUGIN/" > xxx
	mv xxx $DEST
done

NAMETOFIX=$(find $SRC -name "tz*"   -print)
for name in $NAMETOFIX
do
	DEST=`echo $name | sed -e "s/tz_insult/$PLUGIN/"`
	mv  $name  $DEST
	cat $DEST | sed -e "s/tz_insult/$PLUGIN/" > xxx
	mv xxx $DEST
done
