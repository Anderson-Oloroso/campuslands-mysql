use taller_mecanico_motos_db;

insert into tipos_servicio (nombre_servicio, descripcion_breve, costo_base) values
('mantenimiento general', 'cambio de aceite, filtros y revision de puntos clave', 45.00),
('sincronizacion de motor', 'limpieza de inyectores y cuerpo de aceleracion', 80.00),
('cambio de kit de arrastre', 'reemplazo de cadena, piñon y corona', 120.00),
('revision de frenos', 'cambio de pastillas, liquido y purgado de sistema', 55.00),
('reparacion electrica', 'diagnostico de ramal, bateria y sistema de carga', 95.00);

insert into ordenes_reparacion (codigo_orden, propietario_nombre, moto_modelo, placa_moto, id_tipo_servicio, costo_total, fecha_ingreso, estado_reparacion) values
('ord-001', 'carlos mendoza', 'yamaha fz-25', 'mta-101', 1, 55.00, '2026-08-01 09:30:00', 'entregado'),
('ord-002', 'anderson vargas', 'honda cbr 250', 'hnd-202', 2, 95.00, '2026-08-03 10:15:00', 'finalizado'),
('ord-003', 'allison pérez', 'kawasaki ninja 400', 'kaw-303', 3, 140.00, '2026-08-05 14:20:00', 'en proceso'),
('ord-004', 'cleidy gómez', 'suzuki gsx-s750', 'suz-404', 4, 70.00, '2026-08-07 08:45:00', 'entregado'),
('ord-005', 'iker dahinten', 'ducati panigale v2', 'duc-505', 5, 120.00, '2026-08-10 11:00:00', 'pendiente'),
('ord-006', 'valeria rios', 'ktm duke 200', 'ktm-606', 1, 50.00, '2026-08-12 15:30:00', 'en proceso'),
('ord-007', 'mateo lópez', 'bmw g310r', 'bmw-707', 2, 90.00, '2026-08-14 09:10:00', 'pendiente'),
('ord-008', 'sofia arriaga', 'triumph street triple', 'tri-808', 3, 150.00, '2026-08-15 16:40:00', 'entregado');