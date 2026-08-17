-- Datos de practica para carreras urbanas (10 registros por tabla).
USE campuslands_mysql;

INSERT INTO intermedio_ejercicio_010_corredores (apodo, nombre_real) 
    VALUES ('Ghost', 'Brian Oconner'),
    ('Toretto', 'Dominic Toretto'),
    ('DriftKing', 'Takashi'),
    ('Letty', 'Leticia Ortiz'),
    ('Tej', 'Parker'),
    ('Roman', 'Pearce'),
    ('Han', 'Seoul-Oh'),
    ('Suki', 'Suki'),
    ('Hector', 'Hector'),
    ('Sean', 'Sean Boswell');

INSERT INTO intermedio_ejercicio_010_vehiculos (corredor_id, placa, modelo, notas_mecanicas) 
    VALUES (1, 'GTR-R34-99', 'Nissan Skyline GT-R R34', 'Ajuste de inyeccion electronica'),
    (2, 'CHG-900-10', 'Dodge Charger 1970', 'Supercargador calibrado'),
    (3, 'Z33-DK-01', 'Nissan Fairlady Z33', 'Suspension modificada para drift'),
    (4, 'PLY-BR-70', 'Plymouth Barracuda', 'Revision de frenos de alto rendimiento'),
    (5, 'NSX-TJ-99', 'Acura NSX', 'Actualizacion de software ECU'),
    (6, 'ECL-RM-22', 'Mitsubishi Eclipse Spyder', 'Cambio de oxido nitroso'),
    (7, 'RX7-HN-FD', 'Mazda RX-7 Veilside', 'Motor rotativo reconstruido'),
    (8, 'S2K-SK-00', 'Honda S2000', 'Pintura y kit aerodinamico ajustado'),
    (9, 'CIV-HC-92', 'Honda Civic EJ1', 'Sincronizacion de caja de cambios'),
    (10, 'STI-WRX-55', 'Subaru Impreza WRX STI', 'Requiere medicion de compresion por diagnostico de falla en turbo');