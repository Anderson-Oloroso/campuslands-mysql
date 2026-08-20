USE campuslands_mysql;

INSERT INTO viajes (
    destino,
    pais,
    categoria,
    precio,
    duracion_dias,
    fecha_salida,
    temporada,
    estado
) VALUES
    ('Cartagena', 'Colombia', 'playa', 1200.00, 5, '2026-09-10', 'alta', 'disponible'),
    ('San Andrés', 'Colombia', 'playa', 1450.00, 6, '2026-10-05', 'alta', 'disponible'),
    ('Cusco', 'Perú', 'montaña', 1600.00, 7, '2026-09-18', 'media', 'disponible'),
    ('Machu Picchu', 'Perú', 'aventura', 1850.00, 8, '2026-10-12', 'alta', 'disponible'),
    ('Antigua Guatemala', 'Guatemala', 'cultural', 550.00, 3, '2026-08-28', 'baja', 'disponible'),
    ('Tikal', 'Guatemala', 'naturaleza', 700.00, 4, '2026-09-02', 'media', 'disponible'),
    ('Ciudad de México', 'México', 'cultural', 980.00, 5, '2026-09-25', 'media', 'agotado'),
    ('Cancún', 'México', 'playa', 1350.00, 5, '2026-10-20', 'alta', 'disponible'),
    ('Bariloche', 'Argentina', 'montaña', 1750.00, 7, '2026-07-15', 'baja', 'disponible'),
    ('Buenos Aires', 'Argentina', 'cultural', 1100.00, 6, '2026-11-08', 'media', 'disponible'),
    ('Monteverde', 'Costa Rica', 'naturaleza', 1250.00, 5, '2026-11-15', 'alta', 'disponible'),
    ('Arenal', 'Costa Rica', 'aventura', 1400.00, 6, '2026-12-01', 'alta', 'cancelado');