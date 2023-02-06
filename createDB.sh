#!/bin/bash

###########create database ##########

read -p "Enter the name of database :  " DBName

if [[ -d "$DBName" ]]
then
    echo "It's Exists"
    
	select option in "Create another Database" "Back to Main Menu"
	do
		case $option in
        "Create another Database")
            clear ; source createDB.sh
            ;;
			 "Back to Main Menu")
            clear ; source Menu.sh 
            ;;
			* ) echo "Invalid Option"
		esac
	done
else
 if [ -z $DBName ] || [ "${DBName//[!0-9]}" != "" ] || [[ $DBName =~ ['!@#$%^&*()_+'] ]]
 then
 clear ;
 echo "Invalid input (empty) (number) (special character)"
 source Menu.sh
 else
  mkdir $DBName
   echo "$DBName is Created Successfully " ; source Menu.sh
  fi
fi