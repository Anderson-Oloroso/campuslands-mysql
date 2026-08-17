USE campuslands_mysql;

INSERT INTO futsal_jugadores (nombre_jugador, equipo, goles_temporada, tarjetas_amarillas, disponible, estado) VALUES
('Kevin Toc',   'Halcones Sala', 12, 2, TRUE,  'activo'),
('Bryan Ixchel','Halcones Sala', 5,  1, TRUE,  'activo'),
('Oscar Ba',    'Furia Interior',8,  3, TRUE,  'activo'),
('Luis Mux',    'Furia Interior',0,  0, TRUE,  'activo'),
('Erick Coc',   'Rayo Central',  15, 4, TRUE,  'activo'),
('Jorge Tzul',  'Rayo Central',  3,  1, FALSE, 'lesionado'),
('Manuel Pu',   'Titanes Sala',  6,  2, TRUE,  'activo'),
('Cesar Ixim',  'Titanes Sala',  0,  0, TRUE,  'activo');

-- UPDATE 1: Erick Coc anota un gol mas en un nuevo partido (incremento sobre la misma columna)
UPDATE futsal_jugadores
SET goles_temporada = goles_temporada + 1
WHERE nombre_jugador = 'Erick Coc';

-- UPDATE 2: Jorge Tzul se recupera de la lesion
UPDATE futsal_jugadores
SET estado = 'activo', disponible = TRUE
WHERE nombre_jugador = 'Jorge Tzul';

-- UPDATE 3: Oscar Ba acumula su 4ta amarilla y queda suspendido (caso limite: regla de negocio)
UPDATE futsal_jugadores
SET tarjetas_amarillas = tarjetas_amarillas + 1,
    estado = 'suspendido',
    disponible = FALSE
WHERE nombre_jugador = 'Oscar Ba';