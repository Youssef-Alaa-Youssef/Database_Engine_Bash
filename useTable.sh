#!/bin/bash
cd $DBName
read -p "Enter the name of table : " table
export $table

 if [ -z $table ] || [ "${table//[!0-9]}" != "" ] || [[ $table =~ ['!@#$%^&*()_+'] ]]
 then
 clear
 echo "#################"
 echo "invalid input (empty) (number) (special character)"
 cd ..
 source useTable.sh 
 else
 if ! [ -f $table   ]
 then
 echo "#################"
 echo "No table Named $table"
 cd ..
 source useTable.sh
 else
clear
 echo "###################  Welcome to Your Table $table ################### "
 cd ..
 source select.sh
fi
fi