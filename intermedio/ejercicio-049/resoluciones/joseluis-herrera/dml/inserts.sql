USE campuslands_mysql;

INSERT INTO saltos (
    participante,
    nivel,
    altura_metros,
    costo,
    fecha_salto,
    estado
)
VALUES
('Ana Lopez', 'Principiante', 3000, 180.00, '2026-09-10', 'completado'),
('Carlos Mendez', 'Intermedio', 3500, 220.00, '2026-09-12', 'reservado'),
('Lucia Herrera', 'Avanzado', 4200, 310.00, '2026-09-15', 'completado'),
('Miguel Soto', 'Principiante', 3000, 180.00, '2026-09-18', 'reservado'),
('Sofia Ramirez', 'Intermedio', 3800, 250.00, '2026-09-20', 'completado'),
('Diego Castillo', 'Avanzado', 4500, 340.00, '2026-09-22', 'cancelado'),
('Valeria Cruz', 'Principiante', 2800, 170.00, '2026-09-25', 'completado'),
('Jorge Perez', 'Intermedio', 3600, 230.00, '2026-09-27', 'reservado'),
('Mariana Gomez', 'Avanzado', 4300, 320.00, '2026-09-29', 'completado'),
('Fernando Diaz', 'Principiante', 3000, 185.00, '2026-10-02', 'reservado');