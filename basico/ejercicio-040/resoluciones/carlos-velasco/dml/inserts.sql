USE campuslands_mysql;

INSERT INTO carreras
    (nombre, ciudad, distancia_km, costo_inscripcion, fecha_carrera, estado)
VALUES
    ('Carrera Ciudad Central', 'Ciudad de Guatemala', 5.00, 25.00, '2026-03-15', 'finalizada'),
    ('Reto Urbano Primavera', 'Quetzaltenango', 10.00, 40.00, '2026-04-12', 'finalizada'),
    ('Ruta Nocturna', 'Antigua Guatemala', 8.00, 35.00, '2026-05-20', 'finalizada'),
    ('Gran Carrera Metropolitana', 'Ciudad de Guatemala', 15.00, 50.00, '2026-06-14', 'programada');


INSERT INTO corredores
    (nombre, edad, categoria, estado)
VALUES
    ('Carlos Mendez', 22, 'amateur', 'activo'),
    ('Diego Ramirez', 28, 'elite', 'activo'),
    ('Mateo Castillo', 19, 'juvenil', 'activo'),
    ('Andres Herrera', 31, 'elite', 'activo'),
    ('Luis Morales', 25, 'amateur', 'activo'),
    ('Jorge Salazar', 34, 'elite', 'activo'),
    ('Kevin Torres', 20, 'amateur', 'activo'),
    ('Daniel Vargas', 29, 'amateur', 'inactivo');


INSERT INTO participaciones
    (id_carrera, id_corredor, posicion_final, tiempo_minutos)
VALUES
    (1, 1, 8, 29.50),
    (1, 2, 2, 22.40),
    (2, 2, 1, 44.20),
    (2, 3, 7, 55.80),
    (3, 4, 3, 38.60),
    (3, 5, 6, 45.30);