FROM ubuntu:18.04

WORKDIR /usr/local/bin

RUN apt-get update && apt-get install -y \
	openssl \
	net-tools \
	git \
	locales \
	sshfs \
	dumb-init \
	wget \
	curl

RUN curl -s https://api.github.com/repos/codercom/code-server/releases/latest \
	| grep "browser_download_url" \
	| grep "linux-x64" \
	| cut -d '"' -f 4 \
	| wget -qi - 
	
RUN tar -xvzf *.tar.gz --strip-components 1 

RUN find . ! -name 'code-server' -type f -exec rm -f {} +
	
WORKDIR /root/project

EXPOSE 80
	
RUN locale-gen es_ES.UTF-8

ENTRYPOINT ["dumb-init", "code-server", "--port=80", "--allow-http", "--no-auth"]
