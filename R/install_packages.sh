#!/usr/bin/bash
while IFS=" " read -r package version; 
do 
  Rscript -e "install.packages('"$package"', repos='https://cloud.r-project.org/')"; 
done < "/home/R/requirements.txt"
