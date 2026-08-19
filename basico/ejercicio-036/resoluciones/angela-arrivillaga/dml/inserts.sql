use autos_hiperdeportivos_db;

insert into fabricantes (nombre_marca, pais_origen, anio_fundacion) values
('bugatti', 'francia', 1909),
('koenigsegg', 'suecia', 1994),
('pagani', 'italia', 1992),
('rimac', 'croacia', 2009),
('ferrari', 'italia', 1939);

insert into hiperdeportivos (nombre_modelo, id_fabricante, velocidad_maxima_kmh, potencia_hp, precio_millones_usd, unidades_producidas, estado_homologacion) values
('bugatti chiron supersport 300+', 1, 490, 1600, 3.90, 30, 'legal calle'),
('koenigsegg jesko absolut', 2, 531, 1600, 3.40, 125, 'legal calle'),
('pagani huayra r', 3, 383, 850, 3.10, 30, 'homologado circuito'),
('rimac nevera r', 4, 412, 2107, 2.35, 40, 'legal calle'),
('ferrari fxx k evo', 5, 350, 1050, 2.60, 40, 'homologado circuito'),
('bugatti bolide', 1, 500, 1825, 4.40, 40, 'prototipo'),
('koenigsegg gemera', 2, 400, 1700, 1.70, 300, 'legal calle'),
('pagani utopia', 3, 370, 864, 2.50, 99, 'legal calle');