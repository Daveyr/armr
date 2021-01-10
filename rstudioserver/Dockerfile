# Build this docker image and tag it as rstudioserver
from armr:latest
COPY install.sh /usr/local/src/install.sh
COPY additional.sh usr/local/src/additional.sh
WORKDIR "/usr/local/src"
RUN install.sh
RUN additional.sh
RUN systemctl daemon-reload
RUN rstudio-server start
