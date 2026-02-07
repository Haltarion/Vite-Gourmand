-- Données de base (statiques)
-- À exécuter en premier

-- Insertion des thèmes
INSERT INTO themes (libelle) VALUES
('Menu Français'),
('Menu Japonais'),
('Menu Méditerranéen'),
('Menu Végétarien');

-- Insertion des régimes
INSERT INTO regimes (libelle) VALUES
('Normal'),
('Végan'),
('Sans Gluten'),
('Halal');

-- Insertion des allergènes
INSERT INTO allergenes (libelle) VALUES
('Arachides'),
('Fruits à coque'),
('Lait'),
('Oeufs'),
('Poisson'),
('Crustacés'),
('Moutarde'),
('Soja');
