FROM arm32v7/ubuntu:18.04
#FROM arm32v7/debian:bullseye
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && apt install gnupg2 libcurl4-openssl-dev apt-utils libatlas3-base libopenblas-base -y
RUN apt-key adv --keyserver keys.gnupg.net --recv-key 'E19F5F87128899B192B1A2C2AD5F960A256A04AF'
RUN echo 'deb http://cloud.r-project.org/bin/linux/debian buster-cran40/' | tee -a /etc/apt/sources.list
#RUN echo 'deb [arch=armhf] http://cran.rstudio.com/bin/linux/debian stretch-cran35/' > /etc/apt/sources.list.d/cran35.list
# import package repository key
RUN apt update && apt install -t buster-cran40 -f r-base -y
#RUN apt update && apt install -t stretch-cran35 -f r-base -y
RUN apt install r-base=4.0 -v -y
RUN mkdir /home/R
COPY R/install_packages.sh /home/R/install_packages.sh
COPY R/requirements.txt /home/R/requirements.txt
RUN sh home/R/install_packages.sh
