-- Insertar juegos
INSERT INTO `ejercicio-045-bas-juegos` VALUES 
(1, 'The Legend of Zelda', 'aventura', 1986, 60.00),
(2, 'Super Mario Bros', 'plataforma', 1985, 50.00),
(3, 'Pokémon Rojo', 'RPG', 1996, 45.00),
(4, 'Minecraft', 'sandbox', 2011, 30.00),
(5, 'Fortnite', 'battle royale', 2017, 0.00);

-- Insertar usuarios con juego favorito
INSERT INTO `ejercicio-045-bas-usuarios` 
(nombre, email, juego_favorito) VALUES 
('Carlos Pérez', 'carlos@email.com', 1),
('María López', 'maria@email.com', 3),
('Juan Rivas', 'juan@email.com', 4),
('Ana Torres', 'ana@email.com', 2),
('Luis Soto', 'luis@email.com', 1),
('Sofía Cruz', 'sofia@email.com', 5);