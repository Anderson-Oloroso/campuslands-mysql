USE campuslands_mysql;

INSERT INTO objetos_juego (nombre_objeto, tipo_objeto, rareza, valor_oro) VALUES
('Espada oxidada', 'arma', 'comun', 10.00),
('Amuleto de fuego', 'reliquia', 'epico', 500.00),
('Poción de vida', 'pocion', 'comun', 50.00),
('Arco de cazador', 'arma', 'raro', 200.00),
('Escudo legendario', 'reliquia', 'legendario', 1500.00),
('Hierba curativa', 'material', 'comun', 5.00),
('Capa de sombra', 'reliquia', 'epico', 800.00),
('Daga de plata', 'arma', 'raro', 300.00);

INSERT INTO inventario_jugador (nombre_jugador, id_objeto, estado_item) VALUES
('Sergio', 1, 'vendido'),
('Sergio', 2, 'equipado'),
('Sergio', 3, 'mochila'),
('Ana', 4, 'equipado'),
('Ana', 5, 'mochila'),
('Sergio', 7, 'mochila'),
('Ana', 8, 'mochila'),
('Sergio', 3, 'mochila');