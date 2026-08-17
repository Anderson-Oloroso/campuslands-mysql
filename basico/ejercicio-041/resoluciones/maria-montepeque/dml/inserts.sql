-- Datos de practica: jugadores de un club de pingpong.
USE campuslands_mysql;

INSERT INTO jugadores_pingpong_basico (nombre, categoria, ranking_puntos, partidos_ganados, mano_dominante, estado) VALUES
('Mateo Rivas', 'profesional', 2450, 58, 'derecha', 'activo'),
('Santi Belmonte', 'avanzado', 1900, 34, 'izquierda', 'activo'),
('Diego Palma', 'intermedio', 1350, 20, 'derecha', 'activo'),
('Ruben Casal', 'principiante', 1050, 5, 'derecha', 'activo'),
('Nico Farias', 'avanzado', 2100, 41, 'izquierda', 'activo'),
('Andres Roble', 'intermedio', 1420, 22, 'derecha', 'inactivo'),
('Camilo Duarte', 'profesional', 2600, 65, 'derecha', 'activo'),
('Julian Mesa', 'principiante', 1000, 2, 'izquierda', 'activo'),
('Felipe Nogales', 'intermedio', 1380, 18, 'derecha', 'inactivo');
