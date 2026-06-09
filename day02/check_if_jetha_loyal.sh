#!/bin/bash

<< Disclaimer
This is just for infotainment purpose
Disclaimer

read -p "Enter the bandi: " bandi
read -p "Jetha ka payar %: " pyaar

if [[ $bandi == "daya bhabhi" ]];
then 
	echo "Jetha is loyal"
elif [[ $pyaar -ge 100 ]];
then
	echo "Jetha is loyal"
else
	echo "Jetha is not loyal"
fi




