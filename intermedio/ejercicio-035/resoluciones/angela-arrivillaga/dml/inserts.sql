use taller_mecanico_motos_db;

insert into clientes_taller (nombre_cliente, telefono, correo) values
('Angela Arrivillaga', '5551-2345', 'angela.arrivillaga@campus.com'),
('Iker Dahinten', '5552-3467', 'iker.dahinten@campus.com'),
('Allison Vargas', '5553-7890', 'allison.vargas@campus.com'),
('Cleidy Mosquera', '5554-4321', 'cleidy.mosquera@campus.com'),
('Anderson Perez', '5555-9876', 'anderson.perez@campus.com');

insert into motos_cliente (id_cliente, marca_modelo, placa, anio) values
(1, 'Yamaha MT-09 SP', 'M-321XYZ', 2024),
(1, 'Kawasaki Ninja 400', 'M-987ABC', 2023),
(2, 'Honda CBR 600RR', 'M-456DEF', 2022),
(3, 'Ducati Panigale V2', 'M-789GHI', 2024),
(4, 'KTM Duke 390', 'M-159JKL', 2023),
(5, 'BMW S 1000 RR', 'M-753MNO', 2025),
(2, 'Yamaha YZF-R3', 'M-852PQR', 2021),
(4, 'Honda CB 500F', 'M-963STU', 2022);

insert into ordenes_reparacion (id_moto, descripcion_servicio, costo_total, estado_orden, fecha_ingreso) values
(1, 'Mantenimiento general y cambio de kit de arrastre', 250.00, 'completada', '2026-05-10'),
(2, 'Sincronización de cuerpos de aceleración y bujías', 180.00, 'completada', '2026-05-15'),
(3, 'Reparación de sistema de frenos ABS y pastillas', 320.00, 'en_proceso', '2026-06-01'),
(4, 'Cambio de aceite sintético y líquido de frenos', 120.00, 'completada', '2026-06-05'),
(5, 'Alineación de tijera y cambio de llanta trasera', 290.00, 'pendiente', '2026-06-10'),
(6, 'Overhaul completo de motor y ajuste de válvulas', 850.00, 'en_proceso', '2026-06-12'),
(7, 'Diagnóstico eléctrico y cambio de batería', 95.00, 'completada', '2026-06-15'),
(8, 'Instalación de slider de protección y escape', 410.00, 'completada', '2026-06-18');