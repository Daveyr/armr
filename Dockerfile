FROM arm32v7/ubuntu:18.04
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && apt install r-base r-base-core r-base-dev libcurl4-openssl-dev apt-utils -y
RUN mkdir /home/R
COPY R/install_packages.sh /home/R/install_packages.sh
COPY R/requirements.txt /home/R/requirements.txt
RUN sh home/R/install_packages.sh
