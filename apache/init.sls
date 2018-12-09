apache2:
 pkg.installed

/var/www/html/index.html:
 file.managed:
   - source: salt://apache/default-index.html

/home/xubuntu/public_html/index.html:
  file.managed:
    - mode: 666
    - source: salt://apache/index.html
    - makedirs: True

/etc/apache2/mods-enabled/userdir.conf:
 file.symlink:
   - target: ../mods-available/userdir.conf

/etc/apache2/mods-enabled/userdir.load:
 file.symlink:
   - target: ../mods-available/userdir.load

apache2service:
 service.running:
   - name: apache2
   - watch:
     - file: /etc/apache2/mods-enabled/userdir.conf
     - file: /etc/apache2/mods-enabled/userdir.load
