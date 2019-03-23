FROM phusion/baseimage:master

WORKDIR /usr/local/bin

RUN apt-get update && apt-get install -y \
	openssl \
	net-tools \
	git \
	locales \
	wget

RUN curl -s https://api.github.com/repos/codercom/code-server/releases/latest \
	| grep "browser_download_url" \
	| grep "linux-x64" \
	| cut -d '"' -f 4 \
	| wget -qi - && tar -xvzf *.tar.gz --strip-components 1 && find . ! -name 'code-server' -type f -exec rm -f {} +
	
WORKDIR /root/project
EXPOSE 80
	
RUN locale-gen es_ES.UTF-8

# RUN echo 2 > /proc/sys/net/ipv4/tcp_mtu_probing && echo 2048 > /proc/sys/net/ipv4/tcp_base_mss

ENV LANG=es_ES.UTF-8
ENTRYPOINT ["code-server", "--port=80", "--allow-http", "--no-auth"]
