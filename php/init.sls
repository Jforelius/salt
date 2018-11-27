libapache2-mod-php7.2:
  pkg.installed

/etc/apache2/mods-available/php7.2.conf:
  file.managed:
    - source: salt://php/php7.2.conf

/etc/apache2/mods-enabled/php7.2.conf:
  file.symlink:
    - target: /etc/apache2/mods-available/php7.2.conf

apache2phprestart:
  service.running:
    - name: apache2
    - watch:
      - file: /etc/apache2/mods-available/php7.2.conf
