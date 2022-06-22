#!/bin/bash
# TellMe
# by wondR
TARGET="$1"
SUB="sub.txt"
IPS="ips.txt"
OKBLUE='\033[94m'
OKRED='\033[91m'
OKGREEN='\033[92m'
OKORANGE='\033[93m'
RESET='\e[0m'

lolcat <<"EOF"

╔╦╗┌─┐┬  ┬     
 ║ ├┤ │  │     
 ╩ └─┘┴─┘┴─┘   
╔╦╗┌─┐         
║║║├┤          
╩ ╩└─┘         
┬ ┬┬ ┬┌─┐      
│││├─┤│ │      
└┴┘┴ ┴└─┘      
╦┌┬┐           
║│││           
╩┴ ┴           
┌─┐┌─┐┌┐┌┌┐┌┌─┐
│ ┬│ │││││││├─┤
└─┘└─┘┘└┘┘└┘┴ ┴
┬ ┬┌─┐┌─┐┬┌─   
├─┤├─┤│  ├┴┐   
┴ ┴┴ ┴└─┘┴ ┴   

EOF

</br>

echo -e "$OKRED +---Collecting subdomains---+ $RESET"

        python3 /usr/lib/python3/dist-packages/sublist3r.py -v -d $TARGET -o sub.txt

</br>

if [ -z "$SUB" ];
        then
                echo -e "$OKGREEN + -- --=[No subdomains was found..exiting.$RESET";
                exit
        else         
                echo -e "$OKBLUE +---Attributing IPs---+ $RESET"
                getips -d $SUB -o ips.txt -v
        fi

</br>

if [ -z "$IPS" ];
        then
                echo -e "$OKGREEN + -- --=[No IPs can be reach..exiting.$RESET";
                exit
        else         
                echo -e "$OKORANGE +---Starting Nmap---+ $RESET"
                nmap -v -iL $IPS -oN results.txt
        fi

</br>

echo -e "$OKBLUE +---Done! Results saved in results.txt---+ $RESET"
