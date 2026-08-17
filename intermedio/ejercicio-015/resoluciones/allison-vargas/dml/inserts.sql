-- DML: Inserción masiva optimizada (Batch Insert)
USE campuslands_mysql;

INSERT INTO carga_biblioteca_gamer 
    (codigo_sku, titulo, plataforma, formato, precio_tienda, descuento_porcentaje, stock_disponible) 
VALUES
    ('SKU-PC-001', 'Elden Ring', 'PC', 'digital', 59.99, 15.00, 150),
    ('SKU-PS5-002', 'God of War Ragnarök', 'PlayStation 5', 'fisico', 69.99, 10.00, 45),
    ('SKU-NSW-003', 'The Legend of Zelda: Tears of the Kingdom', 'Nintendo Switch', 'fisico', 69.99, 0.00, 80),
    ('SKU-XBX-004', 'Starfield', 'Xbox Series X', 'digital', 69.99, 20.00, 200),
    ('SKU-PC-005', 'Cyberpunk 2077: Ultimate Edition', 'PC', 'digital', 59.99, 30.00, 120),
    ('SKU-PS5-006', 'Final Fantasy VII Rebirth', 'PlayStation 5', 'fisico', 69.99, 5.00, 30),
    ('SKU-NSW-007', 'Super Mario Bros. Wonder', 'Nintendo Switch', 'digital', 59.99, 0.00, 95),
    ('SKU-PC-008', 'Hades II', 'PC', 'digital', 29.99, 10.00, 300),
    ('SKU-XBX-009', 'Forza Motorsport', 'Xbox Series X', 'digital', 59.99, 25.00, 60);
