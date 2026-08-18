USE campuslands_mysql;

INSERT INTO accesorios (
    nombre,
    categoria,
    precio,
    fecha_publicacion,
    estado
) VALUES
    ('Pulsera Minimalista', 'Pulseras', 35.90, '2026-01-15', 'activo'),
    ('Collar Estrella', 'Collares', 59.90, '2026-01-22', 'activo'),
    ('Anillo Geometrico', 'Anillos', 45.50, '2026-02-05', 'activo'),
    ('Gorra Urbana', 'Gorras', 79.90, '2026-02-18', 'activo'),
    ('Reloj Deportivo', 'Relojes', 189.90, '2026-03-03', 'activo'),
    ('Aretes Luna', 'Aretes', 42.00, '2026-03-10', 'activo'),
    ('Cinturon Clasico', 'Cinturones', 99.90, '2026-03-25', 'inactivo'),
    ('Mochila Compacta', 'Bolsos', 149.90, '2026-04-05', 'activo'),
    ('Gafas Urbanas', 'Gafas', 119.90, '2026-04-18', 'activo'),
    ('Cartera Ejecutiva', 'Carteras', 169.90, '2026-05-02', 'inactivo');