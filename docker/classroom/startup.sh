#!/bin/bash

mkdir -p /home/students/;
mkdir -p /home/speakers/;

groupadd students;
groupadd speakers;

# STUDENTS
ACCOUNTS=`cat /core/students.txt`;
for ENTRY in $ACCOUNTS;
do
  USER=`echo $ENTRY | cut -d':' -f1`;
  PASS=`echo $ENTRY | cut -d':' -f2`;
  HOME_DIR=/home/students/$USER;
  echo creating student $USER;
  echo $USER:$PASS::::$HOME_DIR:/bin/bash | newusers;
  cp /root/.bashrc $HOME_DIR/.bashrc;
  chown -R $USER:$USER $HOME_DIR;
  usermod -a -G students $USER;
  # TODO Copy or link data
done;

ACCOUNTS=`cat /core/speakers.txt`;
for ENTRY in $ACCOUNTS;
do
  USER=`echo $ENTRY | cut -d':' -f1`;
  PASS=`echo $ENTRY | cut -d':' -f2`;
  HOME_DIR=/home/speakers/$USER;
  echo creating speaker $USER;
  echo $USER:$PASS::::$HOME_DIR:/bin/bash | newusers;
  cp /root/.bashrc $HOME_DIR/.bashrc;
  chown -R $USER:$USER $HOME_DIR;
  usermod -a -G speakers $USER;
  # TODO Copy or link data
done;
rm /startup.sh

bash
