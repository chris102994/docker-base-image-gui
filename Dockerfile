# Pull the base image
FROM christopher102994/docker-base-img-alpine-3.10:latest
MAINTAINER chris102994<chris102994@yahoo.com>
ARG BUILD_DATE
ARG VERSION
# Package Versions
ARG NOVNC_VERSION=1.1.0
ARG WEBSOCKIFY_VERSION=0.9.0
# Package URLs
ARG NOVNC_URL=https://github.com/novnc/noVNC/archive/v${NOVNC_VERSION}.tar.gz
ARG WEBSOCKIFY_URL=https://github.com/novnc/websockify/archive/v${WEBSOCKIFY_VERSION}.tar.gz
# ENV Vars for Builder Script
RUN	echo "##### Downloading Virtual Build Dependencies #####" && \
		apk add --no-cache --virtual=build-dependencies \
			curl \
			tar \
			tzdata \
			xz && \
	echo "##### Downloading Container items via Curl #####" && \
		echo "##### Downloading noVNC #####" && \
			mkdir -p /etc/noVNC && \
			curl -L -s ${NOVNC_URL} | tar xvzf - -C /etc/noVNC --strip-components 1 && \
			mkdir -p /etc/noVNC/utils/websockify && \
			curl -L -s ${WEBSOCKIFY_URL} | tar xvzf - -C /etc/noVNC/utils/websockify --strip-components 1 && \
			# Busybox ps doesn't have -p option so we will do a simple pgrep for websockify
			sed -i 's#if ! ps -p ${proxy_pid} >/dev/null; then#if [[ ! $(pgrep -f websockify) ]]; then#g' /etc/noVNC/utils/launch.sh && \
			# Ensure the correct Icon shows up
			sed -i -E 's#\s+<link rel="icon" sizes.*#    <link rel="icon" sizes="16x16" type="image/png" href="app/images/icons/novnc-16x16.png">#g' /etc/noVNC/vnc.html && \
			sed -i -E 's#\s+<link rel="apple-touch-icon" sizes.*#    <link rel="apple-touch-icon" sizes="16x16" type="image/png" href="app/images/icons/novnc-16x16.png">#g' /etc/noVNC/vnc.html && \
	echo "##### Downloading Runtime Packages #####" && \
		apk add --no-cache \
			libvncserver \
			x11vnc \
			stunnel \
			xvfb \
			openssl \
			openbox \
			python \
			py-numpy \
			nginx \
			tint2 \
			xterm && \
	echo "##### Removing Unnecessary Files#####" && \
		rm -rf \
			/etc/xdg/autostart/ \
			/etc/init.d/ \
			/etc/nginx/nginx.conf \
			/etc/logrotate.d/nginx \
			/etc/nginx/conf.d \
			/etc/nginx/modules \
			/var/lib/nginx/* \
			/var/log/nginx \
			/var/www && \
	echo "#### Setting up users and groups ####" && \
		userdel nginx && \
		groupdel www-data && \
		mkdir -p \
			/config/log/nginx \
			/config/certs && \
		useradd -u 901 \
				--system \
				--home-dir /dev/null \
				--no-create-home \
				--shell /sbin/nologin \
				nginx && \
		ln -s /config/log/nginx /var/lib/nginx/logs && \
	echo "##### Cleaning Up #####" && \
		apk del --purge build-dependencies

# Env Vars
ENV DISPLAY=:0
ENV	DISPLAY_WIDTH=1280
ENV DISPLAY_HEIGHT=720
ENV APP_NAME=xterm
# VNC Web Interface VNC
EXPOSE 5700 
#Work Dir
WORKDIR /config
# Add Local Files
COPY rootfs/ /

