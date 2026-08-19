use campuslands_mysql;

insert into fabricantes_autos (nombre_fabricante, pais_origen) values
('bugatti', 'francia'),
('koenigsegg', 'suecia'),
('rimac', 'croacia'),
('pagani', 'italia'),
('mclaren', 'reino unido'),
('lamborghini', 'italia'),
('hennessey', 'estados unidos'),
('aston martin', 'reino unido');

insert into autos_hiperdeportivos (fabricante_id, modelo, velocidad_maxima_kmh, precio_millones_usd, estado, anio_lanzamiento) values
(1, 'chiron super sport', 440, 3.90, 'disponible', 2022),
(2, 'jesko absolut', 480, 3.00, 'reservado', 2023),
(3, 'nevera', 412, 2.20, 'vendido', 2021),
(4, 'huayra bc', 380, 2.50, 'disponible', 2017),
(5, 'speedtail', 403, 2.25, 'vendido', 2020),
(6, 'revuelto', 350, 0.60, 'disponible', 2024),
(7, 'venom f5', 484, 2.10, 'reservado', 2021),
(8, 'valyrie', 360, 3.20, 'vendido', 2022);

insert into especificaciones_autos (auto_id, tipo_motor, potencia_hp, transmision) values
(1, 'w16 cuadriturbo 8.0l', 1600, 'doble embrague 7 velocidades'),
(2, 'v8 biturbo 5.0l', 1600, 'light speed transmission 9 marchas'),
(3, 'cuatro motores electricos', 1914, 'transmision de una velocidad directa'),
(4, 'v12 biturbo amg 6.0l', 791, 'secuencial transversal 7 velocidades'),
(5, 'v8 biturbo hibrido 4.0l', 1035, 'doble embrague 7 velocidades'),
(6, 'v12 hibrido 6.5l', 1001, 'doble embrague 8 velocidades transversal'),
(7, 'v8 fury twin-turbo 6.6l', 1817, 'caja semiautomatica 7 velocidades'),
(8, 'v12 atmosferico cosworth 6.5l', 1160, 'transmision secuencial de 7 velocidades');