#!/bin/bash
set -x
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

ntpd -q -g
apt-get -y   update
apt-get -y   upgrade
apt-get -y   purge wolfram-engine
apt-get -y   purge libreoffice
apt-get -y   autoremove
apt-get  -y   install wpagui
apt-get -y   install tightvncserver
cp tightvncserver /etc/init.d/
chmod 755 /etc/init.d/tightvncserver
update-rc.d tightvncserver defaults
# pssdw raspvnc

apt-get -y  install  matchbox
apt-get -y  install autocutsel
apt-get -y  install sysstat
apt-get -y  install perl libnet-ssleay-perl openssl libauthen-pam-perl 
apt-get -y  install libpam-runtime libio-pty-perl apt-show-versions python
wget http://prdownloads.sourceforge.net/webadmin/webmin_1.780_all.deb
dpkg --install webmin_1.780_all.deb
apt-get -y install nmap
apt-get -y install ssmtp
apt-get -y install mailutils
apt-get -y install samba
apt-get -y install motion
mkdir /var/run/motion
# change /etc/default/motion/motion to yes
#service motion restart
#add lines to /root/.bashrc for .bash_aliases
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
apt-get install libgdk-pixbuf2.0-dev
gdk-pixbuf-query-loaders --update-cache



set +x

