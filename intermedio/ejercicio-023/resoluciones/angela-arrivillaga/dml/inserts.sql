use arquitectura_3d_db;

insert into clientes (nombre_cliente, correo_contacto, telefono) values
('valeria mendoza', 'valeria.mendoza@arquitectura.com', '+573001112233'),
('carlos arturo gomez', 'carlos.gomez@constructora.net', '+573104445566'),
('sofia de la cruz', 'sofia.cruz@designstudio.io', '+573207778899'),
('mateo silva', 'mateo.silva@urbanismo.org', '+573159990011');

insert into estilos_arquitectonicos (nombre_estilo, descripcion_estilo) values
('minimalista moderno', 'lineas puras, espacios abiertos y uso predominante de cristal y concreto.'),
('brutalismo contemporaneo', 'estructuras de hormigon visto con geometrias imponentes y robustas.'),
('organico bioclimatico', 'integracion con el entorno natural y optimizacion de luz y ventilacion.'),
('industrial loft', 'estructuras metalicas expuestas, ladrillo visto y estetica fabril.');

insert into proyectos_arquitectura (codigo_proyecto, nombre_proyecto, id_cliente, id_estilo, area_construccion_m2, presupuesto_estimado, estado_proyecto) values
('PRJ-ARQ-01', 'Casa Lumina Minimal', 1, 1, 240.50, 350000.00, 'entregado'),
('PRJ-ARQ-02', 'Torre Concreto Brutal', 2, 2, 1200.00, 1850000.00, 'renderizado'),
('PRJ-ARQ-03', 'Vivienda Organica Bosque', 3, 3, 185.00, 275000.00, 'en_modelado'),
('PRJ-ARQ-04', 'Loft Urbano Industrial', 4, 4, 110.00, 150000.00, 'entregado'),
('PRJ-ARQ-05', 'Villa Horizon Glass', 1, 1, 320.00, 480000.00, 'anteproyecto'),
('PRJ-ARQ-06', 'Centro Cultural Monolito', 2, 2, 2500.00, 3200000.00, 'en_modelado'),
('PRJ-ARQ-07', 'Refugio Bioclimatico Andino', 3, 3, 210.00, 310000.00, 'renderizado'),
('PRJ-ARQ-08', 'Estudio Creativo Tribeca', 4, 4, 95.00, 125000.00, 'anteproyecto');

insert into etapas_render (id_proyecto, nombre_fase, horas_invertidas, software_utilizado) values
(1, 'modelado 3d exterior', 24.50, 'Autodesk 3ds Max'),
(1, 'texturizado e iluminacion', 18.00, 'Chaos V-Ray'),
(2, 'modelado masivo estructura', 65.00, 'Autodesk Revit'),
(2, 'renderizado fotorrealista 4k', 42.00, 'Chaos V-Ray'),
(3, 'modelado terreno y topografia', 30.00, 'Blender'),
(4, 'detallado ladrillo y tuberia', 15.00, 'Autodesk 3ds Max'),
(6, 'modelado complejo interior', 80.00, 'Autodesk Revit'),
(7, 'simulacion de luz solar', 22.50, 'Blender Cycles');