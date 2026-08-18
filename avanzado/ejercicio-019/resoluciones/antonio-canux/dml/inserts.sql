USE campuslands_mysql;

INSERT INTO avanzado_ejercicio_019_saltos (paracaidista, modalidad, altitud_pies, estado, fecha_salto) 
    VALUES ('Ana Gomez', 'Tandem', 10000, 'Programado', '2026-08-20'),
    ('Carlos Ruiz', 'Libre', 12500, 'Programado', '2026-08-21'),
    ('Laura Vega', 'Formacion', 15000, 'Programado', '2026-08-22');

UPDATE avanzado_ejercicio_019_saltos 
    SET estado = 'Completado' 
    WHERE id = 1;

UPDATE avanzado_ejercicio_019_saltos 
    SET estado = 'Cancelado' 
    WHERE id = 3;