use campuslands_mysql;

-- insercion de categorias
insert into categorias (nombre_categoria) values
('hamburguesas'), ('tacos'), ('bebidas'), ('postres');

-- insercion de productos
insert into productos (categoria_id, nombre_producto, precio_venta, stock_actual, estado_producto) values
(1, 'hamburguesa urbana', 8.50, 50, 'disponible'),
(1, 'hamburguesa doble queso', 10.99, 30, 'disponible'),
(2, 'taco al pastor', 2.50, 100, 'disponible'),
(2, 'taco de asada', 3.00, 80, 'disponible'),
(3, 'limonada artesanal', 2.00, 40, 'disponible'),
(3, 'refresco', 1.50, 200, 'disponible'),
(4, 'brownie', 3.50, 15, 'disponible'),
(4, 'cheesecake', 4.00, 0, 'agotado');