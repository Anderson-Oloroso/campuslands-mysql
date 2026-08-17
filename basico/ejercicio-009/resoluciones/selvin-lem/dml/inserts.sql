USE campuslands_mysql;

INSERT INTO kickboxing_peleadores (nombre_peleador, categoria_peso, victorias, derrotas, fecha_registro, estado) VALUES
('Diego Solares',  'welter',    18, 3, '2023-01-10', 'activo'),
('Marina Us',      'pluma',     14, 5, '2023-03-05', 'activo'),
('Hector Ba',      'welter',    9,  8, '2022-11-20', 'activo'),
('Sofia Chub',     'ligero',    22, 2, '2021-06-15', 'activo'),
('Pablo Ixchel',   'pesado',    6,  12,'2022-02-01', 'retirado'),
('Karen Toc',      'pluma',     11, 4, '2023-05-10', 'activo'),
('Andres Mux',     'ligero',    3,  1, '2024-01-01', 'descalificado'),
('Lucia Ba',       'welter',    17, 6, '2022-08-08', 'activo');

-- Verificacion previa antes de eliminar (buena practica antes de un DELETE)
SELECT nombre_peleador, estado FROM kickboxing_peleadores WHERE estado IN ('retirado', 'descalificado');

-- DELETE 1: elimina un peleador especifico por retiro definitivo (caso simple, un solo registro)
DELETE FROM kickboxing_peleadores
WHERE nombre_peleador = 'Pablo Ixchel' AND estado = 'retirado';

-- DELETE 2: elimina peleadores descalificados (caso de grupo, aunque aqui solo aplica a uno)
DELETE FROM kickboxing_peleadores
WHERE estado = 'descalificado';