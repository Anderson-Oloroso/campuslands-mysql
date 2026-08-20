-- Ejercicio 018 - PRIMARY KEY para viajes y turismo
-- Ejecutar despues de schema.sql

USE campuslands_mysql;

INSERT INTO destinos_turisticos (nombre_destino, pais, tipo_destino, costo_paquete, cupos_disponibles, fecha_salida) VALUES
('Playa Escondida',      'Costa Rica',  'playa',     650.00, 12, '2026-06-15'),
('Sendero del Volcan',   'Guatemala',   'montaña',   420.00, 8,  '2026-05-20'),
('Centro Historico',     'Mexico',     'cultural',  380.00, 20, '2026-06-02'),
('Ruta de Aventura',     'Costa Rica',  'aventura',  590.00, 0,  '2026-05-10'),
('Ciudad Colonial',      'Guatemala',   'ciudad',    310.00, 15, '2026-06-25'),
('Reserva Nubosa',       'Panama',      'montaña',   470.00, 6,  '2026-07-05'),
('Costa Dorada',         'Mexico',     'playa',     720.00, 10, '2026-07-18'),
('Museo y Mercado',      'Guatemala',   'cultural',  260.00, 25, '2026-06-08'),
('Rapidos del Rio',      'Costa Rica',  'aventura',  540.00, 5,  '2026-07-22'),
('Malecon Turistico',    'Panama',      'ciudad',    295.00, 18, '2026-08-01');
