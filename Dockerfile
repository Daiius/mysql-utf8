FROM mysql:8.0-debian


RUN apt update \ 
 && apt install -y locales \
 && sed -i -E 's/# ja_JP.UTF-8 UTF-8/ja_JP.UTF-8 UTF-8/' /etc/locale.gen \
 && locale-gen \
 && localedef -i ja_JP -c -f UTF-8 -A /usr/share/locale/locale.alias ja_JP.UTF-8 \
 && update-locale LANG=ja_JP.UTF-8

ENV LANG=ja_JP.UTF-8

COPY my.cnf /etc/mysql/my.cnf
