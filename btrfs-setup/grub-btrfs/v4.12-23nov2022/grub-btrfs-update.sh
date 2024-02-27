#!/bin/bash

echo
echo "================> Create the grub-btrfs-update service"

sudo mv grub-btrfs-update.service /etc/systemd/system/

echo
echo "================> Reload the service files to include the new service"
sudo systemctl daemon-reload

echo
echo "================> Start the grub-btrfs-update service"
sudo systemctl start grub-btrfs-update.service

echo
echo "================> Enable the grub-btrfs-update service on every reboot"
echo
sudo systemctl enable grub-btrfs-update.service

echo
echo "================> Check the status of the grub-btrfs-update service"
echo
sudo systemctl status grub-btrfs-update.service
