My Raspbian Dotfiles and General Setup
======================================

This the general setup I use on my Raspberry Pi 3 running the Raspbian OS. The dotfiles themselves have been adapted from my [macOS setup](https://github.com/joshukraine/dotfiles). Comments and suggestions welcome. :)

What's New in Raspberry Pi 3
----------------------------

RPi 3 brings a variety of improvements and performance boosts. To me, the most visible improvements are the built-in connectivity upgrades, namely, wifi and Bluetooth. This removes a lot of the previous setup hassle since you can boot up and connect to wireless internet immediately. For more details on what's changed, check out the following:

* https://www.raspberrypi.org/magpi/raspberry-pi-3-specs-benchmarks/
* http://www.trustedreviews.com/opinions/raspberry-pi-3-vs-pi-2
* https://www.raspberrypi.org/products/raspberry-pi-3-model-b/

Setting up the Pi
-----------------

**OS and First Boot**

[Flash the SD card](http://www.raspberrypi.org/documentation/installation/installing-images/README.md) with the [latest Raspbian image](http://www.raspberrypi.org/downloads/). I like to use [ApplePi Baker](http://www.tweaking4all.com/hardware/raspberry-pi/macosx-apple-pi-baker/) for this. ApplePi Baker can be easily installed using [Homebrew Cask](https://caskroom.github.io/) with the following command:

	$ brew cask install applepi-baker

After inserting your SD card (which should now contain the new OS image), connect an HDMI cable and keyboard/mouse dongle. Connect the power cable and boot up! With the latest Raspbian image, the Pi boots directly to the desktop.

Finally, select a wifi network and connect.

**Wireless Mouse Fix**

I use a [wireless keyboard and mouse](https://www.amazon.com/Portable-Wireless-Keyboard-Optical-Desktop/dp/B00EQ32YPG/). Before moving on, I like to fix the annoying mouse lag with the following steps:

```sh
# 1. Edit the file cmdline.txt
sudo nano /boot/cmdline.txt

# 2. Add the following in-line to whatever is already in the file. (Don't add a newline!)
usbhid.mousepoll=0

# 3. Save and close the file and reboot. Problem solved.
```

More detail in this [GitHub issue](https://github.com/raspberrypi/linux/issues/642).


**rasbi-config**

Let's run [`raspi-config`](https://www.raspberrypi.org/documentation/configuration/raspi-config.md) and tweak a few settings:

	$ sudo raspi-config

Here are the settings I change:

1. Expand the filesystem. (Not needed if you installed via NOOBS)
5. Internationalization > locale: `en_US.UTF8`, timezone: `Kiev`, Keyboard Layout: `Generic 104-key PC` > `English (US) - English (Macintosh)`
9. Advanced Options > `A1 Overscan` (disable), `A4 SSH` (enable)

When finished, reboot.

**System Updates**

	sudo apt-get -y update && sudo apt-get -y upgrade

Install some extra packages.

	sudo apt-get install -y zsh vim tmux htop fonts-inconsolata

Remap the `caps lock` key to `ctrl`.

	# Open the file /etc/default/keyboard
	sudo vim /etc/default/keyboard

	# Edit the XKBOPTIONS entry
	XKBOPTIONS="terminate:ctrl_alt_bksp,ctrl:nocaps"

	# After saving and closing the file, run:
	sudo dpkg-reconfigure keyboard-configuration

	# Restart the Pi

Dotfiles Setup
--------------

The dotfiles use [Oh My Zsh](http://ohmyz.sh/), so we'll install that first.

	$ sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

Next, clone this repo.

	git clone https://github.com/joshukraine/dotfiles-raspbian.git ~/dotfiles

And finally, symlink the dotfiles by running the install script:

	$ source ~/dotfiles/install.sh

NOTE: Vim plugins (specified in the vimrc file) require [Vundle](https://github.com/VundleVim/Vundle.vim#quick-start).

Reference
---------

The following are some helpful articles and other resources from the web about Raspberry Pi.

* [Rasberry Pi Official Docs](https://www.raspberrypi.org/documentation/)
* [The Always-Up-to-Date Guide to Setting Up Your Raspberry Pi (Lifehacker)](http://lifehacker.com/the-always-up-to-date-guide-to-setting-up-your-raspberr-1781419054)
* [PiBakery](http://www.pibakery.org/index.html)
* [ApplePi Baker](http://www.tweaking4all.com/hardware/raspberry-pi/macosx-apple-pi-baker/)
* [All Raspberry Pi articles on Lifehacker](http://lifehacker.com/tag/raspberry-pi)


