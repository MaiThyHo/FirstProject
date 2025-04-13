#!/bin/bash

echo "Welcome to the calculator"

# function to display the menu
show_menu() {
    echo "Please choose operation:"
    echo ""
    echo "1. Addition +"
    echo "2. Subtraction -"
    echo "3. Multiplication *"
    echo "4. Division /"
    echo "5. Exponentiation ^"
    echo "6. Exit"
    echo ""
}

# function to perform the calculation
calculate() {
    read -p "Enter first number: " num1
    read -p "Enter second number: " num2

    case $1 in
        1)
            operator="+"
            result=$(echo "$num1 + $num2" | bc)
            echo "Result: $num1 $operator $num2 = $result"
            ;;
        2)
            result=$(echo "$num1 - $num2" | bc)
            echo "Result: $num1 - $num2 = $result"
            ;;       
        3)
            result=$(echo "$num1 * $num2" | bc)
            echo "Result: $num1 * $num2 = $result"
            ;;        
        4)
            #add error handling for division by zero
            if [[ "$num2" == 0 ]]; then
                echo "Cannot divide by zero!"
            else
                result=$(echo "scale=2; $num1 / $num2" | bc)
                echo "Result: $num1 / $num2 = $result"
            fi
            ;;   
        5)
            result=$(echo "$num1 ^ $num2" | bc -l)
            echo "Result: $num1 ^ $num2 = $result"
            ;;   
    esac
}

# Main loop
while true; do
    show_menu
    read -p "Choose an option (1-6): " choice
    if [[ "$choice" == 6 ]]; then
        echo "Goodbye!"
        break
    fi
    
    if ! [[ "$choice" =~ ^[1-5]$ ]]; then
        echo "Invalid choice. Please choose from 1 to 6"
        continue
    fi

    calculate $choice
    echo ""
done