#!/bin/bash

newcoursedir="weekly_courses/"
devcoursedir="/Volumes/GARMIN/Garmin/Courses"

if [ -d  "$devcoursedir" ]

  echo "Connected to Garmin!"

  # Wipe Garmin courses directory clean
  rm -r $devcoursedir/*

  # Copy updated weekly courses into device
  cp $newcourse/* $devcoursedir

  echo "Courses successfully updated."

else

  echo "Unable to connect to Garmin device."

fi
