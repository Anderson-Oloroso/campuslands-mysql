USE campuslands_mysql;

INSERT INTO destinos
    (nombre, pais, tipo_destino, precio_desde, disponible)
VALUES
    ('Antigua Guatemala', 'Guatemala', 'Ciudad Colonial', 850.00, TRUE),
    ('Tikal', 'Guatemala', 'Arqueológico', 650.00, TRUE),
    ('Lago de Atitlán', 'Guatemala', 'Naturaleza', 900.00, TRUE),
    ('Cancún', 'México', 'Playa', 3200.00, TRUE),
    ('Ciudad de México', 'México', 'Ciudad', 2500.00, TRUE),
    ('Oaxaca', 'México', 'Cultural', 2100.00, TRUE),
    ('Roatán', 'Honduras', 'Playa', 2100.00, TRUE),
    ('Copán Ruinas', 'Honduras', 'Arqueológico', 1200.00, TRUE),
    ('Cartagena', 'Colombia', 'Playa', 2900.00, TRUE),
    ('Cusco', 'Perú', 'Histórico', 3500.00, TRUE),
    ('Machu Picchu', 'Perú', 'Arqueológico', 3800.00, TRUE),
    ('Buenos Aires', 'Argentina', 'Ciudad', 4200.00, FALSE);