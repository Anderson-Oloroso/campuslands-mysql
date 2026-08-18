-- INSERT básico: juegos
INSERT INTO `ejercicio-045-int-juegos` 
(titulo, genero, año, precio) VALUES 
('The Legend of Zelda', 'aventura', 1986, 60.00),
('Super Mario Bros', 'plataforma', 1985, 50.00),
('Pokémon Rojo', 'RPG', 1996, 45.00),
('Minecraft', 'sandbox', 2011, 30.00),
('Fortnite', 'battle royale', 2017, 0.00),
('Among Us', 'social', 2018, 5.00),
('GTA V', 'acción', 2013, 40.00);

-- INSERT sin columnas (respetar orden)
INSERT INTO `ejercicio-045-int-usuarios` VALUES 
(1, 'Carlos Pérez', 'carlos@email.com', 1),
(2, 'María López', 'maria@email.com', 3),
(3, 'Juan Rivas', 'juan@email.com', 4);

-- INSERT múltiple
INSERT INTO `ejercicio-045-int-usuarios` 
(nombre, email, juego_favorito) VALUES 
('Ana Torres', 'ana@email.com', 2),
('Luis Soto', 'luis@email.com', 1),
('Sofía Cruz', 'sofia@email.com', 5),
('David Ruiz', 'david@email.com', 7),
('Elena Gil', 'elena@email.com', 6);

-- Carga de compras (INSERT SELECT)
INSERT INTO `ejercicio-045-int-compras` (usuario_id, juego_id)
SELECT u.id, j.id
FROM `ejercicio-045-int-usuarios` u
CROSS JOIN `ejercicio-045-int-juegos` j
WHERE u.id <= 3 AND j.id <= 3;