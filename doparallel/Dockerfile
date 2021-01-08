from armr:latest
ARG HOST
RUN R -e "install.packages('doParallel')"
EXPOSE 11000
#ENTRYPOINT ["Rscript", "--default-packages=datasets,utils,grDevices,graphics,stats,methods",  "-e",  "'parallel:::.slaveRSOCK()'",  "MASTER=${HOST}",  "PORT=11000",  "OUT='lLog.txt'", "SETUPTIMEOUT=120", "TIMEOUT=2592000", "XDR=TRUE", "SETUPSTRATEGY=sequential"]
