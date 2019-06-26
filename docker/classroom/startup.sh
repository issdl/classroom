#!/bin/bash

mkdir -p /home/students/;
mkdir -p /home/speakers/;

groupadd students;
groupadd speakers;

# ACCOUNTS - STUDENTS
STUDENT_ACCOUNTS=`cat /core/students.txt`;
for ENTRY in $STUDENT_ACCOUNTS;
do
  USER=`echo $ENTRY | cut -d':' -f1`;
  PASS=`echo $ENTRY | cut -d':' -f2`;
  HOME_DIR=/home/students/$USER;
  echo creating student $USER;
  echo $USER:$PASS::::$HOME_DIR:/bin/bash | newusers;
  cp /root/.bashrc $HOME_DIR/.bashrc;
  mkdir -p $HOME_DIR/classes
  chown -R $USER:$USER $HOME_DIR;
  usermod -a -G students $USER;
done;

# ACCOUNTS - SPEAKERS
SPEAKERS_ACCOUNTS=`cat /core/speakers.txt`;
for ENTRY in $SPEAKERS_ACCOUNTS;
do
  USER=`echo $ENTRY | cut -d':' -f1`;
  PASS=`echo $ENTRY | cut -d':' -f2`;
  HOME_DIR=/home/speakers/$USER;
  echo creating speaker $USER;
  echo $USER:$PASS::::$HOME_DIR:/bin/bash | newusers;
  cp /root/.bashrc $HOME_DIR/.bashrc;
  mkdir -p $HOME_DIR/classes
  chown -R $USER:$USER $HOME_DIR;
  usermod -a -G speakers $USER;
done;

# LECTURE DIRECTORIES
L_MAP=`cat /core/speaker_lectures_map.txt`;
for ENTRY in $L_MAP;
do
  LEC=`echo $ENTRY | cut -d':' -f1`;
  SPEAKER=`echo $ENTRY | cut -d':' -f2`;
  LEC_PATH=/home/speakers/$SPEAKER/$LEC
  echo "Creating lecture directory: $LEC_PATH";
  mkdir -p $LEC_PATH;
  chown $SPEAKER:$SPEAKER $LEC_PATH;

#  for STUDENT_ACC in $STUDENT_ACCOUNTS;
#  do
#    STUDENT_ACC=`echo $STUDENT_ACC | cut -d':' -f1`;
#    echo "Copying $LEC_PATH to /home/students/$STUDENT_ACC/"
#    cp -R $LEC_PATH /home/students/$STUDENT_ACC/classes/
#    chown -R $STUDENT_ACC:$STUDENT_ACC /home/students/$STUDENT_ACC
#  done;

#  for SPEAKER_ACC in $SPEAKERS_ACCOUNTS;
#  do
#    SPEAKER_ACC=`echo $SPEAKER_ACC | cut -d':' -f1`;
#    echo "Copying $LEC_PATH to /home/speakers/$SPEAKER_ACC/"
#    cp -R $LEC_PATH /home/speakers/$SPEAKER_ACC/classes/
#    chown -R $SPEAKER_ACC:$SPEAKER_ACC /home/speakers/$SPEAKER_ACC/
#  done;
done;

rm /startup.sh

bash
