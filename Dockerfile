FROM node:8.15.0

# Install VS Code's deps. These are the only two it seems we need.
RUN apt-get update && apt-get install -y \
	libxkbfile-dev \
	libsecret-1-dev

# Ensure latest yarn.
RUN npm install -g yarn@1.13

WORKDIR /src
COPY . .

# In the future, we can use https://github.com/yarnpkg/rfcs/pull/53 to make yarn use the node_modules
# directly which should be fast as it is slow because it populates its own cache every time.
RUN yarn && yarn --no-cache task build:server:binary

# We deploy with ubuntu so that devs have a familiar environment.
FROM phusion/baseimage:master
WORKDIR /root/project
COPY --from=0 /src/packages/server/cli-linux-x64 /usr/local/bin/code-server
EXPOSE 80

RUN apt-get update && apt-get install -y \
	openssl \
	net-tools \
	git \
	locales
	
RUN locale-gen es_ES.UTF-8

RUN echo 2 > /proc/sys/net/ipv4/tcp_mtu_probing && echo 2048 > /proc/sys/net/ipv4/tcp_base_mss

ENV LANG=es_ES.UTF-8
ENTRYPOINT ["code-server", "--port=80"]
