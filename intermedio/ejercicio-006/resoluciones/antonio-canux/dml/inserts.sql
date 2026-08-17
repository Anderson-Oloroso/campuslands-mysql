-- Datos de practica para autos hiperdeportivos (10+ registros por tabla).
USE campuslands_mysql;

INSERT INTO intermedio_ejercicio_006_autos (marca, modelo, precio) 
    VALUES ('Bugatti', 'Chiron', 3000000.00),
    ('Koenigsegg', 'Jesko', 3000000.00),
    ('Pagani', 'Huayra', 2500000.00),
    ('Ferrari', 'LaFerrari', 1400000.00),
    ('McLaren', 'P1', 1150000.00),
    ('Porsche', '918 Spyder', 845000.00),
    ('Rimac', 'Nevera', 2400000.00),
    ('Aston Martin', 'Valkyrie', 3200000.00),
    ('Hennessey', 'Venom F5', 2100000.00),
    ('Lamborghini', 'Sian', 3600000.00);

INSERT INTO intermedio_ejercicio_006_colores (auto_id, color) 
    VALUES (1, 'Azul Frances'), (1, 'Negro Carbono'),
    (2, 'Blanco Hielo'), (2, 'Rojo Sangre'),
    (3, 'Plata Titanio'), (4, 'Rosso Corsa'),
    (4, 'Giallo Modena'), (5, 'Naranja Papaya'),
    (6, 'Plata Liquido'), (7, 'Verde Electrizante'),
    (8, 'Verde Britanico'), (9, 'Amarillo F5'),
    (10, 'Verde Gea'), (10, 'Oro Electrum');