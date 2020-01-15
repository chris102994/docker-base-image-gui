## A minimal docker base image that provides a GUI for future apps that support long-term deployement.

 [![Build Status](https://travis-ci.com/chris102994/docker-base-image-gui.svg?branch=master)](https://travis-ci.com/chris102994/docker-base-image-gui)
 [![Image Size](https://img.shields.io/microbadger/image-size/christopher102994/docker-base-img-gui/alpine-3.10)](https://hub.docker.com/repository/docker/christopher102994/docker-base-img-gui)
 [![Image Layers](https://img.shields.io/microbadger/layers/christopher102994/docker-base-img-gui/alpine-3.10)](https://hub.docker.com/repository/docker/christopher102994/docker-base-img-gui)
 [![Image Pulls](https://img.shields.io/docker/pulls/christopher102994/docker-base-img-gui)](https://hub.docker.com/repository/docker/christopher102994/docker-base-img-gui)

## Outside Packages
* Built on my [Base Image](https://github.com/chris102994/docker-base-image)
  * [x11vnc](http://www.karlrunge.com/x11vnc/) - An X11 VNC Server.
  * [xvfb](https://www.x.org/releases/X11R7.6/doc/man/man1/Xvfb.1.xhtml) - An X Virtual Framebuffer Display Server.
  * [openbox](http://openbox.org/wiki/Main_Page) - A lightweight window manager.
  * [tint2](https://gitlab.com/o9000/tint2) - A lightweight panel/taskbar for Linux and BSD.
  * [nginx](https://www.nginx.com/) - A high performance HTTP server and reverse Proxy.
  * [xterm](https://en.wikipedia.org/wiki/Xterm) - The Standard terminal emulator for the X window system.
  * [noVNC](https://github.com/novnc/noVNC) - A HTML5 VNC Client.
  * [websockify](https://github.com/novnc/websockify) - A WebSocket to TCP proxy/bridge that allows noVNC to connect to x11vnc.
    * **Note:** I want to eventually replace this with a more lightweight solution that doesn't require python + numpy. Eventually x11vnc built with [libvncserver](https://libvnc.github.io/) *should* support this.

## Docker
```
docker run \
	--name=base-image-gui \
	-e APP_NAME=xterm `optional` \
	-p 5700:5700 \
	-v </path/to/appdata/config>:/config \
	--restart unless-stopped \
	christopher102994/docker-base-img-gui:alpine-3.10
```

## Parameters
Container specific parameters passed at runtime. The format is `<external>:<internal>` (e.g. `-p 443:22` maps the container's port 22 to the host's port 443).

| Parameter | Function |
| -------- | -------- |
| -e APP_NAME | The Name of the App. (Default = xterm) |
| -p 5700 | The web encrypted UI port. |

## Adding Subsequent Apps
```
# Ensure the openbox menu is correct
sed -i 's#APP_NAME#<Your App Name>#g' /etc/xdg/openbox/menu.xml
sed -i 's#APP_ICON_LOC#<Your App's Icon Path>#g' /etc/xdg/openbox/menu.xml
sed -i 's#APP_COMMAND#<Your App's Command>#g' /etc/xdg/openbox/menu.xml

# Ensure the app will autostart
sed -i 's#APP_COMMAND#<Your App's Command>#g' /etc/xdg/openbox/autostart

# Ensure the icon is correct for noVNC
cp /path/to/16x16icon /etc/noVNC/app/images/icons/novnc-16x16.png
``` 
