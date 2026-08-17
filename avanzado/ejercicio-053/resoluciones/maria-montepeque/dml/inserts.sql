-- Datos de practica: maquetas de un estudio de arquitectura 3D.
-- Este archivo SI puede ejecutarse con el usuario 'campus' normal:
-- solo inserta datos, no crea roles ni usuarios.
USE campuslands_mysql;

INSERT INTO maquetas_roles_avanzado (nombre, cliente, tipo_construccion, presupuesto, estado) VALUES
('Torre Empresarial Central', 'Constructora del Valle', 'comercial', 890000.00, 'modelado'),
('Centro Comercial Occidente', 'Constructora del Valle', 'comercial', 1250000.00, 'boceto'),
('Conjunto Residencial Roble', 'Grupo Habitat Norte', 'residencial', 640000.00, 'renderizado'),
('Casas Campestres Alameda', 'Grupo Habitat Norte', 'residencial', 500000.00, 'boceto'),
('Edificio Vista Sur', 'Grupo Habitat Norte', 'residencial', 770000.00, 'modelado'),
('Oficinas Costa Azul', 'Inversiones Costa Azul', 'comercial', 400000.00, 'entregado'),
('Biblioteca Cultural Sur', 'Fundacion Cultural Sur', 'institucional', 320000.00, 'renderizado'),
('Planta Industrial Norte', 'Constructora del Valle', 'industrial', 980000.00, 'boceto');
