
input(){
read -p "Start position value: " start_position
read -p "How many you want to print? " target_print
read -p "Please enter a positive integer for checking: " integer_x
read -p "Please enter a maximum value: " max_val 
}

square(){


tem_start_position=$start_position
new_position=$start_position
printed_count=0
square_number_string=' '
factor_string=''

echo
echo "===================="
echo "Square number at odd positions: "

while [ $printed_count -lt $target_print ];do
    square_number=$((tem_start_position * tem_start_position))

    if [ $new_position -ge $start_position ] && [ $((new_position % 2)) -ne 0 ];then
    square_number_string+=" $square_number"


    if [ $((integer_x % $square_number)) -eq 0 ];then
    factor_string+="$square_number is a factor of $integer_x\n"
    fi


    printed_count=$((printed_count + 1))

    fi

    tem_start_position=$((tem_start_position + 1))
    new_position=$((new_position + 1))

done

echo $square_number_string
echo -e $factor_string

echo
echo

st_number=1
consecutive_string=''
sum=0
count=0


echo "===================="
echo "Numbers that are the sum of two consecutive squares: "
echo

    while [ $sum -lt $max_val ]; do
    square1=$((st_number * st_number))
    square2=$(( (st_number + 1) * (st_number + 1) ))
    sum=$((square1 + square2))
    consecutive_string+="$square1 + $square2 = $sum\n"
    count=$((count + 1))
    st_number=$((st_number + 1))
    done
echo -e $consecutive_string
echo "Total number found: $count"

}


# stay_leave(){
#     echo
#     read -p "Do you want to stay or leave: " choice

#     case $choice in 
#     S) main ;;
#     *) exit ;;

#     esac




main(){
    clear
    input
while true; do
 if [[ "$start_position" =~ ^[0-9]+$ ]] && [[ "$target_print" =~ ^[0-9]+$ ]] && \
   [[ "$integer_x" =~ ^[0-9]+$ ]] && [[ "$max_val" =~ ^[0-9]+$ ]];then
    flag=true
    square $start_position $target_print $integer_x $max_val
    break 
else
    clear
    echo "Invaild input. "
    echo
    sleep 2
    clear
    main
fi

done

    # stay_leave
}

main