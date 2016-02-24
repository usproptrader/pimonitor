#!/bin/bash
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi


cat  <<END >>/home/pi/.bash_aliases
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'
alias lv='ls /var/www'
alias ce='cd /etc'
alias cm='cd /etc/motion'
alias ch='cd /home/pi'
alias cl='cd /var/log'
alias rv='rm /var/www/*.avi'
alias lsrt='ll |sort -k 6,8'
alias exb='. ./.bash_aliases'
alias pm='ps aux|grep motion'
END
