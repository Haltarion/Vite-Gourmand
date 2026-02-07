CREATE TABLE roles (
    role_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    libelle VARCHAR(50) NOT NULL

) ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_unicode_ci;

CREATE TABLE users (
    user_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    nom VARCHAR(50) NOT NULL,
    prenom VARCHAR(50) NOT NULL,
    mobile VARCHAR(20) NOT NULL,
    password VARCHAR(255) NOT NULL,
    adresse VARCHAR(255) NOT NULL,
    commune VARCHAR(50) NOT NULL,
    code_postal VARCHAR(10) NOT NULL,
    email VARCHAR(180) NOT NULL,

    user_role INT UNSIGNED NOT NULL,
    is_active TINYINT(1) NOT NULL DEFAULT 1,

    UNIQUE KEY uniq_users_email (email),

    CONSTRAINT fk_users_role
        FOREIGN KEY (user_role) REFERENCES roles(role_id)
) ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_unicode_ci;

CREATE TABLE themes (
    theme_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    libelle VARCHAR(100) NOT NULL

) ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_unicode_ci;

CREATE TABLE regimes (
    regime_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    libelle VARCHAR(100) NOT NULL

) ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_unicode_ci;

CREATE TABLE allergenes (
    allergene_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    libelle VARCHAR(100) NOT NULL

) ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_unicode_ci;

CREATE TABLE plats (
    plat_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    titre_plat VARCHAR (100) NOT NULL,
    photo_url VARCHAR(255) NULL,
    categorie VARCHAR(100) NOT NULL

) ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_unicode_ci;

CREATE TABLE liste_allergenes (
    liste_allergenes_plat INT UNSIGNED NOT NULL,
    liste_allergenes_allergene INT UNSIGNED NOT NULL,

    CONSTRAINT fk_plat
        FOREIGN KEY (liste_allergenes_plat) REFERENCES plats(plat_id),

    CONSTRAINT fk_allergene
        FOREIGN KEY (liste_allergenes_allergene) REFERENCES allergenes(allergene_id)
) ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_unicode_ci;

CREATE TABLE menus (
    menu_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    menus_theme INT UNSIGNED NOT NULL,
    menus_regime INT UNSIGNED NOT NULL,

    quantite_restante INT UNSIGNED NOT NULL,
    titre VARCHAR (100),
    description VARCHAR(255),
    nb_personne_mini INT UNSIGNED NOT NULL,
    prix_par_personne DECIMAL(10,2) NOT NULL,
    prerequis VARCHAR (255) NULL,

    CONSTRAINT fk_theme
        FOREIGN KEY (menus_theme) REFERENCES themes(theme_id),

    CONSTRAINT fk_regime
        FOREIGN KEY (menus_regime) REFERENCES regimes(regime_id)

) ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_unicode_ci;

CREATE TABLE composition (
    composition_menu INT UNSIGNED NOT NULL,
    composition_plat INT UNSIGNED NOT NULL,

    CONSTRAINT fk_menu
        FOREIGN KEY (composition_menu) REFERENCES menus(menu_id),

    CONSTRAINT fk_composition_plat
        FOREIGN KEY (composition_plat) REFERENCES plats(plat_id)
) ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_unicode_ci;

CREATE TABLE commandes (
    num_commande INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    commandes_user INT UNSIGNED NOT NULL,
    commandes_menu INT UNSIGNED NOT NULL,

    date_commande DATE NOT NULL,
    date_prestation DATE NOT NULL,
    date_livraison DATE NOT NULL,
    heure_livraison TIME NOT NULL,
    adresse_livraison VARCHAR(255) NOT NULL,
    commune_livraison VARCHAR(50) NOT NULL,
    code_postal_livraison VARCHAR(10) NOT NULL,
    nb_personne INT UNSIGNED NOT NULL,
    prix_menu DECIMAL(10,2) NOT NULL,
    prix_livraison DECIMAL(10,2) NOT NULL,
    statut ENUM('EN_ATTENTE', 'ACCEPTE', 'EN_PREPARATION', 'EN_COURS_DE_LIVRAISON','LIVRE', 'EN_ATTENTE_RETOUR_MATERIEL', 'TERMINEE') NOT NULL DEFAULT 'EN_ATTENTE',

    CONSTRAINT fk_commandes_user
        FOREIGN KEY (commandes_user) REFERENCES users(user_id),

    CONSTRAINT fk_commandes_menu
        FOREIGN KEY (commandes_menu) REFERENCES menus(menu_id)

) ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_unicode_ci;

CREATE TABLE avis (
    avis_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    avis_user INT UNSIGNED NOT NULL,
    avis_commande INT UNSIGNED NOT NULL,

    note TINYINT UNSIGNED NOT NULL,
    commentaire VARCHAR(250) NOT NULL,
    statut ENUM('EN_ATTENTE', 'VALIDE', 'REFUSE') NOT NULL DEFAULT 'EN_ATTENTE',

    CONSTRAINT fk_avis_user
        FOREIGN KEY (avis_user) REFERENCES users(user_id),

    CONSTRAINT chk_avis_note
        CHECK (note BETWEEN 1 AND 5),

    CONSTRAINT fk_commande
        FOREIGN KEY (avis_commande) REFERENCES commandes(num_commande),

    UNIQUE KEY uniq_avis_commande (avis_commande)

) ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_unicode_ci;