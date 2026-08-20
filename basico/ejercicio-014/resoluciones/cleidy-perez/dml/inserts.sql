-- Datos de practica. Puedes cambiarlos o agregar mas filas.
USE campuslands_mysql;


INSERT INTO saga_peliculas (titulo, episodio_numero, fecha_estreno_cine, presupuesto_millones) VALUES
('Éxodo Estelar: El Primer Salto', 1, '2018-11-15', 120.00),
('Éxodo Estelar: La Caída del Enclave', 2, '2021-05-20', 160.00),
('Éxodo Estelar: Horizonte Infinito', 3, '2025-12-18', 210.00);


INSERT INTO cronologia_historia (id_pelicula, nombre_evento, anio_en_la_ficcion, planeta_o_lugar) VALUES
(1, 'Descubrimiento del motor FTL (Más rápido que la luz)', 2140, 'Tierra'),
(1, 'La Gran Invasión a la Colonia Alfa', 2145, 'Alfa Centauri b'),
(2, 'Destrucción de la Estación Orbital Enclave', 2150, 'Órbita de Marte'),
(3, 'Firma del Tratado de Paz Intergaláctico', 2188, 'Planeta Orión Prime');

INSERT INTO eventos_comunidad (id_pelicula, tipo_evento, nombre_evento, fecha_evento) VALUES
(1, 'Panel Comic-Con', 'Presentación Teaser Oficial', '2018-07-21'),
(2, 'Tráiler', 'Lanzamiento Tráiler Final en YouTube', '2021-03-10'),
(3, 'Convención', 'Sci-Fi Global Fest 2025', '2025-09-05'),
(3, 'Lanzamiento Blu-Ray', 'Edición Coleccionista 4K', '2026-04-12');