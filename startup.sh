#!/bin/bash -x

mkdir -p /home/test/
mkdir -p /home/students/
mkdir -p /home/speakers/

TEST=`cat /root/core/users/test.txt`
for UP in $TEST;
do
  U=`echo $UP | cut -d':' -f1`
  P=`echo $UP | cut -d':' -f2`
  HOME_DIR=/home/test/$U
  echo creating user $U;
  echo $U:$P::::$HOME_DIR:/bin/bash | newusers;
#  echo Copying class files for user $U
#  rsync -a --ignore-existing --exclude=data /opt/issdl/classes/* $HOME_DIR;
  chown -R $U:$U $HOME_DIR;
  ln -s /opt/issdl/data/ $HOME_DIR/data;
done;

groupadd speakers


SPEAKERS=`cat /root/core/users/speakers.txt`
for UP in $SPEAKERS;
do
  U=`echo $UP | cut -d':' -f1`
  P=`echo $UP | cut -d':' -f2`
  HOME_DIR=/home/speakers/$U
  echo creating user $U;
  echo $U:$P::::$HOME_DIR:/bin/bash | newusers;
#  echo Copying class files for user $U
#  rsync -a --ignore-existing --exclude=data /opt/issdl/classes/* $HOME_DIR;
  chown -R $U:$U $HOME_DIR;
  ln -s /opt/issdl/data/ $HOME_DIR/data;

  usermod -a -G speakers $U
done;

STUDENTS=`cat /root/core/users/students.txt`
for UP in $STUDENTS;
do
  U=`echo $UP | cut -d':' -f1`
  P=`echo $UP | cut -d':' -f2`
  HOME_DIR=/home/students/$U
  echo creating user $U;
  echo $U:$P::::$HOME_DIR:/bin/bash | newusers;
#  echo Copying class files for user $U
#  rsync -a --ignore-existing --exclude=data /opt/issdl/classes/* $HOME_DIR;
  chown -R $U:$U $HOME_DIR;
  ln -s /opt/issdl/data/ $HOME_DIR/data;
done;

/root/core/users/speakers_files.sh

#chmod -R o-x /home/

jupyterhub

