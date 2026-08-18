-- Datos de practica para estudio de tatuajes (Subconsultas).
USE campuslands_mysql;

INSERT INTO intermedio_ejercicio_020_artistas (nombre, especialidad) 
    VALUES ('Laura Tintas', 'Tradicional'),
    ('Leo Agujas', 'Minimalista'),
    ('Marta Real', 'Realismo'),
    ('Carlos Sombras', 'Blackwork');

INSERT INTO intermedio_ejercicio_020_tatuajes (artista_id, cliente, estilo, precio, fecha_sesion) 
    VALUES (1, 'Carlos Mendoza', 'Tradicional', 150.00, '2026-09-01'),
    (2, 'Ana Suarez', 'Minimalista', 60.00, '2026-09-02'),
    (3, 'Jorge Perez', 'Realismo', 450.00, '2026-09-05'),
    (1, 'Lucia Gomez', 'Tradicional', 200.00, '2026-09-06'),
    (4, 'Marcos Diaz', 'Blackwork', 180.00, '2026-09-10'),
    (3, 'Elena Rojas', 'Acuarela', 250.00, '2026-09-12'),
    (4, 'David Cruz', 'Blackwork', 300.00, '2026-09-15'),
    (2, 'Sara Luna', 'Minimalista', 50.00, '2026-09-16'),
    (3, 'Tomas Soto', 'Realismo', 500.00, '2026-09-20'),
    (1, 'Valeria Rios', 'Japones', 400.00, '2026-09-22');