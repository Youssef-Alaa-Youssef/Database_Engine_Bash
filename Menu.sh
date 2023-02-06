#!/bin/bash
###################################  Main Menu  ###################################

echo "### Main Menu ###"
echo "Please Enter the Number of Choice : "
select option in "Create DataBase" "Show" "Use To Datbase"  "Drop Database" "Exit"

do
    
    case $option in
        "Create DataBase")
           clear ; source createDB.sh ; 
            ;;
               "Show")
           clear ; source showDB.sh
            ;;
            "Use To Datbase")
            clear ; source useDB.sh
            ;;
     
        "Drop Database")
            clear ; source DeleteDB.sh 
            ;;  
        "Exit")
            echo "Thanks" ; exit
            ;;
        *)  clear ; echo "Incorrect Choice try again" ; source Menu.sh ; break;;
    esac
done

