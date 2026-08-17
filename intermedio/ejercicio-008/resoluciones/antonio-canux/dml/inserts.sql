-- Datos de practica para futbol sala (10+ registros).
USE campuslands_mysql;

INSERT INTO intermedio_ejercicio_008_categorias (nivel, costo_inscripcion, premio_campeon) 
    VALUES ('Primera Division', 5000.00, 25000.00),
    ('Segunda Division', 3000.00, 10000.00),
    ('Tercera Division', 1500.00, 5000.00),
    ('Amateur', 500.00, 1000.00),
    ('Veteranos', 800.00, 2000.00);

INSERT INTO intermedio_ejercicio_008_equipos (nombre, entrenador, categoria_id) 
    VALUES ('Boca Futsal', 'Miguel Rojas', 1),
    ('River Sala', 'Carlos Perez', 1),
    ('Independiente FS', 'Luis Gomez', 2),
    ('Racing Club', 'Jorge Diaz', 2),
    ('San Lorenzo', 'Mario Lopez', 1),
    ('Huracan Sala', 'Fernando Ruiz', 3),
    ('Velez Futsal', 'Pablo Garcia', 3),
    ('Lanus FS', 'Diego Torres', 4),
    ('Banfield Sala', 'Andres Silva', 4),
    ('Estudiantes', 'Hector Castro', 5);