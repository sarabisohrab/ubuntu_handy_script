#!/bin/bash
# Removes old revisions of snaps and cleans junks
# CLOSE ALL SNAPS BEFORE RUNNING THIS
set -eu
echo "Remove old snap packages:\n";
LANG=C snap list --all | awk '/disabled/{print $1, $3}' |
    while read snapname revision; do
        sudo snap remove "$snapname" --revision="$revision";
    done 
    
echo "\n\nApt cleaning:\n";
sudo apt clean;

echo "\n\nApt autoremove:\n";
sudo apt autoremove;

echo "\n\nApt autoclean:\n";
sudo apt autoclean;
