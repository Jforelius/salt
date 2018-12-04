<?php
// connect
$pdo=new PDO("mysql:host=localhost;charset=UTF8;dbname=testjuskadatabase", 'testjuskadatabase', 'dothuej1xuch2nohTohd');
// insert
$name = $_GET["name"];
if ("" != $name) {
	echo "<p>Inserting new record.</p>";
	$pdoStatement=$pdo->prepare("INSERT INTO testjuskadatabase (name) VALUES (:name)");
	$pdoStatement->bindParam(':name', $name);
	$pdoStatement->execute();
}
// list
$pdoStatement=$pdo->prepare('SELECT * FROM testjuskadatabase;');
$pdoStatement->execute();
$hits=$pdoStatement->fetchAll();
foreach($hits as $row) {
     echo "<p>".$row['id']." ".htmlentities($row['name'])."";
}
?>

<form method=get>
	<input type=text name=name value="">
	<input type=submit>
</form>
