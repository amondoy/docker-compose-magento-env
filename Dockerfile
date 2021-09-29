FROM debian

ARG USER=docker
ARG UID=1000
ARG GID=1000

# ADD SURY Php PPA repo
RUN apt-get update && apt-get -y install lsb-release apt-transport-https ca-certificates apt-utils wget curl gnupg
RUN wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
RUN echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/php.list

RUN apt-get update && apt-get -y install php7.4
RUN apt-get -y install php7.4-fpm php7.4-cli php7.4-common php7.4-mysql php7.4-xml php7.4-intl php7.4-curl php7.4-bcmath php7.4-gd php7.4-mbstring php7.4-soap php7.4-zip php7.4-iconv php7.4-sockets  php7.4-sodium composer

# Xdebug
RUN apt-get -y install php7.4-Xdebug
RUN echo "xdebug.remote_enable=on" >> /etc/php/7.4/mods-available/xdebug.ini
RUN echo "xdebug.remote_autostart=on" >> /etc/php/7.4/mods-available/xdebug.ini

WORKDIR /workspaces/magento

# Work around to keep the container from closing itself after it is created
CMD ["sleep", "infinity"]
