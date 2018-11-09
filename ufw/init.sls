ufw:
  pkg.installed

/etc/ufw/ufw.conf:
  file.managed:
    - source: salt://ufw/ufw.conf

/etc/ufw/user.rules:
  file.managed:
    - source: salt://ufw/user.rules

/etc/ufw/user6.rules:
  file.managed:
    - source: salt://ufw/user6.rules

ufwrun:
  service.running:
    - name: ufw
    - watch:
      - file: /etc/ufw/ufw.conf
      - file: /etc/ufw/user.rules
      - file: /etc/ufw/user6.rules
