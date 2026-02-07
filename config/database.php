<?php

/**
 * Configuration de la base de données
 * Gère différents environnements (local, test, production)
 */

// Charger les variables d'environnement depuis .env
function loadEnv($filePath)
{
    if (!file_exists($filePath)) {
        throw new Exception("Fichier .env non trouvé: {$filePath}");
    }

    $lines = file($filePath, FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES);
    foreach ($lines as $line) {
        if (strpos($line, '=') === false || strpos($line, '#') === 0) {
            continue;
        }
        [$key, $value] = explode('=', $line, 2);
        $_ENV[trim($key)] = trim($value);
    }
}

// Charger les fichiers .env avec priorité à .env.local
$envPath = dirname(__DIR__) . '/.env';
if (file_exists($envPath)) {
    loadEnv($envPath);
}

// .env.local surcharge .env (si existe)
$envLocalPath = dirname(__DIR__) . '/.env.local';
if (file_exists($envLocalPath)) {
    loadEnv($envLocalPath);
}

// Récupérer l'environnement
$environment = $_ENV['APP_ENV'] ?? getenv('APP_ENV') ?? 'local';

// Configuration de base de données selon l'environnement
$dbConfig = [
    'local' => [
        'host'      => $_ENV['DB_HOST'] ?? 'localhost',
        'port'      => $_ENV['DB_PORT'] ?? 3306,
        'database'  => $_ENV['DB_NAME'] ?? 'vite_gourmand',
        'username'  => $_ENV['DB_USER'] ?? 'root',
        'password'  => $_ENV['DB_PASSWORD'] ?? '',
        'charset'   => $_ENV['DB_CHARSET'] ?? 'utf8mb4',
        'collation' => $_ENV['DB_COLLATION'] ?? 'utf8mb4_unicode_ci',
        'timezone'  => $_ENV['DB_TIMEZONE'] ?? 'Europe/Paris',
    ],
    'test' => [
        'host'      => $_ENV['DB_HOST'] ?? 'localhost',
        'port'      => $_ENV['DB_PORT'] ?? 3306,
        'database'  => $_ENV['DB_NAME'] ?? 'vite_gourmand_test',
        'username'  => $_ENV['DB_USER'] ?? 'root',
        'password'  => $_ENV['DB_PASSWORD'] ?? '',
        'charset'   => $_ENV['DB_CHARSET'] ?? 'utf8mb4',
        'collation' => $_ENV['DB_COLLATION'] ?? 'utf8mb4_unicode_ci',
        'timezone'  => $_ENV['DB_TIMEZONE'] ?? 'Europe/Paris',
    ],
    'production' => [
        'host'      => $_ENV['DB_HOST'] ?? 'localhost',
        'port'      => $_ENV['DB_PORT'] ?? 3306,
        'database'  => $_ENV['DB_NAME'] ?? 'vite_gourmand',
        'username'  => $_ENV['DB_USER'] ?? 'root',
        'password'  => $_ENV['DB_PASSWORD'] ?? '',
        'charset'   => $_ENV['DB_CHARSET'] ?? 'utf8mb4',
        'collation' => $_ENV['DB_COLLATION'] ?? 'utf8mb4_unicode_ci',
        'timezone'  => $_ENV['DB_TIMEZONE'] ?? 'Europe/Paris',
    ],
];

// Vérifier que l'environnement existe
if (!isset($dbConfig[$environment])) {
    throw new Exception("Environnement '{$environment}' non reconnu");
}

// Retourner la configuration
return [
    'environment' => $environment,
    'database'    => $dbConfig[$environment],
];
