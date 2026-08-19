use equipo_streaming_db;

insert into categorias_equipo (nombre_categoria, descripcion_categoria) values
('audio y microfonos', 'microfonos condensadores y dinamicos para transmision en vivo'),
('iluminacion', 'paneles led y aros de luz para estudio de streaming'),
('captura de video', 'tarjetas de captura y camaras dslr o webcams de alta definicion'),
('accesorios de soporte', 'brazos articulados, tripodes y soportes de escritorio');

insert into marcas_hardware (nombre_marca, pais_origen) values
('elgato', 'alemania'),
('shure', 'estados unidos'),
('logitech', suiza),
('razer', 'singapur');

insert into dispositivos_streaming (codigo_serial, nombre_dispositivo, id_categoria, id_marca, precio_dolares, estado_dispositivo) values
('STR-MIC-01', 'microfono shure sm7b profesional', 1, 2, 399.00, 'operativo'),
('STR-MIC-02', 'microfono elgato wave 3 usb', 1, 1, 149.99, 'nuevo'),
('STR-LGT-01', 'panel led elgato key light air', 2, 1, 129.99, 'operativo'),
('STR-LGT-02', 'aro de luz razer ring light 12', 2, 4, 79.99, 'en_mantenimiento'),
('STR-CAM-01', 'tarjeta de captura elgato 4k60 pro', 3, 1, 249.99, 'operativo'),
('STR-CAM-02', 'webcam logitech brio 4k ultra hd', 3, 3, 199.00, 'retirado'),
('STR-ACC-01', 'brazo articulado para microfono wave mic arm', 4, 1, 99.99, 'operativo'),
('STR-ACC-02', 'tripode extensible de escritorio razer', 4, 4, 49.99, 'nuevo');