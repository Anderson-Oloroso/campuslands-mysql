-- Datos de practica. Puedes cambiarlos o agregar mas filas.
USE campuslands_mysql;

INSERT INTO partidos_pingpong (jugador_local, jugador_visitante, sets_local, sets_visitante, sede, fecha_partido) VALUES
('Carlos Rios', 'Ana Mejia', 3, 1, 'Mesa 1', '2025-01-05'),
('Ana Mejia', 'Luis Perez', 3, 0, 'Mesa 2', '2025-01-06'),
('Luis Perez', 'Carlos Rios', 2, 3, 'Mesa 1', '2025-01-07'),
('Maria Lopez', 'Carlos Rios', 3, 2, 'Mesa 3', '2025-01-08'),
('Ana Mejia', 'Maria Lopez', 1, 3, 'Mesa 2', '2025-01-09'),
('Luis Perez', 'Maria Lopez', 3, 1, 'Mesa 1', '2025-01-10'),
('Carlos Rios', 'Ana Mejia', 0, 3, 'Mesa 3', '2025-01-11'),
('Maria Lopez', 'Luis Perez', 3, 0, 'Mesa 2', '2025-01-12'),
('Ana Mejia', 'Carlos Rios', 3, 2, 'Mesa 1', '2025-01-13'),
('Luis Perez', 'Ana Mejia', 2, 3, 'Mesa 3', '2025-01-14');

-- Ejemplo de fila que violaria el CHECK (empate en sets), queda comentada:
-- INSERT INTO partidos_pingpong (jugador_local, jugador_visitante, sets_local, sets_visitante, sede, fecha_partido)
-- VALUES ('Carlos Rios', 'Luis Perez', 2, 2, 'Mesa 1', '2025-01-15');
