#!/bin/bash
#Create by R.I.P_C on 2018/06/01
echo -e "\033[34mFile Finder v1.1.5 by R.I.P_C\033[0m"
echo -e "\033[31m$LOGNAME\033[0m on `date`"
echo

read -p "Input DIR path: " dir

if [ -d $dir ];then
    echo -e "\033[32mDIR FOUND!\033[0m"
else
    echo -e "\033[31mDIR NOT FOUND!\033[0m"
    exit
fi

read -p "Input FILE name: " file

for i in `find $dir -name "$file"`
do

    echo $i

done

echo -e "\033[33mALL DONE\033[0m"

