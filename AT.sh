#!/bin/bash
#Created by R.I.P_C on 2018/06/02


PS3="Select 1~4: "

select i in "Tar Compress" "Tar List" "Tar Uncompress" "Quit"
do
    case $i in
	"Tar Compress")
	    read -p "Input DIR path:(If null,will set the DIR to `pwd`) " dir
	    if [ -d $dir ];then
		echo -e "\033[32mDIR FOUND!\033[0m"
		ls -l $dir
	    else
		echo -e "\033[31mDIR NOT FOUND!\033[0m"
		continue
	    fi
	    read -p "Input FILE name:(If null,will compress everything in "$dir") " file
	    read -p "Input TAR name: " tar
	    if [ -z $tar ];then
		echo -e "\033[31mTAR NAME CANNOT BE NULL!\033[0m"
		continue
	    fi
	    read -p "Save to:(If null,will save to `pwd`) " save
	    tar -cJv -f $save$tar.tar.xz $dir$file
	    if [ $? -ne 0 ];then
		echo -e "\033[31mABORT\033[0m"
		rm $save$tar.tar.xz
		continue
	    fi
            echo -e "\033[32mALL DONE!\033[0m"
	    ;;
	
	"Tar List")
	    read -p "Input DIR path:(If null,will set the DIR to `pwd`) " dir
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
            echo -e "\033[32mALL DONE!\033[0m"
	    ;;
	
	"Tar Uncompress")
	    read -p "Input DIR path:(If null,will set the DIR to `pwd`) " dir
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
	    if [ -z $save ];then
		echo -e "\033[31mDIR CANNOT BE NULL!\033[0m"
		continue
	    else
	        if [ ! -d $save ];then
		    echo -e "\033[33mDIR not found,making...\033[0m"
		    mkdir $save
	        fi
	    fi
	    tar -xJv -f $dir$tar.tar.xz -C $save
            echo -e "\033[32mALL DONE!\033[0m"
	    ;;
	
	Quit) echo -e "\033[32mSee You!\033[0m"
	      exit
	;;
	* ) echo -e "\033[33mInput 1~4 please\033[0m"
    esac
done

