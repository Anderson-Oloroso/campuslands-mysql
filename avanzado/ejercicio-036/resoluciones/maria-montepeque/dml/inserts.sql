-- Datos de practica: encargos de un concesionario de autos hiperdeportivos.
-- Volumen mayor a lo usual para que EXPLAIN tenga un dataset realista
-- sobre el que razonar (con muy pocas filas MySQL suele preferir un
-- escaneo completo aunque exista un indice).
USE campuslands_mysql;

INSERT INTO encargos_avanzado (marca, cliente, precio, fecha_encargo, estado) VALUES
('Ferrari', 'Coleccion Andina', 625000.00, '2026-01-05', 'entregado'),
('Ferrari', 'Roberto Silva', 322000.00, '2026-01-20', 'entregado'),
('Ferrari', 'Inversiones Vega', 780000.00, '2026-02-02', 'en_produccion'),
('Ferrari', 'Camila Ruiz', 340000.00, '2026-02-14', 'entregado'),
('Ferrari', 'Coleccion Andina', 900000.00, '2026-03-01', 'pendiente'),
('Ferrari', 'Pedro Ariza', 315000.00, '2026-03-18', 'entregado'),
('Lamborghini', 'Coleccion Andina', 608000.00, '2026-01-08', 'entregado'),
('Lamborghini', 'Indie Motors SAS', 420000.00, '2026-01-22', 'entregado'),
('Lamborghini', 'Editorial Luna', 750000.00, '2026-02-05', 'en_produccion'),
('Lamborghini', 'Roberto Silva', 480000.00, '2026-02-19', 'cancelado'),
('Lamborghini', 'Indie Motors SAS', 500000.00, '2026-03-03', 'entregado'),
('Lamborghini', 'Camila Ruiz', 620000.00, '2026-03-21', 'pendiente'),
('McLaren', 'Indie Motors SAS', 324000.00, '2026-01-12', 'entregado'),
('McLaren', 'Indie Motors SAS', 280000.00, '2026-01-27', 'entregado'),
('McLaren', 'Coleccion Andina', 900000.00, '2026-02-09', 'en_produccion'),
('McLaren', 'Pedro Ariza', 310000.00, '2026-02-24', 'entregado'),
('McLaren', 'Camila Ruiz', 950000.00, '2026-03-08', 'pendiente'),
('McLaren', 'Indie Motors SAS', 295000.00, '2026-03-25', 'entregado'),
('Bugatti', 'Editorial Luna', 3200000.00, '2026-01-15', 'entregado'),
('Bugatti', 'Coleccion Andina', 3600000.00, '2026-01-30', 'en_produccion'),
('Bugatti', 'Pedro Ariza', 3100000.00, '2026-02-12', 'entregado'),
('Bugatti', 'Roberto Silva', 3400000.00, '2026-02-27', 'cancelado'),
('Bugatti', 'Camila Ruiz', 3250000.00, '2026-03-10', 'entregado'),
('Bugatti', 'Editorial Luna', 3700000.00, '2026-03-29', 'pendiente');
