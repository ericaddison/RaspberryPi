####1. Keyboard Region
  edit file `/etc/default/keyboard` and change to `XKBLAYOUT="us"`
  
####2. Wireless Setup
  edit file `/etc/network/interfaces` and insert
```
  auto wlan0
  iface wlan0 inet dhcp 
    wpa-ssid {ssid}
    wpa-psk  {password}
```

  Some command line wireless tools are:
  
  * First, get your WiFi card up and running:
  
  `sudo ifconfig wlan0 up`
  
  * Now scan for a list of WiFi networks in range. You might be typing your name wr$
  
  `sudo iwlist wlan0 scan`
  
  * This will show you a list of wireless networks, pick yours from the list:
  
  `sudo iwconfig wlan0 essid Wifi2Home key s:ABCDE12345`
  
  * To obtain the IP address, now request it with the Dynamic Host Client:
  
  `sudo dhclient wlan0`
  
  * (possible solution here for dropping wifi: https://github.com/dirttech/SmartMeter/blob/master/wifi_drop.sh)


####3. prevent SSH from dropping idle connections
  If you leave PuTTY connected for long periods of time (especially on tail -f /some/log/file) you may have noticed the SSH server disconnects you after a while if there is no new input on that log file.

  You could configure PuTTY to enable connection keepalive functionality, but you’d need to either do that for every session or every saved server in the list.

  The easier way is to enable this functionality on the servers themselves, by editing the /etc/ssh/sshd_config file and adding/editing this line:

`clientaliveinterval 60`

  This will make the server send a keepalive packet every 60 seconds, preventing the disconnection of idle sessions.
  
####4. Software install and config
  1. vim

	`sudo apt-get install vim`
	`echo "syntax on" >> ~/.vimrc`

####5. Dowload and build Julia
  `sudo apt-get install libblas3gf liblapack3gf libfftw3-dev libgmp3-dev libmpfr-dev libblas-dev liblapack-dev gfortran cmake    gcc-4.7  g++-4.7 libgfortran3`
  `git clone https://github.com/JuliaLang/julia.git`
  
  `cd julia`
  
  `make`
  
  Trying `make USE_SYSTEM_LIBM=1`
  
  Running this since last line didn't work: `sudo apt-get install libblas3gf liblapack3gf libfftw3-dev libgmp3-dev libmpfr-dev libblas-dev liblapack-dev cmake gcc-4.8 g++-4.8 gfortran libgfortran3 m4 libedit-dev`
  
  Meh, giving up for now... Check for ARM binaries some time in the future...
  
  
####6. Add user and groups
  `sudo adduser eric`
  
  `sudo adduser eric sudo`
  
  `sudo adduser eric gpio`
  
  `sudo adduser eric kmem`

  `sudo chmod 660 /dev/mem`
