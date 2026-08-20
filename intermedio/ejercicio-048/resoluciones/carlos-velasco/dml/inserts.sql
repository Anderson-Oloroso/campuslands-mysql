USE campuslands_mysql;

INSERT INTO viajes (
    destino,
    tipo_viaje,
    estado,
    duracion_dias,
    costo
) VALUES
    ('Ciudad de Guatemala', 'Cultural', 'finalizado', 3, 450.00),
    ('Antigua Guatemala', 'Cultural', 'reservado', 2, 320.00),
    ('Flores', 'Aventura', 'finalizado', 4, 680.00),
    ('Semuc Champey', 'Aventura', 'reservado', 5, 850.00),
    ('Atitlan', 'Naturaleza', 'planificado', 3, 520.00),
    ('Livingston', 'Playa', 'finalizado', 4, 720.00),
    ('Monterrico', 'Playa', 'reservado', 2, 380.00),
    ('Quetzaltenango', 'Cultural', 'planificado', 3, 410.00),
    ('Tikal', 'Aventura', 'finalizado', 3, 590.00),
    ('El Paredon', 'Playa', 'planificado', 2, 350.00);