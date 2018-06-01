#!/bin/bash
#Create by R.I.P_C on 2018/06/01

read -p "Input DIR path: " dir
read -p "Input FILE name: " file

for i in `find $dir -name "$file"`
do

    echo $i

done
