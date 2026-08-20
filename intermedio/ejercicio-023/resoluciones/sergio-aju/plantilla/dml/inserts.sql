USE campuslands_mysql;

INSERT INTO categorias (nombre) VALUES ('Residencial'), ('Comercial'), ('Industrial');

INSERT INTO clientes (nombre, email) VALUES 
('Juan Pérez', 'juan@mail.com'), 
('María López', 'maria@mail.com'), 
('Empresa Tech', 'contacto@tech.com');

INSERT INTO proyectos (nombre_proyecto, categoria_id, cliente_id, costo, estado) VALUES
('Casa Zen', 1, 1, 150000.00, 'activo'),
('Oficina Open', 2, 3, 300000.00, 'completado'),
('Bodega Alpha', 3, 3, 500000.00, 'activo'),
('Apartamento Loft', 1, 2, 200000.00, 'activo'),
('Centro Comercial X', 2, 1, 800000.00, 'pausado'),
('Casa Campo', 1, 2, 120000.00, 'completado'),
('Planta Solar', 3, 3, 900000.00, 'activo'),
('Showroom Urbano', 2, 1, 250000.00, 'activo');