#!/bin/bash

# index starts from 0 ,size is 4

FRUITS=("APPLE" "KIWI" "ORANGE") #Array

echo "First fruti is: ${Fruits[0]}"
echo "Second fruti is: ${Fruits[1]}"
echo "Third fruti is: ${Fruits[2]}"
echo "Fourth fruti is: ${Fruits[3]}"

echo "All fruti at  a time: ${Fruits[@]}"