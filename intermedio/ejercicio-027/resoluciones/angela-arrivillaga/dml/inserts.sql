use juego_accion_db;

insert into regiones_mapa (nombre_region, nivel_recomendado, clima_predominante) values
('valle de los susurros', 10, 'templado'),
('cumbres escarcha', 45, 'nevar'),
('ruinas subterraneas', 30, 'humedo'),
('desierto de ceniza', 60, 'arido');

insert into tipos_arma (nombre_tipo, alcance_combate) values
('espada larga', 'cuerpo a cuerpo'),
('arco compuesto', 'distancia'),
('baston arcano', 'magico'),
('dagas gemelas', 'cuerpo a cuerpo rapido');

insert into misiones_aventura (codigo_mision, titulo_mision, id_region, id_tipo_arma, recompensa_oro, puntos_experiencia, estado_mision) values
('MSN-001', 'el despertar del heroe en el valle', 1, 1, 1500.50, 2500, 'completada'),
('MSN-002', 'cazeria bajo la tormenta de nieve', 2, 2, 4500.00, 8200, 'en_curso'),
('MSN-003', 'misterio en las profundidades oscuras', 3, 3, 3200.00, 6000, 'disponible'),
('MSN-004', 'combate contra el guardian de ceniza', 4, 1, 8500.00, 15000, 'bloqueada'),
('MSN-005', 'emboscada rapida en el desfiladero', 1, 4, 1800.00, 3100, 'completada'),
('MSN-006', 'rescate en la fortaleza helada', 2, 3, 5000.00, 9500, 'disponible'),
('MSN-007', 'tesoro perdido de las catacumbas', 3, 4, 3800.00, 7000, 'en_curso'),
('MSN-008', 'duelo final en el volcan', 4, 2, 12000.00, 22000, 'bloqueada');