#! /bin/bash

###################################
# VARS --> OK
###################################

# use variables
source vars.dev.sh
# test a var
echo $HOSTNAME
echo "return code of l10 is $?"

# ###################################
# # update upgrade --> OK
# ###################################

apt-get -y update && apt -y upgrade
echo "return code of l17 is $?"


# ###################################
# # custom install --> OK
# ###################################

apt-get -y install nano htop curl wget ufw sudo zsh screen vim screen inxi apt-transport-https ca-certificates curl gnupg-agent software-properties-common
echo "return code of l25 is $?"
# NOT WORKING : # apt-get -y install whoami scp su


# ###################################
# # Hots and hostname --> OK
# ###################################

echo $HOSTNAME > /etc/hostname && echo $HOSTNAME > /etc/host
echo "return code of l34 is $?"

# ###################################
# # localtime --> OK
# ###################################

rm -f /etc/localtime && ln -sf /usr/share/zoneinfo/Europe/Paris /etc/localtime
echo "return code of l41 is $?"

###################################
# admin create USER
###################################

# make encr pass 
pass=$(perl -e 'print crypt($ARGV[0], "password")' $USER_PASSWD)

# make user 
useradd -m -s /bin/bash -p $pass $USER && usermod -aG sudo $USER
echo "return code of l52 is $?"
# no sudo passwd 
echo $USER 'ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
echo "return code of l55 is $?" && tail -n 1 /etc/sudoers 

###################################
# docker --> OK
###################################

# docker
apt -y remove docker docker-engine docker.io
echo "return code of 63 is $?"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
apt -y install docker-ce docker-ce-cli containerd.io
echo "return code of 65 is $?"
sh get-docker.sh && 
usermod -aG docker $USER
docker run hello-world
echo "return code of 71 is $?"
# rm get-docker.sh

# compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.26.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
docker-compose --version

###################################
# ufw
###################################

ufw default deny incoming
ufw default allow outgoing
ufw allow $SSH_PORT/tcp
# NOT THIS ONE ELSE CONNECTION BROKEN
sudo ufw enable


###################################
# manage ssh connections 
###################################

# permit root no
# redirect port 
# only ssh no login
# allow only user

# user
su $USER
cd 
mkdir .ssh
ssh-keygen -t ecdsa -b 384 -q -N "" -f /home/$USER/.ssh/id_rsa
cat $USER_ID_RSA_PUB > .ssh/authorized_keys


###################################
# git config
###################################

cd ~/
git user
git passwd
git push ssh 
git clone   


####################################
# reload and reboot
####################################

exit
# ufw reload
# ufw enable
systemctl restart ufw.service
systemctl restart ssh
reboot


####################################
# sleep
####################################

sleep 30

