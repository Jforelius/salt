# salt moduuli - asenna lamp

Tein aikaisemmassa raportissa h2 vai h3 apache php moduulin.
Jatkoin sitä tunnilla, ja kokeilin mariadb:n asennusta kotona ensiksi käsin.

	~$ sudo apt-get -y install mariadb-client mariadb-server
	~$ sudo apt-get -y install php-mysql
	~$ sudo mariadb -u root

Testitietokannan teko onnistui. Php-mysql ei vielä testattu.
my.cnf pitäisi saada saltilla niin, että rw oikeuksia ei olisi muulla kuin adminilla.

