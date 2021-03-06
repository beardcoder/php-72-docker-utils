FROM php:7.2

RUN apt-get update -yqq
RUN apt-get install openssh-client git unzip ansible zlib1g-dev wget libfreetype6-dev libjpeg62-turbo-dev libmcrypt-dev libcurl4-gnutls-dev libxml2-dev -yqq
RUN ansible-galaxy install carlosbuenosvinos.ansistrano-deploy carlosbuenosvinos.ansistrano-rollback
RUN curl -Lo /usr/local/bin/phpunit https://phar.phpunit.de/phpunit.phar && chmod +x /usr/local/bin/phpunit
RUN docker-php-ext-install pdo pdo_mysql gd zip simplexml
RUN curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer && echo 'export PATH="$PATH:$HOME/.composer/vendor/bin"' >> ~/.bashrc
RUN composer global require mickaelandrieu/xml-linter
RUN curl -Lo git-lfs.tar.gz https://github.com/git-lfs/git-lfs/releases/download/v2.3.4/git-lfs-linux-amd64-2.3.4.tar.gz \
    && tar xzf git-lfs.tar.gz && cd git-lfs-2.3.4 && ./install.sh && cd .. && rm -rf git-lfs*
RUN curl -Lo /usr/local/bin/php-cs-fixer http://cs.sensiolabs.org/download/php-cs-fixer-v2.phar && chmod +x /usr/local/bin/php-cs-fixer

