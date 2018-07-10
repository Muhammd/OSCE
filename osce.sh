#!/bin/bash

#: OSCE Regestration Challange1 :/

clear
cd /tmp

URL=http://www.fc4.me/index.php	#: Declaring variable for getting source files
URL1=http://www.fc4.me/fc4.js


wget $URL			#: Geting the files
wget $URL1


VUL1=`cat index.php |grep srvstr |cut -c 29-54`	#: prashing the file for required strings

VUL2=`cat fc4.js |grep hex |cut -c 59-94`

VUL3=`printf "%b\n" "$VUL2"`

ANS="$VUL3$VUL1"


#: Now we get the MD5 digest for the required string

wget "http://scriptserver.mainframe8.com/md5.php?phrase=$ANS&button=MD5+encode"
	
vulstring=`cat md* |grep stro | cut -c 12-43`


echo -e "&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&"
echo
echo -e "srvstr value for you is: $VUL1"
echo -e "Hex value in js file is: $VUL2"
echo -e "Security String = $vulstring"
echo
echo -e "&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&"

#: muhammd
