#!/bin/bash
#Created by R.I.P_C on 2018/06/02
echo -e "\033[32mAuto-Tar v.1.2.3 by R.I.P_C\033[0m"
echo -e "\033[31m$LOGNAME\033[0m on `date`"
echo

PS3="Select 1~4: "

select i in "Tar Compress" "Tar List" "Tar Uncompress" "Quit"
do
    case $i in
	"Tar Compress")
	    read -p "Input DIR path:(If null,will set the DIR to `pwd`) " dir
	    if [ -z $dir ];then
		dir=`pwd`
		ls -l $dir
	    else
	        if [ -d $dir ];then
		    echo -e "\033[32mDIR FOUND!\033[0m"
		    ls -l $dir
	        else
		    echo -e "\033[31mDIR NOT FOUND!\033[0m"
		    continue
	        fi
	    fi
	    read -p "Input FILE name: " file
	    if [ -z "$file" ];then
		echo -e "\033[31mFILE CANNOT BE NULL!\033[0m"
		continue
	    fi
	    read -p "Input TAR name: " tar
	    if [ -z $tar ];then
		echo -e "\033[31mTAR NAME CANNOT BE NULL!\033[0m"
		continue
	    fi
	    read -p "Save to:(If null,will save to `pwd`) " save
	    if [ ! -d $save ];then
		echo "DIR not found,making..."
		mkdir $save
	    fi
	    cd $dir
	    tar -cJv -f $save$tar.tar.xz $file
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
		    if [ $? -ne 0 ];then
			echo -e "\033[31mABORT\033[0m"
			continue
		    fi
	        fi
	    fi
	    tar -xJv -f $dir$tar.tar.xz -C $save
            echo -e "\033[32mALL DONE!\033[0m"
	    ;;
	
	Quit) echo -e "\033[32mSee You!\033[0m"
	      exit
	;;
	* ) echo -e "\033[35mUseage: 1)Tar Compress 2)Tar List 3)Tar Uncompress 4)Quit\033[0m"
    esac
done

