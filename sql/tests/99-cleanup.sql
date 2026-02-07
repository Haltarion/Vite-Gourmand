-- Nettoyage des données de test
-- À exécuter pour réinitialiser la base en dernier

-- Suppression dans l'ordre inverse des contraintes de clés étrangères
DELETE FROM avis;
DELETE FROM commandes;
DELETE FROM composition;
DELETE FROM menus;
DELETE FROM liste_allergenes;
DELETE FROM plats;
DELETE FROM users;
DELETE FROM allergenes;
DELETE FROM regimes;
DELETE FROM themes;
DELETE FROM roles;

-- Réinitialiser les auto-increment
ALTER TABLE roles AUTO_INCREMENT = 1;
ALTER TABLE users AUTO_INCREMENT = 1;
ALTER TABLE themes AUTO_INCREMENT = 1;
ALTER TABLE regimes AUTO_INCREMENT = 1;
ALTER TABLE allergenes AUTO_INCREMENT = 1;
ALTER TABLE plats AUTO_INCREMENT = 1;
ALTER TABLE menus AUTO_INCREMENT = 1;
ALTER TABLE commandes AUTO_INCREMENT = 1;
ALTER TABLE avis AUTO_INCREMENT = 1;
