USE campuslands_mysql;

INSERT INTO destinos (
    nombre,
    pais,
    categoria,
    precio,
    duracion_dias,
    estado
)
VALUES
('Antigua Guatemala','Guatemala','Cultural',350.00,3,'disponible'),
('Lago Atitlan','Guatemala','Naturaleza',420.00,4,'disponible'),
('Tikal','Guatemala','Aventura',560.00,5,'disponible'),
('Cartagena','Colombia','Playa',780.00,6,'completo'),
('Cusco','Peru','Cultural',890.00,7,'disponible'),
('Machu Picchu','Peru','Aventura',1200.00,8,'disponible'),
('Cancun','Mexico','Playa',950.00,6,'completo'),
('Bocas del Toro','Panama','Playa',670.00,5,'disponible'),
('San Jose','Costa Rica','Ecoturismo',610.00,5,'disponible'),
('Monteverde','Costa Rica','Naturaleza',720.00,6,'disponible');