#!/usr/bin/bash
while IFS=" " read -r package version; 
do 
  Rscript -e "install.packages('"$package"')"; 
done < "/home/R/requirements.txt"
