# Instructions from the blog post at http://blog.bittorrent.com/2013/10/22/sync-hacks-deploy-bittorrent-sync-with-docker/
# (modified to support passing shared directory path as input)
FROM ubuntu:14.04
MAINTAINER Davide Marquês <nesrait@gmail.com>
RUN apt-get update && apt-get install -y curl
RUN curl -o /usr/bin/btsync.tar.gz http://download-new.utorrent.com/endpoint/btsync/os/linux-x64/track/stable/ 
RUN cd /usr/bin && tar -xzvf btsync.tar.gz && rm btsync.tar.gz && \
    mkdir -p /btsync/.sync && \
    mkdir -p /var/run/btsync
EXPOSE 8888
EXPOSE 55555
ADD start-btsync /usr/bin/start-btsync
RUN chmod +x /usr/bin/start-btsync
ENTRYPOINT ["/usr/bin/start-btsync"]
