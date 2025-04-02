greet(){


    correct_pw="w22"
    attempt=0
    max_attempt=3
    displaycount=3

    clear
    echo 
    echo "HI welcome to No.20 group assignment"
    echo 
    sleep 0.5
    
    while [ $attempt -lt $max_attempt ];do
    read -p "Please enter your password: " input_pw
    echo

    if [[ $input_pw == $correct_pw ]];then
    echo "Welcome to menu!!!"
    echo
    main
    else
        attempt=$((attempt + 1))
        displaycount=$((displaycount - 1))
        echo "Only $displaycount attempt left"
        echo
    fi
    done

    echo "I'm sorry. Please remember your password then come back."
    exit 1  
}

main(){
    # read -p "Which task you want to check?(H,S,Q,h,s,q) " task_signal

    while true; do
    clear
    echo "  ===Group 20 Assignment==="
    echo "Option 1: Hexagonal numbers (H/h)"
    echo "Option 2: Square numbers (S or s)"
    echo "Option 3: Quadratic sequence (Q/q)"
    echo "Exit (X/x)"
    echo
    read -p "Please enter your choice: " task_signal

    case $task_signal in 
    H | h) question1 ;;
    S | s) question2 ;;
    Q | q) question3 ;;
    X | x) exit_door;;
    *) echo "Invaild! Please enter a vaild option. ";;
    esac  

    done
}

exit_door(){
    clear
    echo "Have a good one!"
    sleep 2
    clear
    exit 1
}



question1(){
    clear
    echo
    echo "You selected option 1"
    echo
    sleep 0.5
    echo
    read -p "Do you want to continue (random input) or exit(X/x)? " decision
    
    case $decision in 
    X | x) exit_door;;
    *) main;;
    esac  

}

question2(){
    clear
    echo
    echo "You selected option 2"
    echo
    sleep 0.5


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
             if [ $sum -gt $max_val ]; then
                 break
            fi
            consecutive_string+="$square1 + $square2 = $sum\n"
            count=$((count + 1))
            st_number=$((st_number + 1))
            done
        echo -e $consecutive_string
        echo "Total number found: $count"

        }
        task2main(){
            clear
            
        while true; do
             input
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
        fi

        done

        }

        task2main

        echo
        echo "Stay? (1) "
        echo "Back to menu (random input) "
        echo "exit (X/x) "
    
        read decision
    
        case $decision in 
        1) question2;;
        X | x) exit_door;;
        *) main;;
        esac 
}

question3(){
    clear
    echo
    echo "You selected option 3"
    echo
    sleep 0.5
    echo
    read -p "Do you want to continue (random input) or exit(X/x)? " decision
    
    case $decision in 
    X | x) exit_door;;
    *) main;;
    esac  
}

greet