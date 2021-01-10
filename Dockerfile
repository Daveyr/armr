FROM arm32v7/ubuntu:18.04
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && apt install gnupg2 libcurl4-openssl-dev apt-utils libatlas3-base libopenblas-base -y
# import package repository and key
#RUN apt-key adv --keyserver keys.gnupg.net --recv-key 'E19F5F87128899B192B1A2C2AD5F960A256A04AF'
#RUN echo 'deb http://cloud.r-project.org/bin/linux/debian buster-cran40/' | tee -a /etc/apt/sources.list
#RUN echo 'deb [arch=armhf] http://cran.rstudio.com/bin/linux/debian stretch-cran35/' > /etc/apt/sources.list.d/cran35.list
#RUN apt update && apt install -t buster-cran40 -f r-base -y
#RUN apt update && apt install -t stretch-cran35 -f r-base -y

# Make R from source
RUN apt-get install -y gfortran libreadline6-dev libx11-dev libxt-dev \
                               libpng-dev libjpeg-dev libcairo2-dev xvfb \
                               libbz2-dev libzstd-dev liblzma-dev \
                               libcurl4-openssl-dev \
                               texinfo texlive texlive-fonts-extra \
                               screen wget libpcre2-dev
WORKDIR "/usr/local/src"
RUN wget https://cran.rstudio.com/src/base/R-4/R-4.0.3.tar.gz
RUN tar zxvf R-4.0.3.tar.gz
WORKDIR "R-4.0.3"
RUN ./configure --enable-R-shlib #--with-blas --with-lapack #optional
RUN make
RUN make install


# Copy scripts
RUN mkdir /home/R
COPY R/install_packages.sh /home/R/install_packages.sh
COPY R/requirements.txt /home/R/requirements.txt
WORKDIR "/home/R"
RUN sh install_packages.sh
