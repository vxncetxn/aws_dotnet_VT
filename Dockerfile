from ubuntu:18.04

WORKDIR backend-svr


RUN sudo apt-get update && \
    sudo apt-get install -y software-properties-common && \
    sudo apt-get install -y wget && \
    sudo rm -rf /var/lib/apt/lists/*

RUN sudo wget -q https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb

RUN sudo dpkg -i packages-microsoft-prod.deb

RUN sudo add-apt-repository universe

RUN sudo apt install apt-transport-https -y

RUN sudo apt-get update

RUN sudo wget http://ftp.us.debian.org/debian/pool/main/i/icu/libicu57_57.1-6+deb9u4_amd64.deb

RUN sudo dpkg -i libicu57_57.1-6+deb9u4_amd64.deb

RUN sudo apt install dotnet-sdk-3.1 -y

COPY ./ ./

RUN sudo dotnet restore

RUN sudo dotnet build

EXPOSE 5000:5000

CMD [ "dotnet", "run" ]

