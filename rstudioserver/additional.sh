# Additional install steps
useradd -r rstudio-server
cp /usr/local/lib/rstudio-server/extras/init.d/debian/rstudio-server /etc/init.d/rstudio-server
chmod +x /etc/init.d/rstudio-server 
ln -f -s /usr/local/lib/rstudio-server/bin/rstudio-server /usr/sbin/rstudio-server
chmod 777 -R /usr/local/lib/R/site-library/

# Setup locale
apt-get install -y locales
DEBIAN_FRONTEND=noninteractive dpkg-reconfigure locales
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
#echo 'export LANG=en_US.UTF-8' >> ~/.bashrc
#echo 'export LANGUAGE=en_US.UTF-8' >> ~/.bashrc

## Clean the system of packages used for building
#sudo apt-get autoremove -y cabal-install ghc openjdk-7-jdk pandoc libboost-all-dev
#sudo rm -r -f ~/rstudio-$VERS
#sudo apt-get autoremove -y

apt-get install pandoc-citeproc
rm /usr/local/lib/rstudio-server/bin/pandoc/pandoc
rm /usr/local/lib/rstudio-server/bin/pandoc/pandoc-citeproc
