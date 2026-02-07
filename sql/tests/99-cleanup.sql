-- Nettoyage des données de test
-- À exécuter pour réinitialiser la base en dernier

-- Suppression dans l'ordre inverse des contraintes de clés étrangères
-- Utilise des comparaisons pour éviter les erreurs si les tables n'existent pas
SET FOREIGN_KEY_CHECKS = 0;

TRUNCATE TABLE avis;
TRUNCATE TABLE commandes;
TRUNCATE TABLE composition;
TRUNCATE TABLE menus;
TRUNCATE TABLE liste_allergenes;
TRUNCATE TABLE plats;
TRUNCATE TABLE users;
TRUNCATE TABLE allergenes;
TRUNCATE TABLE regimes;
TRUNCATE TABLE themes;

SET FOREIGN_KEY_CHECKS = 1;
