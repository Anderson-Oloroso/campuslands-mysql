-- Datos de practica: plantilla de jugadores de un equipo de futbol sala.
USE campuslands_mysql;

INSERT INTO jugadores_futsal_basico (nombre, equipo, posicion, goles, tarjetas_amarillas, precio_ficha, estado) VALUES
('Mateo Rivas', 'Halcones FC', 'pivote', 9, 2, 8000.00, 'activo'),
('Santi Belmonte', 'Halcones FC', 'ala', 4, 1, 5000.00, 'activo'),
('Diego Palma', 'Pumas Salon', 'pivote', 7, 3, 7200.00, 'suspendido'),
('Ruben Casal', 'Pumas Salon', 'cierre', 1, 0, 3500.00, 'activo'),
('Nico Farias', 'Rayo Interior', 'ala', 6, 2, 6000.00, 'activo'),
('Andres Roble', 'Rayo Interior', 'cierre', 2, 4, 3800.00, 'suspendido'),
('Camilo Duarte', 'Titanes de Sala', 'portero', 0, 0, 4200.00, 'activo'),
('Julian Mesa', 'Titanes de Sala', 'ala', 3, 1, 4500.00, 'activo');

-- UPDATE 1: una sola fila identificada por su PRIMARY KEY (se lesiona en entrenamiento).
UPDATE jugadores_futsal_basico
SET estado = 'lesionado'
WHERE id_jugador = 1;

-- UPDATE 2: varias filas que cumplen una condicion (los suspendidos cumplieron
-- la sancion y vuelven a activo, con las tarjetas reiniciadas).
UPDATE jugadores_futsal_basico
SET estado = 'activo', tarjetas_amarillas = 0
WHERE estado = 'suspendido';

-- UPDATE 3: actualizacion con una expresion (la ficha sube 10% para los
-- jugadores con mas de 5 goles, por buen rendimiento en la temporada).
UPDATE jugadores_futsal_basico
SET precio_ficha = precio_ficha * 1.10
WHERE goles > 5;

-- UPDATE 4: actualizacion masiva con CASE, para clasificar a todos los
-- jugadores por categoria segun sus goles anotados.
UPDATE jugadores_futsal_basico
SET categoria = CASE
  WHEN goles >= 8 THEN 'estrella'
  WHEN goles >= 3 THEN 'regular'
  ELSE 'banca'
END;
