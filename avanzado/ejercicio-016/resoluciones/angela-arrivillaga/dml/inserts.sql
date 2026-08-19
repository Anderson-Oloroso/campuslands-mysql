use restaurante_urbano_db;

insert into inventario_ingredientes (nombre_ingrediente, stock_actual, unidad_medida) values
('pan artesanal brioche', 150, 'unidades'),
('carne angus smash', 200, 'unidades'),
('papas francesas', 5000, 'gramos'),
('salchicha suiza', 120, 'unidades'),
('queso cheddar fundido', 3000, 'gramos'),
('tocineta ahumada', 2500, 'gramos'),
('salsa de la casa', 1000, 'mililitros'),
('refresco cola 500ml', 80, 'unidades');

insert into menu_comida_urbana (nombre_producto, categoria, precio_dolares, disponible) values
('hamburguesa urbana deluxe', 'hamburguesa', 9.99, true),
('salchipapa monstruosa', 'salchipapa', 8.50, true),
('perro caliente callejero', 'perro caliente', 6.00, true),
('papas rústicas con cheddar', 'acompañamiento', 4.50, true),
('hamburguesa doble smash', 'hamburguesa', 11.50, true),
('soda artesanal de maracuyá', 'bebida', 3.00, true),
('tequeños de queso (6 un)', 'acompañamiento', 5.00, true),
('refresco cola 500ml', 'bebida', 2.50, true);

-- ejemplo practico de transaccion acida (acid) en mysql para procesar una orden de comida urbana
-- garantizando atomicidad: si falla el registro de la orden, el detalle o el descuento de stock, todo se revierte (rollback).

start transaction;

-- 1. insertar la orden de pedido principal
insert into ordenes_pedido (cliente_nombre, total_pagar, estado_orden, fecha_pedido)
values ('carlos mendoza', 22.49, 'completada', current_timestamp());

-- capturar el id de la orden recién insertada
set @id_orden_actual = last_insert_id();

-- 2. insertar el primer detalle de orden (ej: hamburguesa urbana deluxe x1)
insert into detalle_orden (id_orden, id_producto, cantidad, subtotal_dolares)
values (@id_orden_actual, 1, 1, 9.99);

-- 3. insertar el segundo detalle de orden (ej: salchipapa monstruosa x1 y papas rústicas x1)
insert into detalle_orden (id_orden, id_producto, cantidad, subtotal_dolares)
values (@id_orden_actual, 4, 1, 4.50);

insert into detalle_orden (id_orden, id_producto, cantidad, subtotal_dolares)
values (@id_orden_actual, 8, 3, 7.50);

-- si todo es correcto, confirmamos la transaccion con commit
commit;