#!/bin/bash -x

NUMBER_OF_USERS=10;
for N in `seq -f %02g 1 $NUMBER_OF_USERS`; 
do 
  echo Copying class files for user training$N;
  #cp -R /opt/classes/* /home/training$N/;
  rsync -a --ignore-existing --exclude=data /opt/classes/* /home/training$N/;
  chown -R training$N:training$N /home/training$N;
  ln -s /opt/data/ /home/training$n/data;
done;

jupyterhub
