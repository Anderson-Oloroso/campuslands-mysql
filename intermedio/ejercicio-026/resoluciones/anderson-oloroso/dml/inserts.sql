USE campuslands_mysql;

INSERT INTO personajes_rpg (nombre_personaje, clase, nivel, oro) VALUES
('Alpha Team', 'Region Norte', 'Director Alpha', 100.00),
('Beta Squad', 'Region Sur', 'Director Beta', 150.00),
('Gamma Force', 'Region Este', 'Director Gamma', 120.00),
('Delta Unit', 'Region Oeste', 'Director Delta', 90.00),
('Epsilon Crew', 'Region Norte', 'Director Epsilon', 200.00);

INSERT INTO inventario_rpg (personaje_id, nombre_objeto, rareza, valor_oro) VALUES
(1, 'Member A1', 'Rol Principal', 85.50),
(1, 'Member A2', 'Rol Secundario', 78.00),
(2, 'Member B1', 'Rol Principal', 92.00),
(2, 'Member B2', 'Rol Apoyo', 88.50),
(3, 'Member C1', 'Rol Principal', 95.00),
(3, 'Member C2', 'Rol Secundario', 70.00),
(4, 'Member D1', 'Rol Apoyo', 65.00),
(5, 'Member E1', 'Rol Principal', 99.00),
(5, 'Member E2', 'Rol Apoyo', 91.00),
(5, 'Member E3', 'Rol Secundario', 84.00);
