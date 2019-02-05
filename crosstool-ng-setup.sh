#!/bin/bash

#git clone https://github.com/Artistan/mac-os-cross-compile-arm-rpi-linux-gnueabihf.git
#cd mac-os-cross-compile-arm-rpi-linux-gnueabihf
#echo "run ./build.sh to setup compiler";

if [ ! -f "./.config" ]; then
	echo "fetching .config from github"
	wget "https://raw.githubusercontent.com/Artistan/mac-os-cross-compile-arm-rpi-linux-gnueabihf/master/.config"
else
   echo "using `pwd`/.config"
fi

if brew ls --versions "crosstool-ng" > /dev/null; then
  # The package is installed
	echo "crosstool-ng is installed"
else
	echo "installing crosstool-ng is installed"
  # The package is not installed
	brew install crosstool-ng --HEAD
fi

echo "chmod crosstool-NG.sh so it works."
sudo chmod +x `find $(brew --prefix crosstool-ng)/ -name crosstool-NG.sh`

# install some needed packages.
for pkg in crosstool-ng help2man bison cmake automake; do
	if brew ls --versions ${pkg} > /dev/null; then
	  # The package is installed
		echo "${pkg} is installed"
	else
	  # The package is not installed
		brew install ${pkg}
	fi
done

if [ -f "~/.zshrc" ]; then
	if grep -Fxq "/usr/local/opt/bison/bin" ~/.zshrc
	then
		echo 'bison path already in to .zshrc'
	else
		echo 'export PATH="/usr/local/opt/bison/bin:$PATH"' >> ~/.zshrc
		echo 'bison path added to .zshrc you must now source the file and try again... source ~/.zshrc '
		exit 1
	fi
fi

if [ -f "~/.bashrc" ]; then
	if grep -Fxq "/usr/local/opt/bison/bin" ~/.bashrc
	then
		echo 'bison path already in to .bashrc'
	else
		echo 'export PATH="/usr/local/opt/bison/bin:$PATH"' >> ~/.bashrc
		echo 'bison path added to .bashrc you must now source the file and try again... source ~/.bashrc '
		exit 1
	fi
fi

brew unlink bison >/dev/null 2>&1
brew link --force bison >/dev/null 2>&1

if [ `which bison` == "/usr/bin/bison" ]; then
	echo "which bison should not be /usr/bin/bison"
	exit 1
fi

# get crosstool-ng for local packages / patches.
#if [ ! -d "crosstool-ng" ]; then
#	git clone https://github.com/crosstool-ng/crosstool-ng.git
#else
#    cd crosstool-ng
#    git pull >/dev/null 2>&1
#    cd ..
#fi

if [ `ulimit -n` -lt 256 ]; then
    echo "upping the ulimit to 1024"
    ulimit -n 1024;
else
    echo "your ulimit is good > $(ulimit -n)"
fi