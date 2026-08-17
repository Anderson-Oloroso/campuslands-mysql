-- Datos de practica: equipos y jugadores de una liga de futbol sala.
USE campuslands_mysql;

INSERT INTO equipos_futsal_intermedio (nombre, ciudad) VALUES
('Halcones FC', 'Bogota'),
('Pumas Salon', 'Medellin'),
('Rayo Interior', 'Cali'),
('Titanes de Sala', 'Bogota');

INSERT INTO jugadores_futsal_intermedio (id_equipo, nombre, posicion, goles) VALUES
(1, 'Mateo Rivas', 'pivote', 9),
(1, 'Santi Belmonte', 'ala', 4),
(2, 'Diego Palma', 'pivote', 7),
(2, 'Ruben Casal', 'cierre', 1),
(2, 'Felipe Nogales', 'ala', 3),
(3, 'Nico Farias', 'ala', 6),
(3, 'Andres Roble', 'cierre', 2),
(4, 'Camilo Duarte', 'portero', 0),
(4, 'Julian Mesa', 'ala', 3);

-- Beneficio directo de la 3FN: el equipo "Rayo Interior" se traslada de
-- ciudad. Como la ciudad vive UNA sola vez (en la tabla de equipos),
-- basta un solo UPDATE para que se refleje en todos sus jugadores al
-- consultarlos con JOIN, sin tocar la tabla de jugadores.
UPDATE equipos_futsal_intermedio
SET ciudad = 'Palmira'
WHERE nombre = 'Rayo Interior';
