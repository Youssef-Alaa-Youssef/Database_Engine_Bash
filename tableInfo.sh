#!/bin/bash


 select option in "Create Table"  "Show Table" "Use table" "Drop table" "Back To Main Menu"
do
    case $option in
        "Create Table")
           clear ; source createTable.sh  
            ;;
        "Show Table")
            clear ; source showTable.sh
            ;;
            "Use table")
           clear ; source useTable.sh;
            ;;
        "Drop table")
           clear ; source dropTable.sh;
            ;;
        "Back To Main Menu")
            clear ;
             source Menu.sh;
            ;;
        *)  clear ; echo "Incorrect Choice try again" ; source Menu.sh  ;;
    esac
done