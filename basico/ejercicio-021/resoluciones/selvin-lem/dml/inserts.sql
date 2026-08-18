-- Ejercicio 021: datos de proyectos de dibujo digital

USE campuslands_mysql;

INSERT INTO proyectos_dibujo_021
    (titulo, artista, categoria, estado, precio, horas_estimadas, fecha_entrega)
VALUES
    ('Ciudad nocturna', 'Ana Torres', 'ilustracion', 'aprobado', 850.00, 24, '2026-08-20'),
    ('Retrato de estudio', 'Luis Gomez', 'retrato', 'revision', 420.00, 12, '2026-08-22'),
    ('Guardian del bosque', 'Marta Ruiz', 'fantasia', 'aprobado', 1250.00, 40, '2026-08-25'),
    ('Mascota espacial', 'Diego Leon', 'personaje', 'borrador', 300.00, 8, '2026-08-28'),
    ('Paisaje costero', 'Sofia Perez', 'paisaje', 'aprobado', 680.00, 18, '2026-09-02'),
    ('Robot explorador', 'Carlos Diaz', 'ciencia-ficcion', 'revision', 970.00, 30, '2026-09-05'),
    ('Bodegon digital', 'Laura Castro', 'conceptual', 'archivado', 210.00, 6, '2026-09-07'),
    ('Mercado colonial', 'Jorge Mendez', 'ilustracion', 'aprobado', 560.00, 22, '2026-09-10'),
    ('Dragona roja', 'Valentina Rios', 'fantasia', 'borrador', 1100.00, 36, '2026-09-14'),
    ('Autorretrato azul', 'Nicolas Silva', 'retrato', 'revision', 475.00, 14, '2026-09-18');
