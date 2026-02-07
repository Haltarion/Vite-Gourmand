<?php

/**
 * Script d'initialisation de la base de données
 * Crée la base de données et exécute les scripts SQL
 * 
 * Usage: php database-init.php
 */

echo "=== Initialisation de la base de données ===\n\n";

try {
    // Charger la configuration
    $config = require __DIR__ . '/config/database.php';
    $db = $config['database'];
    $environment = $config['environment'];

    echo "Environnement: {$environment}\n";
    echo "Base de données: {$db['database']}\n";
    echo "Host: {$db['host']}\n\n";

    // Connexion à MySQL (sans sélectionner la base de données)
    $mysqli = new mysqli(
        $db['host'],
        $db['username'],
        $db['password'],
        '',
        $db['port']
    );

    if ($mysqli->connect_error) {
        throw new Exception("Erreur de connexion: " . $mysqli->connect_error);
    }

    echo "✅ Connexion établie\n\n";

    // Créer la base de données
    echo "Création de la base de données '{$db['database']}'...\n";
    $dbName = $mysqli->real_escape_string($db['database']);
    if (!$mysqli->query("CREATE DATABASE IF NOT EXISTS `{$dbName}`;")) {
        throw new Exception("Erreur lors de la création de la BD: " . $mysqli->error);
    }
    echo "✅ Base de données créée\n\n";

    // Sélectionner la base de données
    $mysqli->select_db($db['database']);

    // Exécuter le script schema.sql
    echo "Exécution du script schema.sql...\n";
    $schemaFile = __DIR__ . '/sql/schema.sql';
    if (!file_exists($schemaFile)) {
        throw new Exception("Fichier non trouvé: {$schemaFile}");
    }

    $schema = file_get_contents($schemaFile);
    if ($mysqli->multi_query($schema)) {
        // Consommer tous les résultats
        while ($mysqli->more_results()) {
            $mysqli->next_result();
        }
        echo "✅ Schema créé avec succès\n\n";
    } else {
        throw new Exception("Erreur lors de l'exécution du schema: " . $mysqli->error);
    }

    // Exécuter le script seed.sql
    echo "Exécution du script seed.sql...\n";
    $seedFile = __DIR__ . '/sql/seed.sql';
    if (file_exists($seedFile)) {
        $seed = file_get_contents($seedFile);
        if ($mysqli->multi_query($seed)) {
            while ($mysqli->more_results()) {
                $mysqli->next_result();
            }
            echo "✅ Données de base insérées\n\n";
        } else {
            echo "⚠️  Avertissement lors de l'exécution du seed: " . $mysqli->error . "\n\n";
        }
    } else {
        echo "⚠️  Fichier seed.sql non trouvé\n\n";
    }

    $mysqli->close();

    echo "=== Initialisation terminée avec succès! ===\n";

} catch (Exception $e) {
    echo "❌ Erreur: " . $e->getMessage() . "\n";
    exit(1);
}
