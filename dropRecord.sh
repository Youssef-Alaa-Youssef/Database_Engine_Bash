#!/bin/bash

cd $DBName

read -p "Enter Your Record will be deleted :"   dropRecord
while ! [ "${dropRecord//[!0-9]}" != "" ]
do
   echo "record must be a number & please enter your value correct"

   read dropRecord
   
done
# ========================================================= #
   if [[ ` awk -F : '{print $0}' $table | awk -F : '{print $1}' | grep $dropRecord ` ]]
   then
      sed -i "/^$dropRecord/d" $table
      echo  record deleted
      cd ..
      source select.sh
   else
        echo "try again please (record not found)"
        cd ..
        select r in "Try Again" "GO to table Menu"
        do
         case $r in 
          "Try Again")
            clear;
            source dropRecord.sh
            ;;
         "GO to table Menu")
            clear;
            source select.sh
            ;;
         *)
         echo invalid input
         ;;
         esac
      done
   fi
#  #========================================================= #




