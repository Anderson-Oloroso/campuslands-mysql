-- DML: Inserción de paquetes turísticos e ingreso de reservas usando funciones SQL
USE campuslands_mysql;

-- Inserción de 8 destinos turísticos
INSERT INTO paquetes_turismo (codigo_paquete, destino, categoria, precio_por_noche, cupos_disponibles) VALUES
('TUR-GUA-001', 'Tikal y Flores, Petén', 'cultural', 120.00, 15),
('TUR-GUA-002', 'Lago de Atitlán, Sololá', 'ecoturismo', 85.00, 20),
('TUR-GUA-003', 'Antigua Guatemala', 'cultural', 95.00, 25),
('TUR-GUA-004', 'Semuc Champey, Alta Verapaz', 'aventura', 70.00, 12),
('TUR-GUA-005', 'Monterrico, Santa Rosa', 'playa', 60.00, 18),
('TUR-GUA-006', 'Volcán de Acatenango', 'montaña', 50.00, 10),
('TUR-GUA-007', 'Río Dulce, Izabal', 'ecoturismo', 110.00, 14),
('TUR-GUA-008', 'Quetzaltenango y Fuentes Georginas', 'montaña', 65.00, 16);

-- Registro de reservas aprovechando las funciones determinísticas
INSERT INTO reservas_turismo (paquete_id, cliente_nombre, fecha_inicio, fecha_fin, numero_personas, monto_total) VALUES
(1, 'Sofía Martínez', '2026-08-01', '2026-08-05', 4, calcular_precio_con_descuento(120.00, calcular_dias_viaje('2026-08-01', '2026-08-05'), 4)),
(2, 'Diego Arriola', '2026-08-10', '2026-08-13', 2, calcular_precio_con_descuento(85.00, calcular_dias_viaje('2026-08-10', '2026-08-13'), 2)),
(3, 'Mariana Castillo', '2026-08-15', '2026-08-20', 3, calcular_precio_con_descuento(95.00, calcular_dias_viaje('2026-08-15', '2026-08-20'), 3)),
(4, 'Carlos Méndez', '2026-09-01', '2026-09-04', 5, calcular_precio_con_descuento(70.00, calcular_dias_viaje('2026-09-01', '2026-09-04'), 5)),
(5, 'Andrea Morales', '2026-09-10', '2026-09-12', 2, calcular_precio_con_descuento(60.00, calcular_dias_viaje('2026-09-10', '2026-09-12'), 2)),
(6, 'Gabriel Estrada', '2026-09-15', '2026-09-17', 1, calcular_precio_con_descuento(50.00, calcular_dias_viaje('2026-09-15', '2026-09-17'), 1)),
(7, 'Lucía Sandoval', '2026-10-01', '2026-10-06', 4, calcular_precio_con_descuento(110.00, calcular_dias_viaje('2026-10-01', '2026-10-06'), 4)),
(8, 'Fernando Gutiérrez', '2026-10-10', '2026-10-13', 3, calcular_precio_con_descuento(65.00, calcular_dias_viaje('2026-10-10', '2026-10-13'), 3));
