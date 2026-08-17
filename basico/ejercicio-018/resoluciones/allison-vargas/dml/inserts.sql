-- DML: Registro de destinos turísticos asegurando la unicidad de las llaves primarias
USE campuslands_mysql;

INSERT INTO destinos_turismo (codigo_destino, nombre, region, categoria, costo_promedio_dia, cupo_maximo, activo) VALUES
('DEST-GUA-001', 'Tikal y Flores', 'Petén', 'cultural', 120.00, 50, TRUE),
('DEST-GUA-002', 'Lago de Atitlán', 'Sololá', 'ecoturismo', 85.00, 40, TRUE),
('DEST-GUA-003', 'Antigua Guatemala', 'Sacatepéquez', 'cultural', 95.00, 60, TRUE),
('DEST-GUA-004', 'Semuc Champey', 'Alta Verapaz', 'aventura', 70.00, 25, TRUE),
('DEST-GUA-005', 'Playa de Monterrico', 'Santa Rosa', 'playa', 60.00, 35, TRUE),
('DEST-GUA-006', 'Volcán de Acatenango', 'Chimaltenango', 'montaña', 50.00, 20, TRUE),
('DEST-GUA-007', 'Río Dulce y Livingston', 'Izabal', 'ecoturismo', 110.00, 30, FALSE),
('DEST-GUA-008', 'Fuentes Georginas', 'Quetzaltenango', 'montaña', 65.00, 30, TRUE);
