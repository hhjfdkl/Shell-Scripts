#!/bin/bash

echo
echo "#########################################"
echo "Started $(date)"
echo "#########################################"
echo "Running Update Command"
echo "#########################################"
sudo apt update
echo "#########################################"
echo "Running Upgrade Command"
echo "#########################################"
sudo apt upgrade -y
echo "#########################################"
echo "Running Autoclean Command"
echo "#########################################"
sudo apt autoclean -y
echo "#########################################"
echo "Updates complete"
echo "#########################################"
echo "Finished $(date)"
echo "#########################################"
