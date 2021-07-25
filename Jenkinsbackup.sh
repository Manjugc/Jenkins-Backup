#!/bin/bash

cd /var/lib/jenkins
ls -a | grep -w .git
if [ $? -ne 0 ];
then
git init
fi
touch .gitignore
echo workspace >> .gitignore
git add *
git commit -m "Jenkins Backup"
git push https://github.com/Manjugc/Jenkins-Backup.git
if [ $? -eq 0 ];
then
mail -s "Success" gcmanju.apr@gmail.com
else
mail -s "Fail" gcmanju.apr@gmail.com
fi
