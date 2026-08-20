-- Insercion de datos para viajes y turismo (ejercicio-018)
USE campuslands_mysql;

-- Insercion en destinos_turisticos
INSERT INTO destinos_turisticos (ciudad, pais, continente, clima) VALUES
('Kyoto', 'Japon', 'Asia', 'Templado'),
('Antigua Guatemala', 'Guatemala', 'America', 'Templado'),
('Santorini', 'Grecia', 'Europa', 'Templado'),
('Cusco', 'Peru', 'America', 'Frio'),
('Reykjavik', 'Islandia', 'Europa', 'Frio'),
('El Cairo', 'Egipto', 'Africa', 'Desertico');

-- Insercion en paquetes_turisticos
INSERT INTO paquetes_turisticos (nombre_paquete, id_destino, duracion_dias, precio_por_persona, cupos_maximos, nivel_dificultad, incluye_vuelo) VALUES
('Templos Sagrados y Jardines Zen', 1, 7, 1850.00, 15, 'Facil', 'Si'),
('Ruta Gastronomica Tradicional', 1, 4, 980.00, 12, 'Facil', 'No'),
('Volcanes y Cultura Maya Colonial', 2, 5, 650.00, 20, 'Moderado', 'No'),
('Atardeceres del Mar Egeo y Cruceros', 3, 6, 2100.00, 14, 'Facil', 'Si'),
('Camino del Inca a Machu Picchu', 4, 5, 890.00, 16, 'Exigente', 'No'),
('Valle Sagrado de los Incas VIP', 4, 4, 1100.00, 10, 'Facil', 'Si'),
('Caza de Auroras Boreales y Glaciares', 5, 8, 2600.00, 12, 'Moderado', 'Si'),
('Ruta del Circulo Dorado y Aguas Termales', 5, 4, 1350.00, 18, 'Facil', 'No'),
('Piramides de Giza y Crucero Nilo', 6, 9, 1950.00, 22, 'Moderado', 'Si'),
('Aventura Oasis en el Desierto Blanco', 6, 3, 580.00, 10, 'Exigente', 'No'),
('Lago de Atitlan y Pueblos Mayas', 2, 4, 450.00, 25, 'Facil', 'No'),
('Oia Luxury Escape', 3, 5, 3200.00, 8, 'Facil', 'Si');

