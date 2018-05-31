#!/bin/bash -x

NUMBER_OF_USERS=10;
for N in `seq -f %02g 1 $NUMBER_OF_USERS`; 
do 
  echo Copying class files for user training$N;
  rsync -a --ignore-existing --exclude=data /opt/issdl/classes/* /home/training$N/;
  chown -R training$N:training$N /home/training$N;
  ln -s /opt/issdl/data/ /home/training$N/data;
done;

jupyterhub
