from armr:latest
RUN apt-get install libsodium-dev libssl-dev libcurl4-gnutls-dev -y
#RUN R -e "install.packages('plumber')"
RUN R -e "remotes::install_github('rstudio/plumber')"
COPY /R/plumber.R /home/R/plumber.R
COPY /R/plaunch.R /home/R/plaunch.R
EXPOSE 80
#CMD cd /home/R \
#  && ./plaunch.R 
ENTRYPOINT ["Rscript", "/home/R/plaunch.R"]
