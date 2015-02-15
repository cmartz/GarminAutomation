#!/bin/bash

newcoursedir="weekly_courses"
devcoursedir="/Volumes/GARMIN/Garmin/NewFiles"

if [ -d  "$devcoursedir" ]; then

  echo "Connected to Garmin!"

  # Wipe Garmin courses directory clean
  rm -r $devcoursedir/*

  # Copy updated weekly courses into device
  cp $newcoursedir/* $devcoursedir/

  echo "Courses successfully updated."

else

  echo "Unable to connect to Garmin device."

fi
