use marketplace_accesorios_db;

insert into categorias (nombre_categoria, descripcion) values
('joyeria', 'collares, anillos, pulseras y aretes de tendencia coquette y elegante'),
('bolsos', 'carteras, mochilas y bolsos de mano de diversos estilos'),
('tecnologia', 'accesorios para dispositivos moviles y computadoras'),
('cabello', 'pinzas, ganchos, diademas y adornos para el cabello');

insert into accesorios (codigo_sku, nombre_accesorio, id_categoria, precio, stock, estado_accesorio) values
('ACC-001', 'collar con dije de corazon plateado', 1, 45.50, 25, 'disponible'),
('ACC-002', 'anillo ajustable con perlas finas', 1, 28.00, 40, 'disponible'),
('ACC-003', 'mochila escolar estilo aesthetic pastel', 2, 120.00, 15, 'disponible'),
('ACC-004', 'bolso de mano negro minimalista', 2, 95.00, 8, 'disponible'),
('ACC-005', 'funda de silicona para telefono con cordon', 3, 35.00, 50, 'disponible'),
('ACC-006', 'soporte metalico plegable para laptop', 3, 75.00, 0, 'agotado'),
('ACC-007', 'pinza grande para cabello diseño floral', 4, 15.00, 60, 'disponible'),
('ACC-008', 'set de diademas acolchadas satinadas', 4, 30.00, 20, 'descontinuado');