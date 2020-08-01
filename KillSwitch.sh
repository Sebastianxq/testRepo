#!/bin/bash
#Colors text
CYN='tput setaf 6'
RED='tput setaf 1'
GRN='tput setaf 2'
RST='tput sgr0'
#receives current IP (Didn't want to pay for elastic so this fluctuates)
IP=$(dig +short myip.opendns.com @resolver1.opendns.com)

#Prints Killswitch ~progress~
echo -ne 'Pausing Cryptominers '
echo -ne '#####                     (33%)\r'
sleep 3

echo -ne 'Decrypting Kill Command '
echo -ne '#############             (66%)\r'
sleep 3

echo -ne 'Executing Kill Command '
echo -ne '#######################   (100%)\r'
echo -ne '\n'
sleep 3
echo "$(tput setaf 1)Killswitch Activated, Patriot Act Succesfully Terminated! $(tput sgr 0)"
echo -ne '\n'


echo -e "$(tput setaf 6)Please go to $(tput setaf 3)$IP/confirmation.html $(tput setaf 6)to view more details"

