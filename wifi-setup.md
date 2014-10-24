# Wifi Setup via the Command Line

The following steps are based on the wifi setup instructions in the official [Raspberry Pi User Guide](http://www.amazon.com/Raspberry-User-Guide-Eben-Upton/dp/1118921666), 3rd Edition, page 85. This setup assumes WPA encryption. Other options are discussed in the User Guide.

Scan for available wifi networks.

	sudo iwlist scan | less
	
Edit the `/etc/network/interfaces` file.

	sudo nano /etc/network/interfaces
	
Make whatever changes are necessary such that the file reflects the following:

	auto lo

	iface lo inet loopback
	iface eth0 inet dhcp

	auto wlan0
	iface wlan0 inet dhcp
	wpa-conf /etc/wpa.conf
	
Save and close the file by pressing `Ctrl-X` and agreeing to the prompts.

Create the new `wpa.conf` file.

	sudo nano /etc/wpa.conf
	
Add the following lines.

	network={
	ssid="your_wifi_network_name"
	key_mgmt=WPA-PSK
	psk="your_wifi_password"
	}
	
Again, save and close the file by pressing `Ctrl-X` and agreeing to the prompts.

Either reboot, or bring your wifi network up explicitly:

	sudo ifup wlan0
	
If you get a notice saying `ifup: interface wlan0 already configured` you may need to take it down, then bring it up again:

	sudo ifdown wlan0
	sudo ifup wlan0
	
Verify that you are online with a quick ping test.

	ping -c 3 8.8.8.8
	
