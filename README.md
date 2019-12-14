## A minimal docker base image that provides a GUI for future apps that support long-term deployement.

 [![Build Status](https://travis-ci.com/chris102994/docker-base-image-gui.svg?branch=master)](https://travis-ci.com/chris102994/docker-base-image-gui)


## Outside Packages
* Built on my [Base Image](https://github.com/chris102994/docker-base-image)
  * [x11vnc](http://www.karlrunge.com/x11vnc/) - An X11 VNC Server.
  * [xvfb](https://www.x.org/releases/X11R7.6/doc/man/man1/Xvfb.1.xhtml) - An X Virtual Framebuffer Display Server.
  * [openbox](http://openbox.org/wiki/Main_Page) - A lightweight window manager.
  * [noVNC](https://github.com/novnc/noVNC) - A HTML5 VNC Client.
  * [websockify](https://github.com/novnc/websockify) - A WebSocket to TCP proxy/bridge that allows noVNC to connect to x11vnc.
    * **Note:** I want to eventually replace this with a more lightweight solution that doesn't require python + numpy. Eventually x11vnc built with [libvncserver](https://libvnc.github.io/) should support this. 
