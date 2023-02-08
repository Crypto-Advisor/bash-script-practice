#!/bin/bash
firstline=$(head -n 1 source/changelog.md)
read -a splitfirstline <<< $firstline
version=${splitfirstline[1]}

echo "Version: "$version
echo "Welcome to this script!"

echo "Enter 1 to continue and 0 to exit"
read versioncontinue
if [ $versioncontinue == '1' ]
then
  echo "OK"
  for file in source/*
  do 
    if [ $file == 'source/secretinfo.md' ]
    then
      echo "this file cannot be copied"
    else
      echo "this file is being copied: "$file
      cp $file build/.
    fi
  done
  echo "build "$version" contains"
  for file in build/*
  do
    echo $file
  done
  cd ..
else 
  echo "Please come back when you are ready"
fi
