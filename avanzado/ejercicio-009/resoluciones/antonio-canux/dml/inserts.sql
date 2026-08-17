-- Datos de practica para kickboxing (Peleadores y estadisticas).
USE campuslands_mysql;

INSERT INTO avanzado_ejercicio_009_peleadores (nombre, categoria, victorias, derrotas, puntos_ranking, estado) 
    VALUES ('Badr Hari', 'Peso Pesado', 106, 17, 1500, 'activo'),
    ('Rico Verhoeven', 'Peso Pesado', 60, 10, 2100, 'activo'),
    ('Gokhan Saki', 'Peso Semi Pesado', 83, 12, 1850, 'activo'),
    ('Buakaw Banchamek', 'Peso Medio', 240, 24, 2500, 'activo'),
    ('Giorgio Petrosyan', 'Peso Ligero', 104, 3, 2400, 'activo'),
    ('Peter Aerts', 'Peso Pesado', 108, 35, 1200, 'inactivo'),
    ('Ernesto Hoost', 'Peso Pesado', 99, 21, 1400, 'inactivo'),
    ('Semmy Schilt', 'Peso Pesado', 43, 6, 1950, 'inactivo'),
    ('Andy Souwer', 'Peso Ligero', 161, 22, 2200, 'activo'),
    ('Bob Sapp', 'Peso Pesado', 12, 19, 300, 'activo');