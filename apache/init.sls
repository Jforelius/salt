apache2:
  pkg.installed

/etc/skel/public_html/:
  file.directory

/etc/skel/public_html/index.html:
  file.managed:
    - source: salt://apache/index.html

/var/www/html/index.html:
  file.managed:
    - source: salt://apache/default-index.html

/etc/apache2/mods-enabled/userdir.load:
  file.symlink:
    - target: ../mods-available/userdir.load

/etc/apache2/mods-enabled/userdir.conf:
  file.symlink:
    - target: ../mods-available/userdir.conf

apache2service:
  service.running:
    - name: apache2
    - watch:
      - file: /etc/apache2/mods-enabled/userdir.load
      - file: /etc/apache2/mods-enabled/userdir.conf
