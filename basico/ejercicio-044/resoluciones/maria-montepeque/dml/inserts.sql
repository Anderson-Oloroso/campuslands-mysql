-- Datos de practica: peliculas de una saga de ciencia ficcion.
USE campuslands_mysql;

INSERT INTO peliculas_saga_basico (titulo, episodio, presupuesto, fecha_inicio_rodaje, fecha_estreno, estado) VALUES
('El Despertar de la Nebulosa', 1, 120000000.00, '2026-01-05', '2026-01-10', 'estrenada'),
('La Sombra del Imperio', 2, 150000000.00, '2026-01-12', '2026-01-16', 'estrenada'),
('El Ultimo Portal', 3, 180000000.00, '2026-01-20', '2026-01-27', 'post_produccion'),
('Cronicas de Andromeda', 4, 200000000.00, '2026-02-01', '2026-02-06', 'en_produccion'),
('El Legado Estelar', 5, 160000000.00, '2026-02-08', '2026-02-18', 'en_produccion'),
('La Caida de Orion', 6, 140000000.00, '2026-02-15', '2026-02-19', 'estrenada'),
('Rebelion Cuantica', 7, 90000000.00, '2026-02-20', '2026-02-24', 'cancelada'),
('El Origen Perdido', 8, 175000000.00, '2026-03-01', '2026-03-06', 'en_produccion'),
('Guardianes del Vacio', 9, 130000000.00, '2026-03-05', '2026-03-12', 'post_produccion');
