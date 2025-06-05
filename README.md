
┌┬┐┌─┐┬─┐┌┬┐┬ ┬─┐ ┬   ┌─┐┬─┐┌─┐┌┬┐┌─┐┌─┐┌┬┐
 │ ├┤ ├┬┘││││ │┌┴┬┘───├─┘├┬┘│ │ │ ├┤ │   │ 
 ┴ └─┘┴└─┴ ┴└─┘┴ └─   ┴  ┴└─└─┘ ┴ └─┘└─┘ ┴ 

> ***termux-protect*** is a simple shell script that embodies
> the Termux's wiki solution for backing up your Termux
> environment.It creates a **.tgz** archive in the **/sdcard/**
> directory if it doesn't already exist, otherwise, the old 
> one is removed and a new one is created.

## Download & Install
``` bash
git clone https://github.com/sneekyfoxx/termux-protect ~/

# Simple Approach
# cd ~/termux-protect
# ./termux-protect.sh help

# Recommended Approach
# cp -r ./termux-protect.sh ~/.local/bin/termux-protect
# termux-protect help
```


