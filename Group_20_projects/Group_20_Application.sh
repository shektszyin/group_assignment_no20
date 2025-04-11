# Function to greet user and verify password
greet(){

    correct_pw="w22"        # Set the correct password
    attempt=0               # Initialize attempt counter
    max_attempt=3           # Set the max allowed attempts
    displaycount=3          # For showing attempts left

    clear
    echo 
    echo "HI welcome to No.20 group assignment"
    echo 
    sleep 0.5
    
    while [ $attempt -lt $max_attempt ]; do
        read -p "Please enter your password: " input_pw
        echo

        if [[ $input_pw == $correct_pw ]]; then
            echo "Welcome to menu!!!"
            echo
            main           # Go to main menu if correct
        else
            attempt=$((attempt + 1))
            displaycount=$((displaycount - 1))
            echo "Only $displaycount attempt left"
            echo
        fi
    done

    # If failed 3 times, exit
    echo "I'm sorry. Please remember your password then come back."
    exit 1  
}

# Main menu
main(){
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
            H | h) question1 ;;     # Hexagonal numbers
            S | s) question2 ;;     # Square numbers
            Q | q) question3 ;;     # Quadratic sequence
            X | x) exit_door ;;     # Exit
            *) echo "Invaild! Please enter a vaild option. ";;
        esac  
    done
}

# Exit function
exit_door(){
    clear
    echo "Have a good one!"
    sleep 2
    clear
    exit 1
}

# Question 1 - Hexagonal numbers
question1(){
    clear
    echo
    echo "You selected option 1"
    echo
    sleep 0.5
    echo

    # Function to check if a number is in range
    is_in_range() {
        local num=$1
        local start=$2
        local end=$3
        if (( num >= start && num <= end )); then
            return 0
        else
            return 1
        fi
    }

    # Ask user for range
    read -p "Enter the start of the range (a): " a
    read -p "Enter the end of the range (b): " b

    # Counters and sums for stats
    odd_count=0
    even_count=0
    odd_sum=0
    even_sum=0

    echo ""
    echo "Hexagonal numbers in the range [$a, $b]:"
    echo "-----------------------------------------"

    n=1
    while :; do
        hex_num=$(( n * (2 * n - 1) ))  # Formula for hexagonal number
        if (( hex_num > b )); then
            break
        fi

        if is_in_range "$hex_num" "$a" "$b"; then
            if (( hex_num % 2 == 0 )); then
                echo "$hex_num is EVEN"
                ((even_count++))
                ((even_sum += hex_num))
            else
                echo "$hex_num is ODD"
                ((odd_count++))
                ((odd_sum += hex_num))
            fi
        fi

        ((n++))
    done

    # Show summary
    echo ""
    echo "Summary:"
    echo "--------"
    echo "Total ODD hexagonal numbers: $odd_count"
    echo "Total EVEN hexagonal numbers: $even_count"
    echo "Sum of ODD hexagonal numbers: $odd_sum"
    echo "Sum of EVEN hexagonal numbers: $even_sum"

    # Ask to continue
    echo
    echo "Stay? (1) "
    echo "Back to menu (random input) "
    echo "exit (X/x) "
    read decision
    case $decision in 
        1) question1;;
        X | x) exit_door;;
        *) main;;
    esac 
}

# Question 2 - Square numbers and checks
question2(){
    clear
    echo
    echo "You selected option 2"
    echo
    sleep 0.5

    # Input function
    input(){
        read -p "Start position value: " start_position
        read -p "How many you want to print? " target_print
        read -p "Please enter a positive integer for checking: " integer_x
        read -p "Please enter a maximum value: " max_val 
    }

    # Main logic for square numbers
    square(){
        tem_start_position=$start_position
        new_position=$start_position
        printed_count=0
        square_number_string=' '
        factor_string=''

        echo
        echo "===================="
        echo "Square number at odd positions: "

        while [ $printed_count -lt $target_print ]; do
            square_number=$((tem_start_position * tem_start_position))

            if [ $new_position -ge $start_position ] && [ $((new_position % 2)) -ne 0 ]; then
                square_number_string+=" $square_number"
                if [ $((integer_x % $square_number)) -eq 0 ]; then
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

        # Check for sum of consecutive squares
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

    # Loop until valid input
    task2main(){
        clear
        while true; do
            input
            if [[ "$start_position" =~ ^[0-9]+$ ]] && [[ "$target_print" =~ ^[0-9]+$ ]] && \
               [[ "$integer_x" =~ ^[0-9]+$ ]] && [[ "$max_val" =~ ^[0-9]+$ ]]; then
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

    # Ask to continue
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

# Question 3 - Placeholder
question3(){
    clear
    echo
    echo "You selected option 3"
    echo
    sleep 0.5
    echo
         input(){
     read -p "Enter a non-negative integer for a: " var_a
     read -p "Enter a non-negative integer for b: " var_b
     read -p "Enter a non-negative integer for c: " var_c
     read -p "Enter the minimum range: " n1
     read -p "Enter the maximum range: " n2
     read -p "Enter a variable to be checked if it's a multiple of the product: " var_x
     }
     
     
     quadratic_sequence(){
             
         prime_num_count=0
         num_string=''
         first_num_check=$n1

         while [ $n1 -le $n2 ]; do
             # Calculating the quadratic sequence
             power_of_two=$(( n1 * n1 ))
             a_calc=$(( $var_a * $power_of_two ))
             b_calc=$(( $var_b * $n1 ))
             quad_seq_sum=$((a_calc + $b_calc + $var_c))
             
             prime_checker

             #Checks if it's the first sum
             if [ $n1 -eq $n2 ]; then
                 last_num=$quad_seq_sum
             fi

             # Checks if it's the last sum
             if [ $first_num_check -eq $n1 ]; then
                 first_num=$quad_seq_sum
             fi
         
             n1=$(($n1 + 1))
         done
         
         product=$(($first_num * last_num))
         
         echo
         echo "==============="
         echo "Sums for numbers of the range provided: $num_string "
         echo "Number of sums that are prime numbers: $prime_num_count"
         echo "Product of the first and last numbers: $product "
         multiple_check
     }
     
     
     prime_checker(){
         y=0
         for ((i = 2; i < $quad_seq_sum; i++)); # loop to run through all the possible numbers that could potentially be a factor
         do
             if [ $(($quad_seq_sum % i)) -eq 0 ]; then
                 y=$(($y + 1))
             fi
         done
         
         if [ $y -eq 0 ]; then
             prime_num_count=$((prime_num_count + 1))
         fi
         
         num_string+=" $quad_seq_sum"
     }
     
     multiple_check(){ 
         if [ $((product % $var_x)) -eq 0 ]; then # Checks if x is a multiple of the product
             echo "$product is a multiple of $var_x"
         else
             echo "$product is not a multiple of $var_x"
         fi
     }
     
     
     
     main(){
         clear
         input
     while true; do
        if [[ $var_a =~ ^-?[0-9]+$ ]] && [[ $var_b =~ ^-?[0-9]+$ ]] && [[ $var_c =~ ^-?[0-9]+$ ]] && [[ $n1 =~ ^-?[0-9]+$ ]] && [[ $n2 =~ ^-?[0-9]+$ ]] && [[ $var_x =~ ^-?[0-9]+$ ]]
        then
             if [ $var_a -ge 0 ] && [ $var_b -ge 0 ] && [ $var_c -ge 0 ] && [ $n2 -ge $n1 ]; then
                 quadratic_sequence $var_a $var_b $var_c $n1 $n2
                 break
             elif [ $var_a -lt 0 ] && [ $var_b -lt 0 ] && [ $var_c -lt 0 ] && [ $n2 -lt $n1 ]; then
                 echo "All variables must be positive/invalid range (First N must be less/less than the second N) "
                 main
             fi
         else
             echo "All variables must be positive/invalid range (First N must be less/less than the second N) "
             main
         fi
     done
     
     }
     
     main

     # Ask to continue
     echo
     echo "Stay? (1) "
     echo "Back to menu (random input) "
     echo "exit (X/x) "
     read decision
     case $decision in 
         1) question3;;
         X | x) exit_door;;
         *) main;;
     esac 
     
}

# Start the program
greet
