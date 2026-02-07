<?php

/**
 * Script de test de la base de données
 * Exécute les données de test en ordre
 *
 * Usage: php database-test.php
 */

echo "=== Initialisation des données de test ===\n\n";

try {
    // Charger la configuration
    $config = require __DIR__ . '/config/database.php';
    $db = $config['database'];
    $environment = $config['environment'];

    echo "Environnement: {$environment}\n";
    echo "Base de données: {$db['database']}\n\n";

    // Connexion à MySQL
    $mysqli = new mysqli(
        $db['host'],
        $db['username'],
        $db['password'],
        $db['database'],
        $db['port']
    );

    if ($mysqli->connect_error) {
        throw new Exception("Erreur de connexion: " . $mysqli->connect_error);
    }

    echo "✅ Connexion à la base de données établie\n\n";

    // Nettoyer les données de test avant de les recharger
    echo "Nettoyage des données de test...\n";
    $cleanupFile = __DIR__ . '/sql/tests/99-cleanup.sql';
    if (file_exists($cleanupFile)) {
        $cleanup = file_get_contents($cleanupFile);
        if ($mysqli->multi_query($cleanup)) {
            while ($mysqli->more_results()) {
                $mysqli->next_result();
            }
            echo "✅ Nettoyage effectué\n\n";
        } else {
            echo "⚠️  Avertissement lors du nettoyage: " . $mysqli->error . "\n\n";
        }
    }

    echo "Insertion des données de test...\n\n";
    $testFiles = [
        'sql/tests/00-base.sql',      // Données de base communes
        'sql/tests/01-users.sql',     // Utilisateurs de test
        'sql/tests/02-plats.sql',     // Plats et allergènes
        'sql/tests/03-menus.sql',     // Menus, compositions, commandes, avis
    ];

    // Exécuter chaque fichier de test
    foreach ($testFiles as $file) {
        $filePath = __DIR__ . '/' . $file;

        if (!file_exists($filePath)) {
            echo "⚠️  Fichier non trouvé: {$file}\n";
            continue;
        }

        echo "Exécution de {$file}...\n";
        $sql = file_get_contents($filePath);

        if ($mysqli->multi_query($sql)) {
            // Consommer tous les résultats
            while ($mysqli->more_results()) {
                $mysqli->next_result();
            }
            echo "✅ {$file} exécuté avec succès\n\n";
        } else {
            echo "❌ Erreur dans {$file}: " . $mysqli->error . "\n\n";
        }
    }

    // Afficher des statistiques
    echo "=== Statistiques de la base de données ===\n\n";

    $tables = [
        'users',
        'themes',
        'regimes',
        'allergenes',
        'plats',
        'liste_allergenes',
        'menus',
        'composition',
        'commandes',
        'avis'
    ];

    foreach ($tables as $table) {
        $result = $mysqli->query("SELECT COUNT(*) as count FROM `{$table}`");
        if ($result) {
            $row = $result->fetch_assoc();
            echo "{$table}: " . $row['count'] . " enregistrement(s)\n";
            $result->free();
        } else {
            echo "{$table}: ⚠️ Erreur lors de la requête\n";
        }
    }

    $mysqli->close();

    echo "\n=== Initialisation des données de test terminée! ===\n";

} catch (Exception $e) {
    echo "❌ Erreur: " . $e->getMessage() . "\n";
    exit(1);
}
