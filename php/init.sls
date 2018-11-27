libapache2-mod-php:
  pkg.installed

/etc/apache2/mods-available/php7.2.conf:
  file.managed:
    - source: salt://php/php7.2.conf

/etc/apache2/mods-enabled/php7.2.conf:
  file.symlink:
    - target: ../mods-available/php7.2.conf

phpservice:
  service.running:
    - name: apache2
    - watch:
      - file: /etc/apache2/mods-available/php7.2.conf
      - file: /etc/apache2/mods-enabled/php7.2.conf
