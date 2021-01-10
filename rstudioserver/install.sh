apt-get install -y git r-recommended python-dev
cd /usr/local/
git clone https://github.com/rstudio/rstudio.git
cd /usr/local/rstudio/dependencies/common/
./install-common
cd /usr/local/rstudio/dependencies/linux/
./install-dependencies-debian

#saw java 6 was not installed. installed v7
apt-get install -y openjdk-7-jdk

#tried to make install, got an error about dictionaries not installed and rerun install-dependencies
cd /usr/local/rstudio/dependencies/common/
./install-common

#tried to make install, hangs at "ext:" so I tried manually installing pandoc, which should have been installed earlier, but apparently was not
apt-get install -y pandoc

#tried to make install, hangs at "ext:" so I tried installing the latest GWT compiler
cd /home/pi/Downloads
wget http://dl.google.com/closure-compiler/compiler-latest.zip
unzip compiler-latest.zip
rm COPYING README.md compiler-latest.zip
mv closure-compiler-v20170218.jar /usr/local/rstudio/src/gwt/tools/compiler/compiler.jar

#build and install works!
cd /usr/local/rstudio/
#remove build if exists
rm -r ./build
mkdir build
cd build
cmake .. -DRSTUDIO_TARGET=Server -DCMAKE_BUILD_TYPE=Release
make install
