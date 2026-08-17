-- Datos de practica: flota de naves de una saga de ciencia ficcion.
USE campuslands_mysql;

INSERT INTO naves_saga_intermedio (nombre, clase, precio, unidades_disponibles, destacada) VALUES
('Halcon Nebular', 'caza', 1200000.00, 15, TRUE),
('Centinela de Orion', 'crucero', 6000000.00, 0, FALSE),
('Portaestrellas Andromeda', 'portanaves', 20000000.00, 3, TRUE),
('Transporte Vacio', 'transporte', 800000.00, 5, FALSE),
('Fragata Eco Solar', 'fragata', 2500000.00, 0, TRUE),
('Interceptor Nova', 'caza', 1100000.00, 20, FALSE),
('Crucero Umbral', 'crucero', 5800000.00, 12, FALSE),
('Transporte Errante', 'transporte', 750000.00, 0, FALSE),
('Portaestrellas Vigilante', 'portanaves', 21000000.00, 2, TRUE);
