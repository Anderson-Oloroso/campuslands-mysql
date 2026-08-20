USE campuslands_mysql;

-- Limpieza de registros previos por seguridad
TRUNCATE TABLE formulas_quimicas;

-- Inserción de 8 registros de fórmulas químicas para pruebas de agregación
INSERT INTO formulas_quimicas (codigo_formula, nombre_compuesto, categoria_quimica, cantidad_stock_gramos, pureza_porcentaje, costo_por_gramo_usd, estado_almacen) VALUES
('FORM-001', 'Ácido Sulfúrico', 'acido', 5000.00, 98.50, 0.45, 'disponible'),
('FORM-002', 'Hidróxido de Sodio', 'base', 3000.00, 99.00, 0.35, 'disponible'),
('FORM-003', 'Acetona Industrial', 'solvente', 10000.00, 99.90, 0.25, 'disponible'),
('FORM-004', 'Catalizador Platino', 'catalizador', 50.00, 99.99, 45.00, 'en_cuarentena'),
('FORM-005', 'Nitrato de Plata', 'reactivo', 200.00, 99.50, 12.00, 'disponible'),
('FORM-006', 'Cloruro de Sodio', 'reactivo', 15000.00, 99.95, 0.05, 'disponible'),
('FORM-007', 'Metanol Puro', 'solvente', 8000.00, 99.80, 0.30, 'agotado'),
('FORM-008', 'Ácido Clorhídrico', 'acido', 4000.00, 37.00, 0.20, 'en_cuarentena');