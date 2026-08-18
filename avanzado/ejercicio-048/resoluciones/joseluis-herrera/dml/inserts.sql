USE campuslands_mysql;

INSERT INTO destinos (
    nombre,
    pais,
    categoria,
    precio,
    duracion_dias,
    fecha_salida,
    estado
)
VALUES
('Antigua Guatemala','Guatemala','Cultural',350.00,3,'2026-09-10','disponible'),
('Lago Atitlan','Guatemala','Naturaleza',420.00,4,'2026-09-18','disponible'),
('Tikal','Guatemala','Aventura',560.00,5,'2026-10-05','disponible'),
('Cartagena','Colombia','Playa',780.00,6,'2026-10-12','completo'),
('Cusco','Peru','Cultural',890.00,7,'2026-11-02','disponible'),
('Machu Picchu','Peru','Aventura',1200.00,8,'2026-11-15','disponible'),
('Cancun','Mexico','Playa',950.00,6,'2026-12-01','completo'),
('Bocas del Toro','Panama','Playa',670.00,5,'2026-09-28','disponible'),
('San Jose','Costa Rica','Ecoturismo',610.00,5,'2026-10-20','disponible'),
('Monteverde','Costa Rica','Naturaleza',720.00,6,'2026-11-10','disponible');