USE campuslands_mysql;

INSERT INTO participantes (
    nombre,
    apellido,
    categoria,
    distancia_km,
    tiempo_minutos,
    estado
) VALUES
('Carlos', 'Mendez', 'juvenil', 5.00, 28.50, 'finalizo'),
('Laura', 'Gomez', 'juvenil', 5.00, 31.20, 'finalizo'),
('Diego', 'Ramirez', 'adulto', 10.00, 52.40, 'finalizo'),
('Ana', 'Lopez', 'adulto', 10.00, 58.70, 'finalizo'),
('Miguel', 'Castillo', 'adulto', 10.00, 61.30, 'finalizo'),
('Sofia', 'Hernandez', 'senior', 5.00, 34.80, 'finalizo'),
('Jorge', 'Perez', 'senior', 10.00, 65.20, 'finalizo'),
('Ricardo', 'Morales', 'adulto', 10.00, 70.50, 'retirado');