## [chris102994/docker-base-image-gui](https://github.com/chris102994/docker-base-image-gui)

This is a docker base image that can be used as a baseline for future containers that will be utilized for long-term deployments.

### CI
 [![Build Status](https://travis-ci.com/chris102994/docker-base-image-gui.svg?branch=master)](https://travis-ci.com/chris102994/docker-base-image-gui "Build Status")
 [![Image Pulls](https://img.shields.io/docker/pulls/christopher102994/docker-base-image-gui)](https://hub.docker.com/repository/docker/christopher102994/docker-base-image-gui "Docker Hub Info")
[![GitHub tag Version](https://img.shields.io/github/v/tag/chris102994/docker-base-image-gui?label=Version&style=plastic)](https://chris102994.github.io/containers/docker-base-image-gui/)

### Images
|Base Distribution|Tag|Size|
|-----|-----|-----|
| Ubuntu Bionic (18) | ubuntu-18-latest |[![](https://images.microbadger.com/badges/image/christopher102994/docker-base-image-gui:ubuntu-18-latest.svg)](https://microbadger.com/images/christopher102994/docker-base-image-gui:ubuntu-18-latest "Image Size") |
| Alpine 3.10 | alpine-3.10-latest |[![](https://images.microbadger.com/badges/image/christopher102994/docker-base-image-gui:alpine-3.10-latest.svg)](https://microbadger.com/images/christopher102994/docker-base-image-gui:alpine-3.10-latest "Image Size") |
| Debian Bullseye (11) | debian-11-latest |[![](https://images.microbadger.com/badges/image/christopher102994/docker-base-image-gui:debian-11-latest.svg)](https://microbadger.com/images/christopher102994/docker-base-image-gui:debian-11-latest "Image Size") |

## Outside Packages
* Built on my [Base Image](https://github.com/chris102994/docker-base-image)
  * [x11vnc](http://www.karlrunge.com/x11vnc/) - An X11 VNC Server.
      * This is built with [libvncserver](https://libvnc.github.io/) to support websockets for noVNC.
  * [xvfb](https://www.x.org/releases/X11R7.6/doc/man/man1/Xvfb.1.xhtml) - An X Virtual Framebuffer Display Server.
  * [openbox](http://openbox.org/wiki/Main_Page) - A lightweight window manager.
  * [nginx](https://www.nginx.com/) - A high performance HTTP server and reverse Proxy.
  * [xterm](https://en.wikipedia.org/wiki/Xterm) - The Standard terminal emulator for the X window system.
  * [noVNC](https://github.com/novnc/noVNC) - A HTML5 VNC Client.

## Docker
```
docker run \
	--name=base-image-gui \
  	-e VNC_PASSWORD=password `optional` \
	-p 5700:5700 \
	-v </path/to/appdata/config>:/config \
	--restart unless-stopped \
	christopher102994/docker-base-image-gui:alpine-3.10-latest
```

## Parameters
Container specific parameters passed at runtime. The format is `<external>:<internal>` (e.g. `-p 443:22` maps the container's port 22 to the host's port 443).

| Parameter | Function |
| -------- | -------- |
| -e APP_NAME | The Name of the App. (Optional - Recommended) |
| -e VNC_PASSWORD | Password for the VNC session. (Optional) |
| -e DISPLAY_WIDTH | VNC Server's display width. (Optional) |
| -e DISPLAY_HEIGHT | VNC Server's displat height. (Optional) |
| -p 5700 | The web encrypted UI port. |
| -e USERNAME | The Username you wish to run as. (Optional) |
| -e GROUPNAME | The Groupname you wish to run as. (Optional) |
| -e PUID | The UID you wish to run and save files as. (Optional) |
| -e PGID | The GID you wish to run and save files as. (Optional) |
| -v /config | All the config files for your app. |

## Adding Subsequent Apps
```
# Ensure the icon is correct for noVNC
cp /path/to/16x16icon /etc/noVNC/app/images/icons/novnc-16x16.png
``` 
