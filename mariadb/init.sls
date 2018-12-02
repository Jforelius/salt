mariadb-client:
  pkg.installed

mariadb-server:
  pkg.installed

php-mysql:
  pkg.installed


/tmp/crud.sql:
  file.managed:
    - mode: 600
    - source: salt://mariadb/crud.sql

'cat /tmp/crud.sql | sudo mariadb -u root':
  cmd.run:
    - unless: "echo 'show databases'| sudo mariadb -u root| grep '^testjuskadatabase$'"
    - require:
      - mariadb-client
