#!/bin/bash

################## Create Table #################

read -p "Please Enter Your Table Name ? " TBname
   

# ============================ File is exist ============================

if [ -z $TBname ] || [ "${TBname//[!0-9]}" != "" ] || [[ $TBname =~ ['!@#$%^&*()_+'] ]]
 then
 clear
 echo "#################"
 echo "invalid input (empty) (number) (special character)"
 source createTable.sh
 else
cd $DBName
if [[ -f "$TBname" ]]
then
    echo "It's Exists"
    cd ..
    source tableInfo.sh
else   
	touch $TBname
	row="ID:";
    DataType="int (Not NULL):";

		echo "ID for $TBname is created automatically(PK)"
		x=2
# function insert in table ============================================

		function insert {
			echo "Enter field number $x:"
			read field
			
			while [ -z $field ] || [ "${field//[!0-9]}" != "" ] || [[ $field =~ ['!@#$%^&*()_+'] ]] || [ $field == "ID" ]
			do
				echo "invalid value for field name or Duplicated"
				read field
			done
			row+="$field"
			
	     # data type int or string =======================================

			echo "Choose the datatype:"
			select datatype in "Integer" "String"
			do
				case $datatype in
					"Integer" ) DataType+="int"; break;;
					"String" ) DataType+="string"; break;;
					* ) echo "Invalid choice";insert;
				esac
			done
			#  check Not NULL =================================================

			echo "Choose it can be NULL or not:"
			select prop in "NULL" "Not NULL"
			do
				case $prop in
					"NULL" ) DataType+=""; break;;
					"Not NULL" ) DataType+=" (Not NULL)"; break;;
					* ) echo "Invalid choice";insert;
				esac
			done
			#  add new file ===================================================

			echo "Insert another Column?"
			select check in "Yes" "No"
			do
				case $check in
					"Yes" )  ((x=x+1)) ;
					row+=":";DataType+=":"; insert ; break ;;
					"No" ) break;;
					* ) echo "Invalid choice"; cd .. ; source tableInfo.sh ;
				esac
			done
		
		}
		# =====================================================================
		insert
		echo $row>>$TBname
		echo $DataType>>$TBname
		clear
		echo "table $TBname created successfully "
		echo "######################################################"
cd ..
source tableInfo.sh
fi
fi

