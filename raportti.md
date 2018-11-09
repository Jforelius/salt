# H3


### C)

Ensiksi asensin gitin:
	~$ sudo apt-get -y install git

Kloonasin githubista oman moduulini alun:
	~$ git clone https://github.com/Jforelius/salt.git

Ajatuksena oli tehdä moduuli, joka asentaa salt master ja salt minion, palomuureille reiät + vaikka apachen userdir+skel seteillä.

	~$ cat /srv/salt/apache/init.sls
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


### Palomuuri:

Tein palomuuriasetuksen, joka avaa salt master portit + ssh portin.

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

