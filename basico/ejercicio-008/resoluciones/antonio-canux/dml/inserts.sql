-- Datos de practica para futbol sala (10 registros).
USE campuslands_mysql;

INSERT INTO basico_ejercicio_008 (nombre, posicion, goles, tarjetas_amarillas, salario, estado) 
    VALUES ('Miguel Ruiz', 'portero', 1, 0, 1500.00, 'activo'),
    ('Jose Silva', 'cierre', 5, 4, 1800.00, 'activo'),
    ('Carlos Diaz', 'ala', 12, 1, 2000.00, 'lesionado'),
    ('David Perez', 'pivot', 25, 2, 2500.00, 'activo'),
    ('Juan Pablo', 'ala', 18, 0, 1900.00, 'activo'),
    ('Luis Fernandez', 'cierre', 3, 5, 1750.00, 'suspendido'),
    ('Marcos Lopez', 'pivot', 22, 1, 2400.00, 'activo'),
    ('Antonio Gomez', 'portero', 0, 0, 1600.00, 'activo'),
    ('Javier Mota', 'ala', 15, 3, 2100.00, 'activo'),
    ('Diego Torres', 'cierre', 2, 2, 1700.00, 'lesionado');