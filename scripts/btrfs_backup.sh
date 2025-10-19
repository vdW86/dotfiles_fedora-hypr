#!/bin/bash
# Backup script voor root (@) en home (@home) naar externe Btrfs-schijf
# Zorg dat je back-upschijf gemount is op /mnt/backupdisk
 
# Mountpoint van back-upschijf
BACKUP_MOUNT="/mnt/backupdisk" 
 
# Lokale snapshotmap (tijdelijke opslag voor snapshots)
LOCAL_SNAP="/.snapshots"
 
# Datum voor snapshots
DATE=$(date +%Y%m%d-%H%M)
 
# Controleer of back-upschijf gemount is
if ! mount | grep -q "$BACKUP_MOUNT"; then
    echo "Fout: back-upschijf $BACKUP_MOUNT is niet gemount!"
    exit 1
fi
 
# Maak lokale snapshotmap als die nog niet bestaat
sudo mkdir -p "$LOCAL_SNAP"
 
# ---- Root snapshot ----
echo ">>> Snapshot van root (/)"
sudo btrfs subvolume snapshot -r / "$LOCAL_SNAP/root-$DATE"
 
# ---- Home snapshot ----
echo ">>> Snapshot van home (/home)"
sudo btrfs subvolume snapshot -r /home "$LOCAL_SNAP/home-$DATE"
 
# ---- Stuur snapshots naar back-upschijf ----
echo ">>> Stuur root snapshot naar back-upschijf"
sudo btrfs send "$LOCAL_SNAP/root-$DATE" | sudo btrfs receive "$BACKUP_MOUNT/"
 
echo ">>> Stuur home snapshot naar back-upschijf"
sudo btrfs send "$LOCAL_SNAP/home-$DATE" | sudo btrfs receive "$BACKUP_MOUNT/"
 
echo ">>> Backup klaar!"
 
# Optioneel: oude lokale snapshots verwijderen (niet de back-up)
#sudo btrfs subvolume delete "$LOCAL_SNAP/root-$DATE"
#sudo btrfs subvolume delete "$LOCAL_SNAP/home-$DATE"
