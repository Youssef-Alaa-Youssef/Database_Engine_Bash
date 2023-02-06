 cd $DBName
 select option in "Insert Table"  "Update Table" "Show Table" "Drop From Table" "Back To Table Options"
do
    case $option in
        "Insert Table")
           clear ;
           cd ..;
            source insertTable.sh
            ;;
        "Update Table")
            clear ;
             cd ..; source updateTable.sh;
            ;;
            "Show Table")
            clear;
             cd ..;source catTable.sh
            ;;
            "Drop From Table")
            clear;
             cd ..;source dropRecord.sh
            ;;
        "Back To Table Options")
            clear ;
            echo "######################### Welcome $DBName ################################";
             cd ..;
             source tableInfo.sh
            ;;
        *)  clear ; echo "Incorrect Choice try again" ;
         cd ..; source Menu.sh  ;;
    esac
done