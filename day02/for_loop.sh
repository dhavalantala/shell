#!/bin/bash

# This is for and while loops

# mkdir  demo1/2/3/4/5

<< task
$1 is argumet 1 which is folder name 
$2 is start range
$3 is end range
task

for (( num=$2 ; num<=$3; num++ ));
do
	mkdir "$1$num"
done 

