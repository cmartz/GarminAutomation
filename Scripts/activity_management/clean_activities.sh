#!/bin/bash

echo "Preparing to wipe the activities directory. Have you uploaded all files?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) echo "Wiping!"; break;;
        No ) echo "Aborting!"; exit;;
     esac
done