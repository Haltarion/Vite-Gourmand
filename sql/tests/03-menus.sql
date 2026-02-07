-- Données de test pour les menus, compositions et commandes

-- Insertion de menus
INSERT INTO menus (menus_theme, menus_regime, quantite_restante, titre, description, nb_personne_mini, prix_par_personne, prerequis) VALUES
(1, 1, 20, 'Menu Français Classique', 'Le vrai menu français avec coq au vin', 2, 45.50, NULL),
(1, 1, 15, 'Menu Côtier Français', 'Fruits de mer et poissons', 2, 55.00, NULL),
(2, 1, 10, 'Menu Japonais Sushi', 'Assortiment de sushi frais', 2, 48.00, 'Commande 48h avant'),
(3, 2, 12, 'Menu Méditerranéen Végan', 'Légumes et huile d\'olive', 2, 38.00, NULL),
(1, 3, 18, 'Menu Sans Gluten Français', 'Adaptés pour intolérance au gluten', 2, 50.00, NULL);

-- Liaison des plats aux menus (composition)
-- Menu 1 (Français Classique): Coq au vin (1), Salade Niçoise (4), Tarte aux pommes (5)
INSERT INTO composition (composition_menu, composition_plat) VALUES
(1, 1),
(1, 4),
(1, 5);

-- Menu 2 (Côtier): Moules-Frites (2), Salade Niçoise (4), Tiramisu (8)
INSERT INTO composition (composition_menu, composition_plat) VALUES
(2, 2),
(2, 4),
(2, 8);

-- Menu 3 (Japonais): Sushi Saumon (6), Tempura (7), Tiramisu (8)
INSERT INTO composition (composition_menu, composition_plat) VALUES
(3, 6),
(3, 7),
(3, 8);

-- Menu 4 (Méditerranéen Végan): Salade Niçoise (4)
INSERT INTO composition (composition_menu, composition_plat) VALUES
(4, 4);

-- Menu 5 (Sans Gluten): Coq au vin (1), Escalope Milanaise (10), Salade Niçoise (4)
INSERT INTO composition (composition_menu, composition_plat) VALUES
(5, 1),
(5, 10),
(5, 4);

-- Insertion de commandes
INSERT INTO commandes (commandes_user, commandes_menu, date_commande, date_prestation, date_livraison, heure_livraison, adresse_livraison, commune_livraison, code_postal_livraison, nb_personne, prix_menu, prix_livraison, statut) VALUES
(1, 1, '2026-02-01', '2026-02-08', '2026-02-08', '19:00:00', '123 Rue de la Paix', 'Paris', '75001', 4, 182.00, 10.00, 'ACCEPTE'),
(2, 2, '2026-02-02', '2026-02-09', '2026-02-09', '19:30:00', '456 Avenue du Progrès', 'Lyon', '69000', 3, 165.00, 12.00, 'EN_PREPARATION'),
(3, 3, '2026-02-03', '2026-02-10', '2026-02-10', '20:00:00', '654 Rue de la Joie', 'Marseille', '13000', 2, 96.00, 8.00, 'EN_ATTENTE'),
(4, 4, '2026-02-04', '2026-02-11', '2026-02-11', '18:30:00', '789 Boulevard de la Liberté', 'Toulouse', '31000', 4, 152.00, 15.00, 'LIVRE'),
(5, 1, '2026-02-05', '2026-02-12', '2026-02-12', '19:00:00', '321 Rue de la Paix', 'Nice', '06000', 2, 91.00, 10.00, 'EN_ATTENTE');

-- Insertion d'avis
INSERT INTO avis (avis_user, avis_commande, note, commentaire, statut) VALUES
(1, 1, 5, 'Excellent menu, très savoureux!', 'VALIDE'),
(2, 2, 4, 'Très bon, portion généreuse', 'VALIDE'),
(4, 4, 5, 'Parfait! Merci beaucoup', 'VALIDE');
