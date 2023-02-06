#!bin/bash


cd $DBName
if [ -f $table ]
then
awk '{print $0}' $table 
echo "#########################################"
cd ..
source select.sh
else
cd ..
source catTable.sh
fi