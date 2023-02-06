#!/bin/bash
read -p "Enter Your Table Name : " delTabele

 cd $DBName
if [ -z $delTabele ] || [ "${delTabele//[!0-9]}" != "" ] || [[ $delTabele =~ ['!@#$%^&*()_+'] ]]
 then
 clear
 echo "#################"
 echo "invalid input (empty) (number) (special character)"
 cd ..
 source dropTable.sh
 else

if [ -f $delTabele ]
then

    read -p "are You sure Delete $delTabele (Enter yes):  " delete
    if [ $delete = "yes" ] || [ $delete = "YES" ] || [ $delete = "Y" ] || [ $delete = "y" ]
    then
        rm $delTabele
        echo "Successfully $delTabele Deleted"
        cd ..
        source tableInfo.sh
        else
        echo "Please Try Again"
        cd ..
        source tableInfo.sh
    fi
else
echo "Table isn't exist"
cd ..
source tableInfo.sh
fi
fi









