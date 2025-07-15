<?php
function getConnection() {
    $host = 'localhost';
    $port = '5432';
    $dbname = 'productos_db';      // ← el nombre que usaste en `db.js`
    $user = 'postgres';
    $password = 'contraseña';      // ← la misma contraseña que usaste en `db.js`

    $conn_string = "host=$host port=$port dbname=$dbname user=$user password=$password";
    $conn = pg_connect($conn_string);

    if (!$conn) {
        die("Error al conectar a la base de datos");
    }

    return $conn;
}
?>
