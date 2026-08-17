-- Datos de practica: proyectos de un estudio de arquitectura 3D.
-- Este archivo SI puede ejecutarse con el usuario 'campus' normal:
-- solo inserta datos, no crea roles ni usuarios.
USE campuslands_mysql;

INSERT INTO proyectos_roles_avanzado (nombre, cliente, tipo_construccion, presupuesto, estado) VALUES
('Torre Central', 'Constructora Andina', 'comercial', 850000.00, 'modelado'),
('Centro Comercial Sur', 'Constructora Andina', 'comercial', 1200000.00, 'boceto'),
('Conjunto Residencial Pinar', 'Grupo Residencial Norte', 'residencial', 620000.00, 'renderizado'),
('Casas Campestres El Bosque', 'Grupo Residencial Norte', 'residencial', 480000.00, 'boceto'),
('Edificio Vista Norte', 'Grupo Residencial Norte', 'residencial', 750000.00, 'modelado'),
('Oficinas Vista Verde', 'Inversiones Vista Verde', 'comercial', 390000.00, 'entregado'),
('Biblioteca Cultural Rio', 'Fundacion Cultural Rio', 'institucional', 300000.00, 'renderizado'),
('Planta Industrial Sur', 'Constructora Andina', 'industrial', 950000.00, 'boceto');
