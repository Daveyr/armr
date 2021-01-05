from armr:latest
RUN apt-get install libsodium-dev -y
RUN R -e "install.packages('plumber')"
COPY /R/plumber.R /home/R/plumber.R
COPY /R/plaunch.R /home/R/plaunch.R
CMD cd /home/R \
  && R -e "source('plaunch.R')" 
