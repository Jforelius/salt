mariadb-client:
  pkg.installed

mariadb-server:
  pkg.installed

php-mysql:
  pkg.installed

mariadb-create-database:
  cmd.run:
    - name: 'echo create database test | sudo mariadb -u root'
    - unless: 'echo show databases | sudo mariadb -u root | grep test'
    - require:
      - mariadb-client
