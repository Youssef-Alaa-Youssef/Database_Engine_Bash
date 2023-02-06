#!bin/bash

################################### Delete Database  ###################################

read -p "Enter the name of database you want to delete :  " DBName

if [[ -d "$DBName" ]]
then
read -p "are You sure Delete $DBName (Enter yes):  " delete
if [ $delete = "yes" ] || [ $delete = "Y" ] || [ $delete = "y" ] || [ $delete = "YES" ]
then

	rm -r $DBName
    echo "#####################################"
    echo "$DBName is Deleted"
    source Menu.sh
else
echo "#####################################"
    echo "try again invalid input"
    source Menu.sh

fi
else
	
	echo "try again invalid input"
    source DeleteDB.sh
fi