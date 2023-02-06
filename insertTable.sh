#!/bin/bash

cd $DBName

 if [ -z $table ] || [ "${table//[!0-9]}" != "" ] || [[ $table =~ ['!@#$%^&*()_+'] ]]
 then
 echo "#################"
 echo "invalid input (empty) (number) (special character)"
 cd ..
 source insertTable.sh
 else
	if [[ -f "$table" ]]
	then
	# firstField = ID

		firstField=`awk -F : 'END{print $1}' $table`
		if [[ $firstField == *'Not NULL'* ]]
		then
			id=1			
	      else
		((id = $firstField + 1 )) 
		fi

	# 

		row="$id:"
		field=`awk -F : 'END{print NF}' $table`
		for (( i = 2; i <= $field ; i++ )) 
		do

	# name is a header of table

			headerTable=`awk -F : 'BEGIN {field = '$i'}{if(NR==1){print $field;}}' $table`
			datatype=`awk -F : 'BEGIN {field = '$i'}{if(NR==2){print $field;}}' $table`
			read -p "Enter the value of field ($headerTable): " val
			if [[ $datatype == *"Not NULL"* ]]
			then
				while  [[ $val == "" ]] 
				do
					read -p  "($headerTable) must not be empty  : " val
				done			
			fi
					if [[ $datatype == *"string"* ]]
			then
				while ! [[ $val =~ ^[a-z]*$ ]] 
				do
					read -p "Input Must Be String " val
					 
					while  [[ $val == "" ]] 
					do
						read -p  "This field must not be empty  : " val
					done
				done
			fi
			if [[ $datatype == *"int"* ]]
			then
				while ! [[ $val =~ ^[0-9]*$ ]] 
				do
					read -p "Input Must Be Integer " val
					 
					while  [[ $val == "" ]] 
					do
						read -p  "This field must not be empty  : " val
					done
				done
			fi
			if [[ i -eq $field ]]
			then
				row+="$val"
			else
				row+="$val:"
			fi
		done
		echo $row>>$table
		clear
		echo "The record is inserted to $table successfully :)"
		echo "Insert another record?"
		select check in "Yes" "No"
		do
			case $check in
				"Yes" ) clear ;cd ..; source insertTable.sh    ; clear ; break;;
				"No" ) clear; echo "######### Table Option $table ########### "; cd ..; source select.sh     ; clear ; break;;
				* ) echo "Invalid choice";
			esac
		done
	else
		echo "There is no table with this name!"
		select val in "Re-enter name of table" "Back to MENU"
		do
			case $val in
				"Re-enter name of table" ) clear ;cd ..;  source insertTable.sh    ; clear ; break;;
				"Back to MENU" ) clear ;cd ..;  source tableInfo.sh ; clear ; break;;
				* ) echo "Invalid choice"
			esac
		done
	fi
fi