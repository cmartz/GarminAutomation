#!/bin/bash

newcoursedir="weekly_courses/"
devcoursedir="/Volumes/GARMIN/Garmin/Courses"

if [ -d  "$devcoursedir" ]

  echo "Connected to Garmin!"

else

  echo "Unable to connect to Garmin device."

fi
