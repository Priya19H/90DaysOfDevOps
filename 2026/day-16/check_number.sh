#!/bin/bash

read -p "Enter Number:" Number

if [ $Number -ge 0 ]; then
	if [  $Number -eq 0 ]; then
		echo " $Number is Zero "
	else
		echo "$Number is positive"
	fi
else
	echo "$Number is negative"
fi
