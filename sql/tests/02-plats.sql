-- Données de test pour les plats

-- Insertion de plats
INSERT INTO plats (titre_plat, photo_url, categorie) VALUES
('Coq au vin', 'images/coq-au-vin.jpg', 'Plat Principal'),
('Moules-Frites', 'images/moules-frites.jpg', 'Plat Principal'),
('Quiche Lorraine', 'images/quiche-lorraine.jpg', 'Entrée'),
('Salade Niçoise', 'images/salade-nicoise.jpg', 'Salade'),
('Tarte aux Pommes', 'images/tarte-aux-pommes.jpg', 'Dessert'),
('Sushi Saumon', 'images/sushi-saumon.jpg', 'Plat Principal'),
('Tempura de légumes', 'images/tempura-legumes.jpg', 'Entrée'),
('Tiramisu', 'images/tiramisu.jpg', 'Dessert'),
('Pâtes Carbonara', 'images/pates-carbonara.jpg', 'Plat Principal'),
('Escalope Milanaise', 'images/escalope-milanaise.jpg', 'Plat Principal');

-- Liaison des allergènes aux plats
-- Coq au vin: pas d'allergènes principaux
-- Moules-Frites: crustacés (2)
INSERT INTO liste_allergenes (liste_allergenes_plat, liste_allergenes_allergene) VALUES
(2, 6);

-- Quiche Lorraine: lait (3), oeufs (4)
INSERT INTO liste_allergenes (liste_allergenes_plat, liste_allergenes_allergene) VALUES
(3, 3),
(3, 4);

-- Salade Niçoise: poisson (5)
INSERT INTO liste_allergenes (liste_allergenes_plat, liste_allergenes_allergene) VALUES
(4, 5);

-- Tarte aux Pommes: lait (3), oeufs (4)
INSERT INTO liste_allergenes (liste_allergenes_plat, liste_allergenes_allergene) VALUES
(5, 3),
(5, 4);

-- Sushi Saumon: poisson (5), soja (8)
INSERT INTO liste_allergenes (liste_allergenes_plat, liste_allergenes_allergene) VALUES
(6, 5),
(6, 8);

-- Tempura de légumes: oeufs (4)
INSERT INTO liste_allergenes (liste_allergenes_plat, liste_allergenes_allergene) VALUES
(7, 4);

-- Tiramisu: lait (3), oeufs (4)
INSERT INTO liste_allergenes (liste_allergenes_plat, liste_allergenes_allergene) VALUES
(8, 3),
(8, 4);

-- Pâtes Carbonara: lait (3), oeufs (4)
INSERT INTO liste_allergenes (liste_allergenes_plat, liste_allergenes_allergene) VALUES
(9, 3),
(9, 4);

-- Escalope Milanaise: oeufs (4), lait (3)
INSERT INTO liste_allergenes (liste_allergenes_plat, liste_allergenes_allergene) VALUES
(10, 3),
(10, 4);
