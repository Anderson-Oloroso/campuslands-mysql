-- Datos de practica para viajes y turismo (GROUP BY).
USE campuslands_mysql;

INSERT INTO intermedio_ejercicio_018_vuelos (aerolinea, destino, estado_vuelo, pasajeros, precio_boleto, fecha_vuelo) 
    VALUES ('Avianca', 'Madrid, España', 'Completado', 250, 850.00, '2026-05-10'),
    ('Avianca', 'Bogota, Colombia', 'Completado', 180, 300.00, '2026-05-12'),
    ('Avianca', 'Madrid, España', 'Retrasado', 240, 850.00, '2026-05-15'),
    ('Latam', 'Lima, Peru', 'Completado', 150, 250.00, '2026-06-01'),
    ('Latam', 'Bogota, Colombia', 'Completado', 160, 280.00, '2026-06-05'),
    ('Latam', 'Miami, USA', 'Cancelado', 200, 450.00, '2026-06-10'),
    ('Iberia', 'Madrid, España', 'Completado', 300, 900.00, '2026-07-20'),
    ('Iberia', 'Roma, Italia', 'Completado', 280, 880.00, '2026-07-22'),
    ('American Airlines', 'Miami, USA', 'Completado', 210, 500.00, '2026-08-05'),
    ('American Airlines', 'Nueva York, USA', 'Completado', 220, 550.00, '2026-08-08'),
    ('American Airlines', 'Miami, USA', 'Retrasado', 190, 480.00, '2026-08-10'),
    ('Copa Airlines', 'Lima, Peru', 'Completado', 140, 260.00, '2026-08-15');