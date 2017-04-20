#!/bin/sh
updatefile="c:/my/update"
if [ ! -d c:/my ];
then 
	mkdir -p c:/my;
fi

find E:/Users/Administrator/Workspaces/MyEclipse\ 10/jxhbwf/WebRoot/ -type f -mtime -1 -exec ls -l {} \; | awk '{print $9","$10}'> "${updatefile}"

for i in $( cat "$updatefile");
do 
	file=$(echo "$i" | sed -r 's/,/ /g' );
	dir=$(echo ${file%/*} | sed -r 's/.*WebRoot/c:\/my/');
	echo "$dir";
	if [ ! -d "$dir" ] ;
	then 
		echo 'exist';
		mkdir -p "$dir";
	fi
	cp "$file" "$dir";
done;


zip -r c:/my/update.zip c:/my/*