USE campuslands_mysql;

INSERT INTO destinos
    (nombre, pais, tipo_destino, precio_desde, disponible, fecha_registro)
VALUES
    ('Antigua Guatemala', 'Guatemala', 'Ciudad Colonial', 850.00, TRUE, '2026-08-01'),
    ('Tikal', 'Guatemala', 'Arqueológico', 650.00, TRUE, '2026-08-02'),
    ('Lago de Atitlán', 'Guatemala', 'Naturaleza', 900.00, TRUE, '2026-08-03'),
    ('Cancún', 'México', 'Playa', 3200.00, TRUE, '2026-08-04'),
    ('Ciudad de México', 'México', 'Ciudad', 2500.00, TRUE, '2026-08-05'),
    ('Roatán', 'Honduras', 'Playa', 2100.00, TRUE, '2026-08-06'),
    ('Cartagena', 'Colombia', 'Playa', 2900.00, TRUE, '2026-08-07'),
    ('Cusco', 'Perú', 'Histórico', 3500.00, TRUE, '2026-08-08'),
    ('Machu Picchu', 'Perú', 'Arqueológico', 3800.00, TRUE, '2026-08-09'),
    ('Buenos Aires', 'Argentina', 'Ciudad', 4200.00, FALSE, '2026-08-10');