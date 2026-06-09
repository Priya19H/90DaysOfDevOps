#!/bin/bash

read -p "Please Enter Number : " Number

while [ $Number -ge 0 ]
do
	echo "Countdown $Number..!"
	Number=$((Number - 1))
done	
