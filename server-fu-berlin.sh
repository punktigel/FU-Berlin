#!/bin/bash

#Colors
colred='\e[0;31m' # Red
colgre='\e[0;32m' # Green
colyel='\e[0;33m' # Yellow
colblu='\e[0;34m' # Blue
colwht='\e[0;37m' # White
colcyn='\e[0;36m' # Cyan

# Syntax
help(){
	echo -e "\n${colwht}Syntax:"
	echo -e "${colgre}Login:${colwht}"
	echo -e "./server-fu-berlin.sh ${colred}<name> -l${colwht}"

	echo -e "\n${colgre}Copy:${colwht}"
	echo -e "./server-fu-berlin.sh ${colred}<name> ${colcyn}[<pathDir>] [<pathServer>]${colyel}"
	echo -e "\nYour name is allways required!${colwht}"
	echo "Press any key to quit.."
	read wait
}

# Login or Copy
if [ "$1" == "" ];then
	echo -e "\n${colred}You forgot your name!"
	help
elif [ "$1" == "-h" ];then
	help
else
	if [ "$2" == "-l" ];then
		echo "Connecting .."
		ssh $1@andorra.imp.fu-berlin.de
	else
		cd ..
		echo -e "\nYour files"
		if [ "$2" != "" ];then
			cd $2
		fi
		ls
		echo -e "\nInput files: (Quit: ${colcyn}q${colwht} | ${colcyn}exit${colwht})"
		read -r files

		if [[ "$files" != "q" && "$files" != "exit" ]];then
		       scp $files $1@andorra.imp.fu-berlin.de:$3
		fi	       
	fi
fi
echo "Quiting .."
sleep 1
