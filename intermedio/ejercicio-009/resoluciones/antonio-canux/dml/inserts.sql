-- Datos de practica para kickboxing (Gimnasios y Peleadores).
USE campuslands_mysql;

INSERT INTO intermedio_ejercicio_009_gimnasios (nombre, ubicacion) 
    VALUES ('Mike''s Gym', 'Amsterdam'),
    ('Mejiro Gym', 'Amsterdam'),
    ('Banchamek Gym', 'Bangkok'),
    ('Team Petrosyan', 'Milan'),
    ('Hemmers Gym', 'Breda'),
    ('Golden Glory', 'Breda');

INSERT INTO intermedio_ejercicio_009_peleadores (nombre, categoria_peso, gimnasio_id) 
    VALUES ('Badr Hari', 'Peso Pesado', 1),
    ('Gokhan Saki', 'Peso Semi Pesado', 1),
    ('Rob Kaman', 'Peso Medio', 2),
    ('Andy Souwer', 'Peso Ligero', 2),
    ('Buakaw Banchamek', 'Peso Medio', 3),
    ('Superbon', 'Peso Pluma', 3),
    ('Giorgio Petrosyan', 'Peso Ligero', 4),
    ('Armen Petrosyan', 'Peso Ligero', 4),
    ('Ramon Dekkers', 'Peso Welter', 5),
    ('Alistair Overeem', 'Peso Pesado', 5);