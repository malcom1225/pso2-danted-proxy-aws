#! /bin/sh

sudo apt-get update && sudo apt-get install make gcc g++

sudo wget http://www.inet.no/dante/files/dante-1.4.3.tar.gz
sudo tar xvfz dante-1.4.3.tar.gz
cd ./dante-1.4.3
sudo ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --disable-client --without-libwrap --without-bsdauth --without-gssapi --without-krb5 --without-upnp --without-pam
sudo make && sudo make install
cd ..
sudo cp sockdinit.txt /etc/init.d/sockd
sudo chmod +x /etc/init.d/sockd
sudo update-rc.d sockd defaults

sudo cp sockdconf.txt /etc/sockd.conf
sudo /etc/init.d/sockd start
sudo /etc/init.d/sockd status
