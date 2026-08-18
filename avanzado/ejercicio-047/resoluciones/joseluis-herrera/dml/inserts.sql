USE campuslands_mysql;

INSERT INTO categorias (nombre)
VALUES
('Camisetas'),
('Pantalones'),
('Chaquetas'),
('Vestidos'),
('Accesorios');

INSERT INTO prendas (
    nombre,
    talla,
    precio,
    stock,
    disponible,
    fecha_ingreso,
    id_categoria
)
VALUES
('Camiseta Basica','M',45.00,25,TRUE,'2026-01-10',1),
('Camiseta Oversize','L',65.00,18,TRUE,'2026-01-15',1),
('Camiseta Deportiva','S',58.00,10,TRUE,'2026-01-20',1),
('Jeans Clasicos','32',120.00,12,TRUE,'2026-02-01',2),
('Jeans Slim','30',135.00,8,TRUE,'2026-02-05',2),
('Pantalon Cargo','34',145.00,6,TRUE,'2026-02-08',2),
('Chaqueta Denim','M',180.00,6,TRUE,'2026-02-12',3),
('Chaqueta Impermeable','L',220.00,4,TRUE,'2026-02-18',3),
('Vestido Casual','S',95.00,9,TRUE,'2026-03-05',4),
('Gorra Clasica','U',35.00,30,TRUE,'2026-03-10',5);