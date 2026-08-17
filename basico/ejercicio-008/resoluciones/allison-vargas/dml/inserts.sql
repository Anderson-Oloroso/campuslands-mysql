-- DML: Registro de 8 equipos e instrucciones UPDATE para simular cambios de torneo
USE campuslands_mysql;

-- Inserción inicial de 8 registros
INSERT INTO equipos_futsal_basico (nombre_equipo, capitan, goles_marcados, puntos, sancionado, estado) VALUES
('Gladiadores Futsal', 'Mario Estrada', 15, 12, 0, 'activo'),
('Rayos de Guatemala', 'Esteban Morales', 8, 6, 0, 'activo'),
('Deportivo Express', 'Kevin Aguilar', 20, 18, 0, 'activo'),
('Titanes del Balón', 'Julio Pérez', 5, 3, 1, 'activo'),
('Futsal Club Antigua', 'Diego Salazar', 12, 9, 0, 'activo'),
('Leones de la Canta', 'Fernando Gómez', 2, 0, 0, 'inactivo'),
('Guatemala City Futsal', 'Ramiro López', 18, 15, 0, 'activo'),
('Halcones Verdes', 'Oscar Méndez', 4, 1, 1, 'activo');

-- Sentencias UPDATE de prueba para modificar registros
UPDATE equipos_futsal_basico 
SET goles_marcados = goles_marcados + 3, puntos = puntos + 3 
WHERE equipo_id = 1;

UPDATE equipos_futsal_basico 
SET estado = 'expulsado' 
WHERE sancionado = 1 AND puntos < 2;

UPDATE equipos_futsal_basico 
SET capitan = 'Carlos Valenzuela' 
WHERE nombre_equipo = 'Rayos de Guatemala';
