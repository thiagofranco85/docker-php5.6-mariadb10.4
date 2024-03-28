<?php
// Configurações do banco de dados
$host = 'mariadb'; // Nome do serviço do container MariaDB no docker-compose.yml
$port = 3306; // Porta padrão do MariaDB
$dbname = 'teste-php-db';
$user = 'root';
$password = '12345678';

try {
    // Conexão com o banco de dados
    $pdo = new PDO("mysql:host=$host;port=$port;dbname=$dbname", $user, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // Exemplo de consulta
    $stmt = $pdo->query('SELECT * FROM Users');
    while ($row = $stmt->fetch()) {
        echo "ID: {$row['id']} - Nome: {$row['nome']}<br>";
    }
} catch (PDOException $e) {
    echo "Erro na conexão com o banco de dados: " . $e->getMessage();
}
