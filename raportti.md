# H3


### C) /srv/salt gittiin

Ensiksi asensin gitin ja saltin + tein minionin koneestani:
	~$ sudo apt-get -y install git salt-master salt-minion
	~$ cat /etc/salt/minion
	~$ cat /etc/salt/minion
	master: 192.168.10.35 
	id: peasant_juska


Kloonasin githubista oman moduulini alun:
	~$ git clone https://github.com/Jforelius/salt.git

Ajatuksena oli tehdä moduuli, joka asentaa salt masteria varten palomuurille reiät + vaikka apachen userdir+skel seteillä.
PHP:n voisi lisätä myöhemmin.

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

Tein palomuuriasetuksen, joka avaa salt master portit + ssh default portin.

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


### D) git log, git diff ja git blame

	$ git log
	commit 296709e9abe2388822ea1abe185d8ffdc7d7d8e9 (HEAD -> master, origin/master, origin/HEAD)
	Author: Juska <a1704557@myy.haaga-helia.fi>
	Date:   Fri Nov 9 17:59:26 2018 +0000
	
	    add text
	
	commit a51dd551ffbabb55ef92da8440334f0845bc4ddf
	Author: Juska <a1704557@myy.haaga-helia.fi>
	Date:   Fri Nov 9 17:31:24 2018 +0000
	
	    add firewall module. no port 80 hole
	
	commit 999eef0f02c0f79d38088487680cd1ec7da30119
	Author: Juska <a1704557@myy.haaga-helia.fi>
	Date:   Fri Nov 9 15:25:40 2018 +0000
	
	    add raportti + top

Loki kertoo commitin id, kuka tehnyt, ajan ja commit tekstin. 
Tässä tapauksessa tein /srv/salttiin lisää juttuja.

Git diff kertoo taas committien välisen eron:

	~$ git diff 296709e9abe2388822ea1abe185d8ffdc7d7d8e9 999eef0f02c0f79d38088487680cd1ec7da30119
	diff --git a/raportti.md b/raportti.md
	index 815a2ba..c5d7870 100644
	--- a/raportti.md
	+++ b/raportti.md
	@@ -3,15 +3,7 @@
	 
	 ### C)
	 
	-Ensiksi asensin gitin ja saltin + tein minionin koneestani:
	-       ~$ sudo apt-get -y install git salt-master salt-minion
	-       ~$ cat /etc/salt/minion
	-       ~$ cat /etc/salt/minion
	-       master: 192.168.10.35 
	-       id: peasant_juska

yms

Git blame näyttää minkä muokkauksen tekijä on tehnyt joka rivillä mihinkin aikaan:

	~$ git blame top.sls
	999eef0f (Juska 2018-11-09 15:25:40 +0000 1) base:
	999eef0f (Juska 2018-11-09 15:25:40 +0000 2)   '*':
	999eef0f (Juska 2018-11-09 15:25:40 +0000 3)     - apache
	a51dd551 (Juska 2018-11-09 17:31:24 +0000 4)     - ufw

### E) git reset

	~$ sudo rm /srv/salt/apache/init.sls
	~$ git add .
	~$ git reset --hard
	HEAD is now at 1117715 add d)
	~$ $ ls /srv/salt/apache
	default-index.html  index.html  init.sls

### F) uusi moduuli

Päätin tehdä moduulin, joka asentaa chocolate doomin, doom 1 sharewaren ja freedoom campaignit koneelle.

	~$ cat /srv/salt/doom/init.sls 
	chocolate-doom:
	  pkg.installed
	
	freedoom:
	  pkg.installed
	
	doom-wad-shareware:
	  pkg.installed

Päätin vaihtaa hiiren pois käytöstä conf filusta:

	~$ cat /srv/salt/doom/init.sls
	..
	..
	..
	/home/xubuntu/.local/share/chocolate-doom/default.cfg:
	  file.managed:
	    - source: salt://doom/default.cfg
	

Lähteet:

http://terokarvinen.com/2018/aikataulu-%e2%80%93-palvelinten-hallinta-ict4tn022-3004-ti-ja-3002-to-%e2%80%93-loppukevat-2018-5p

http://terokarvinen.com/2016/publish-your-project-with-github

http://terokarvinen.com/2018/apache-user-homepages-automatically-salt-package-file-service-example
