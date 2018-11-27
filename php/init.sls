libapache2-mod-php7.2:
  pkg.installed

/etc/apache2/mods-available/php7.2.conf:
  file.managed:
    - source: salt://php/php7.2.conf

phprestart:
  service.running:
    - watch:
      - file: /etc/apache/mods-available/php7.2.conf
