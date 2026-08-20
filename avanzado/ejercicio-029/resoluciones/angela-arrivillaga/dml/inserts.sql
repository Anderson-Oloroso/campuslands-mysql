use marketplace_accesorios_db;

insert into categorias (nombre_categoria, descripcion) values
('joyeria fina', 'collares, anillos y pulseras en plata y oro con acabado estetico'),
('bolsos y carteras', 'accesorios de cuero y tela con disenos coquette y urbanos'),
('tecnologia y gadgets', 'estuches, correas para smartwatch y accesorios electronicos'),
('sombreros y gorras', 'proteccion solar y estilismo de temporada'),
('accesorios de cabello', 'ganchos, diademas y moños esteticos');

insert into accesorios (id_categoria, nombre_accesorio, precio, stock, estado_publicacion, fecha_creacion) values
(1, 'collar gargantilla corazon de cristal', 45.99, 120, 'activo', '2026-06-01 10:00:00'),
(1, 'anillo ajustable de plata coquette', 28.50, 0, 'agotado', '2026-06-05 11:30:00'),
(2, 'bolso bandolera pastel chic', 89.99, 5, 'activo', '2026-06-10 09:15:00'),
(2, 'mini cartera cosmetiquera neon', 34.00, 45, 'en_oferta', '2026-06-15 14:20:00'),
(3, 'correa de silicona para smartwatch dark', 19.99, 200, 'activo', '2026-07-01 08:45:00'),
(3, 'estuche protector rigido holografico', 25.00, 2, 'activo', '2026-07-05 16:00:00'),
(4, 'sombrero de pescador estetico beige', 32.50, 15, 'activo', '2026-07-10 12:10:00'),
(5, 'set de pinzas para cabello perladas', 15.00, 0, 'agotado', '2026-07-15 13:30:00'),
(5, 'diadema acolchada terciopelo soft', 22.00, 80, 'en_oferta', '2026-07-20 10:50:00'),
(1, 'pulsera eslabones acero inoxidable', 39.99, 65, 'activo', '2026-08-01 15:00:00');

insert into auditoria_eventos_stock (id_accesorio, evento_realizado, detalle_cambio, fecha_evento) values
(2, 'actualizacion automatica de estado', 'cambio de estado a agotado por stock igual a cero', '2026-06-06 00:00:01'),
(8, 'actualizacion automatica de estado', 'cambio de estado a agotado por stock igual a cero', '2026-07-16 00:00:01'),
(3, 'alerta de stock critico', 'notificacion preventiva por stock menor o igual a 5 unidades', '2026-08-10 08:00:00'),
(6, 'alerta de stock critico', 'notificacion preventiva por stock menor o igual a 5 unidades', '2026-08-12 08:00:00');