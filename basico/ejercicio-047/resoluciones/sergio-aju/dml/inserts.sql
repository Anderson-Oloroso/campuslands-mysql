USE campuslands_mysql;

-- Inserción de al menos 8 registros de prendas de ropa con variaciones de tipo de dato (texto, numérico, fechas, enumerados y booleanos)
INSERT INTO inventario_tienda_ropa (codigo_sku, nombre_prenda, categoria, talla, precio_unitario, stock_disponible, es_impermeable, fecha_ingreso, estado_prenda) VALUES
('ROPA-001', 'Camiseta Casual Básica', 'Camisetas', 'M', 19.99, 45, 0, '2026-05-10', 'disponible'),
('ROPA-002', 'Jeans Slim Fit Clásico', 'Pantalones', 'L', 45.50, 30, 0, '2026-06-01', 'disponible'),
('ROPA-003', 'Chaqueta Impermeable Sport', 'Chaquetas', 'L', 89.99, 12, 1, '2026-04-15', 'en_oferta'),
('ROPA-004', 'Hoodie Oversize con Capucha', 'Hoodies', 'XL', 55.00, 25, 0, '2026-07-10', 'disponible'),
('ROPA-005', 'Vestido Floral Veraniego', 'Vestidos', 'S', 39.99, 0, 0, '2026-03-20', 'agotado'),
('ROPA-006', 'Pantalón Jogger Deportivo', 'Pantalones', 'M', 35.00, 40, 0, '2026-06-18', 'disponible'),
('ROPA-007', 'Camisa Formal Oxford', 'Camisas', 'L', 42.00, 18, 0, '2026-05-25', 'disponible'),
('ROPA-008', 'Abrigo de Invierno Térmico', 'Abrigos', 'XL', 120.00, 8, 1, '2026-02-10', 'descontinuado');