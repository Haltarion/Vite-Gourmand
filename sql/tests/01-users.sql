-- Données de test pour les utilisateurs

-- Insertion d'utilisateurs test
-- Rôles: 1=User, 2=Employe, 3=Admin
INSERT INTO users (nom, prenom, mobile, password, adresse, commune, code_postal, email, user_role, is_active) VALUES
('Dupont', 'Alice', '0601020304', SHA2('password123', 256), '123 Rue de la Paix', 'Paris', '75001', 'alice.dupont@example.com', 1, 1),
('Martin', 'Bob', '0602030405', SHA2('password123', 256), '456 Avenue du Progrès', 'Lyon', '69000', 'bob.martin@example.com', 1, 1),
('Bernard', 'Charlie', '0603040506', SHA2('password123', 256), '789 Boulevard de la Liberté', 'Marseille', '13000', 'charlie.bernard@example.com', 2, 1),
('Thomas', 'Diana', '0604050607', SHA2('password123', 256), '321 Rue de la Joie', 'Toulouse', '31000', 'diana.thomas@example.com', 2, 1),
('Robert', 'Eve', '0605060708', SHA2('password123', 256), '654 Avenue de la Paix', 'Nice', '06000', 'eve.robert@example.com', 1, 1),
('admin', 'Système', '0607080910', SHA2('admin123', 256), '1 Rue de l\'Administration', 'Paris', '75001', 'admin@example.com', 3, 1);
