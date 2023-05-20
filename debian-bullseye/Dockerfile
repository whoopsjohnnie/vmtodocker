# 
FROM debian:bullseye

# # Restore packages
# sudo apt-key add ~/Repo.keys
# sudo cp ~/sources.list /etc/apt/sources.list 
# sudo apt-get update
# sudo apt-get install dselect
# sudo dpkg --set-selections < ~/Package.list
# sudo apt-get dselect-upgrade -y

USER root

RUN mkdir /packages

ADD ./installed.packages.txt /packages/installed.packages.txt
ADD ./Package.list /packages/Package.list
ADD ./Repo.keys /packages/Repo.keys
ADD ./sources.list /packages/sources.list
ADD ./sources.list.d /packages/sources.list.d

RUN apt-get update
RUN apt-get install -y gnupg
RUN apt-get install -y ca-certificates

# Restore packages
RUN apt-key add /packages/Repo.keys
RUN mv /packages/sources.list /etc/apt/ 
RUN mv /packages/sources.list.d /etc/apt/
# RUN apt-get update
# RUN apt-get -o "Acquire::https::Verify-Peer=false" update

# RUN apt-get --force-yes --allow-unauthenticated update
# RUN apt --force-yes --allow-unauthenticated update
# RUN apt-get update --allow-unauthenticated
RUN apt-get update --allow-insecure-repositories

RUN apt-get install -y dselect

# RUN dpkg --set-selections < /packages/Package.list
# RUN apt-get dselect-upgrade -y

RUN apt-cache dumpavail | dpkg --merge-avail
RUN dpkg --set-selections < /packages/Package.list
RUN DEBIAN_FRONTEND=noninteractive apt-get dselect-upgrade -y --yes --force-yes --allow-unauthenticated

