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
        power_of_two=$(( n1 * n1 ))
        a_calc=$(( $var_a * $power_of_two ))
        b_calc=$(( $var_b * $n1 ))
        quad_seq_sum=$((a_calc + $b_calc + $var_c))
        
        prime_checker
        
        if [ $n1 -eq $n2 ]; then
            last_num=$quad_seq_sum
        fi
        
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

main
