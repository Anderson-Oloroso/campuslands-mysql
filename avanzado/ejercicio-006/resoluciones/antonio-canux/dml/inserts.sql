-- Datos de practica para autos hiperdeportivos (10 registros).
USE campuslands_mysql;

INSERT INTO avanzado_ejercicio_006_marcas (nombre, pais_origen) 
    VALUES ('Bugatti', 'Francia'),
    ('Koenigsegg', 'Suecia'),
    ('Pagani', 'Italia'),
    ('Ferrari', 'Italia'),
    ('McLaren', 'Reino Unido');

INSERT INTO avanzado_ejercicio_006_hiperdeportivos (marca_id, modelo, caballos_fuerza, velocidad_maxima, precio) 
    VALUES (1, 'Chiron Super Sport 300+', 1600, 490, 3900000.00),
    (1, 'Divo', 1500, 380, 5800000.00),
    (2, 'Jesko Absolut', 1600, 531, 3000000.00),
    (2, 'Gemera', 1700, 400, 1700000.00),
    (3, 'Huayra BC', 789, 383, 2550000.00),
    (3, 'Zonda R', 740, 350, 2200000.00),
    (4, 'LaFerrari', 963, 350, 1400000.00),
    (4, 'SF90 Stradale', 986, 340, 625000.00),
    (5, 'Speedtail', 1036, 403, 2250000.00),
    (5, 'Senna', 789, 335, 1000000.00);