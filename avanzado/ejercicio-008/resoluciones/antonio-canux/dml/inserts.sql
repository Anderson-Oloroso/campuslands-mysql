-- Datos de practica para futbol sala (Jugadores y Contratos sensibles).
USE campuslands_mysql;

INSERT INTO avanzado_ejercicio_008_jugadores (nombre, posicion, dorsal) 
    VALUES ('Miguel Ruiz', 'portero', 1),
    ('Jose Silva', 'cierre', 4),
    ('Carlos Diaz', 'ala', 7),
    ('David Perez', 'pivot', 9),
    ('Juan Pablo', 'ala', 10),
    ('Luis Fernandez', 'cierre', 5),
    ('Marcos Lopez', 'pivot', 11),
    ('Antonio Gomez', 'portero', 12),
    ('Javier Mota', 'ala', 8),
    ('Diego Torres', 'cierre', 3);

INSERT INTO avanzado_ejercicio_008_contratos (jugador_id, salario_mensual, fecha_vencimiento) 
    VALUES (1, 1500.00, '2027-12-31'),
    (2, 1800.00, '2026-12-31'),
    (3, 2000.00, '2028-06-30'),
    (4, 2500.00, '2027-06-30'),
    (5, 1900.00, '2026-12-31'),
    (6, 1750.00, '2027-12-31'),
    (7, 2400.00, '2028-12-31'),
    (8, 1600.00, '2026-06-30'),
    (9, 2100.00, '2027-06-30'),
    (10, 1700.00, '2028-12-31');