#!/bin/bash

num = 0
while [[ $((num % 2)) -eq 0 && $num -le 10 ]]
do
        echo $num
        # To print even numbers, increment by 2 instead of 1
        num=$(( num + 2 ))
done


