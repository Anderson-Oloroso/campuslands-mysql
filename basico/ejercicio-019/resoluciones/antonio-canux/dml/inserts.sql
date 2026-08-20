USE campuslands_mysql;

-- 1. INSERT basico (un solo registro especificando todas las columnas requeridas)
INSERT INTO basico_ejercicio_019_saltos (paracaidista, tipo_salto, altitud_pies, exitoso, fecha_salto) 
    VALUES ('Juan Perez', 'Tandem', 10000, TRUE, '2026-08-10');

-- 2. INSERT multiple (varios registros optimizados en una sola sentencia)
INSERT INTO basico_ejercicio_019_saltos (paracaidista, tipo_salto, altitud_pies, exitoso, fecha_salto) 
    VALUES  ('Ana Gomez', 'Libre', 12000, TRUE, '2026-08-11'),
    ('Carlos Ruiz', 'Formacion', 15000, TRUE, '2026-08-11'),
    ('Laura Vega', 'Base', 3000, FALSE, '2026-08-12');

-- 3. INSERT omitiendo columnas con valor DEFAULT (se omite 'exitoso' y asume TRUE)
INSERT INTO basico_ejercicio_019_saltos (paracaidista, tipo_salto, altitud_pies, fecha_salto) 
    VALUES ('Diego Torres', 'Libre', 13000, '2026-08-13');

INSERT INTO basico_ejercicio_019_saltos (paracaidista, tipo_salto, altitud_pies, exitoso, fecha_salto) 
    VALUES ('Elena Flores', 'Tandem', 10000, TRUE, '2026-08-14'),
    ('Mario Silva', 'Formacion', 14500, TRUE, '2026-08-14'),
    ('Sofia Mendez', 'Libre', 12500, TRUE, '2026-08-15'),
    ('Pablo Castro', 'Base', 4000, TRUE, '2026-08-15'),
    ('Luis Marin', 'Tandem', 10000, TRUE, '2026-08-16');