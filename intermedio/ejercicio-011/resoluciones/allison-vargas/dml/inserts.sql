-- DML: Registro de sets disputados en Ping-Pong validados por restricciones CHECK
USE campuslands_mysql;

INSERT INTO marcadores_pingpong (jugador_local, jugador_visitante, puntos_local, puntos_visitante, set_numero, duracion_minutos, categoria) VALUES
('Carlos Morales', 'Lucía Fernández', 11, 8, 1, 12.5, 'Mayores'),
('Carlos Morales', 'Lucía Fernández', 14, 12, 2, 18.0, 'Mayores'),
('Diego Ramírez', 'Andrea Salazar', 9, 11, 1, 10.0, 'Sub-18'),
('Diego Ramírez', 'Andrea Salazar', 11, 6, 2, 8.5, 'Sub-18'),
('Roberto Gómez', 'Mario Estrada', 11, 4, 1, 9.0, 'Veteranos'),
('Sofia Paiz', 'Carlos Morales', 12, 10, 1, 15.0, 'Mayores'),
('Gabriel Arriola', 'Diego Ramírez', 7, 11, 1, 11.0, 'Sub-18'),
('Lucía Fernández', 'Sofia Paiz', 11, 9, 1, 13.5, 'Mayores');
