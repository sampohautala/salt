mariadb-client:
  pkg.installed

mariadb-server:
  pkg.installed

php-mysql:
  pkg.installed

mariadb-create-database:
  cmd.run:
    - name: 'echo create database foo | sudo mariadb -u root'
    - require:
      - mariadb-client
    - unless: 'echo show databases | sudo mariadb -u root | grep foo'

