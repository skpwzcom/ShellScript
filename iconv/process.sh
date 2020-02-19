#!/bin/bash

f=$(ls -l | grep -v 总用量 | grep -v res | grep -v process.sh | awk '{print $9}')

if [ -z $1 ];then
	echo "请输入命令"
	exit 1
fi

res=$(ls -d res 2> /dev/null)
if [ -z $res ];then
	mkdir res
fi


for file in $f; do
	if [ $1 = "u-i" ];then 
		iconv -f utf-8 -t gb18030 $file -o "./res/$file" 
	elif [ $1 = "i-u" ];then
		iconv -f gb18030 -t utf-8 $file -o "./res/$file"
	else
		echo "错误命令"
		exit 2
	fi
done

exit 0
