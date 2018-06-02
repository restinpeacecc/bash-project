#!/bin/bash
#Created by R.I.P_C on 2018/06/02


PS3="Select 1~4: "

select i in "Tar Compress" "Tar List" "Tar Uncompress" "Quit"
do
    case $i in
	"Tar Compress")
	    read -p "Input DIR path: " dir
	    if [ -d $dir ];then
		echo -e "\033[32mDIR FOUND!\033[0m"
		ls -l $dir
	    else
		echo -e "\033[31mDIR NOT FOUND!\033[0m"
		continue
	    fi
	    read -p "Input FILE name: " file
	    read -p "Input TAR name: " tar
	    read -p "Save to:(DIR) " save
	    tar -cJv -f $save$tar.tar.xz $dir$file
	    if [ $? -ne 0 ];then
		echo -e "\033[31mABORT\033[0m"
		rm $save$tar.tar.xz
	    fi
            ;;
	
	"Tar List")
	    read -p "Input DIR path: " dir
	    if [ -d $dir ];then
		echo -e "\033[32mDIR FOUND!\033[0m"
		ls -l $dir
	    else
		echo -e "\033[31mDIR NOT FOUND!\033[0m"
		continue
	    fi
	    read -p "Input TAR name: " tar
	    if [ ! -f "$dir$tar".tar.xz ];then
		echo -e "\033[31mNO SUCH FILE!\033[0m"
		continue
	    fi
	    tar -tJv -f $dir$tar.tar.xz
	    ;;
	
	"Tar Uncompress")
	    read -p "Input DIR path: " dir
	    if [ -d $dir ];then
		echo -e "\033[32mDIR FOUND!\033[0m"
		ls -l $dir
	    else
		echo -e "\033[31mDIR NOT FOUND!\033[0m"
		continue
	    fi
	    read -p "Input TAR name: " tar
	    if [ ! -f "$dir$tar".tar.xz ];then
	        echo -e "\033[31mNO SUCH FILE!\033[0m"
		continue
	    fi
	    read -p "Save to:(DIR) " save
	    if [ ! -d $save ];then
		echo "DIR not found,making..."
		mkdir $save
	    fi
	    tar -xJv -f $dir$tar.tar.xz -C $save
	    ;;
	
	Quit) echo -e "\033[32mSee You!\033[0m"
	      exit
	;;
	* ) echo -e "\033[33mInput 1~4 please\033[0m"
    esac
done

