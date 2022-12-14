#!/bin/bash
sleep 1
clear
echo "############################################################################"
echo "#                         Grafana Docker Installer                         #"
echo "#                              by Nico L.                                  #"
echo "#                   https://github.com/nilasystem/scripts                  #"
echo "#                          Last Update: 26.06.2022                         #"
echo "############################################################################"
sleep 3
clear 
echo "############################################################################"
echo "#                            Checking for Root                             #"
echo "############################################################################"
if (( $EUID != 0 )); then
echo "############################################################################"
echo "#                            Please run as root                            #"
echo "############################################################################"
    exit
fi
sleep 1
clear
echo "############################################################################"
echo "#                             Checked for Root                             #"
echo "############################################################################"
sleep 2
clear
echo "############################################################################"
echo "#                          Press Enter to continue                         #"
echo "############################################################################"
read continuepress
sleep 1
clear

echo "############################################################################"
echo "#                        Installing Grafana Docker                         #"
echo "############################################################################"
sleep 2
echo "############################################################################"
echo "#                       Server Update (apt update -y)                      #"
echo "############################################################################"
apt update -y
wait -n
echo "############################################################################"
echo "#                       Server Upgrade (apt upgrade -y)                    #"
echo "############################################################################"
apt upgrade -y
wait -n 
echo "############################################################################"
echo "#                           Enter the Name & Port                          #"
echo "############################################################################"
read -p "Please enter Grafana Container Name (grafana is recommended): " grafananame
read -p "Please enter Grafana Port 1 (3000 is recommended): " grafanaport1
echo "############################################################################"
echo "#            Downloading and Installing Grafana Container                  #"
echo "############################################################################"
docker run -d --name=$grafananame -p $grafanaport1:$grafanaport1 grafana/grafana
wait -n 
clear
echo "############################################################################"
echo "#                     Installed Grafana Docker                             #"
echo "#                                                                          #"
echo "#      Grafana Name  | $grafananame                                        #"
echo "#      Grafana Port1 | $grafanaport1                                       #"
echo "#                                                                          #"
echo "############################################################################"

