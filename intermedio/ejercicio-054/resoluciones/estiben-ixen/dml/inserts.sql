-- Insercion de datos para soldadura (ejercicio-054)
USE campuslands_mysql;

-- 1. Insercion en tabla principal (talleres_metalmecanicos)
INSERT INTO talleres_metalmecanicos (nombre_taller, ciudad, norma_calidad) VALUES
('Metalurgica Industrial del Norte', 'Monterrey', 'AWS D1.1'),
('Estructuras y Caldereria Andina', 'Bogota', 'ASME Seccion IX'),
('Soldaduras Especiales de Centroamerica', 'Ciudad de Guatemala', 'AWS D1.1'),
('Tubulares y Oleoductos del Golfo', 'Veracruz', 'API 1104'),
('Precision Welding Solutions', 'Santiago de Chile', 'ISO 3834');

-- 2. Insercion en tabla secundaria (proyectos_soldadura)
INSERT INTO proyectos_soldadura (nombre_estructura, id_taller, proceso_soldadura, tipo_material, peso_toneladas, inspeccion_radiografica, costo_total) VALUES
('Puente Peatonal de Acero Reticulado', 1, 'GMAW (MIG/MAG)', 'Acero al Carbono ASTM A36', 45.50, 'Aprobado', 85000.00),
('Tanque Criogenico de Alta Presion', 2, 'GTAW (TIG)', 'Acero Inoxidable 316L', 12.00, 'Aprobado', 120000.00),
('Chasis para Grua Portuaria 50T', 1, 'FCAW (Tubular)', 'Acero al Carbono ASTM A36', 80.00, 'Aprobado', 160000.00),
('Oleoducto Submarino Segmento 4', 4, 'SMAW (Electrodo)', 'Acero al Carbono ASTM A36', 250.00, 'Aprobado', 450000.00),
('Intercambiador de Calor Petroquimico', 2, 'GTAW (TIG)', 'Acero Inoxidable 316L', 8.50, 'Aprobado', 95000.00),
('Estructura de Techo Nave Industrial', 3, 'SMAW (Electrodo)', 'Acero al Carbono ASTM A36', 30.00, 'Aprobado', 45000.00),
('Casco de Lancha de Patrullaje Costero', 5, 'GTAW (TIG)', 'Aluminio 6061', 6.20, 'Aprobado', 78000.00),
('Componentes Aeroespaciales de Escape', 5, 'GTAW (TIG)', 'Titanio Grado 5', 1.80, 'Aprobado', 210000.00),
('Silos Graneleros de Almacenamiento', 3, 'FCAW (Tubular)', 'Acero al Carbono ASTM A36', 65.00, 'Aprobado', 110000.00),
('Valvula Colectora de Gasoducto', 4, 'GTAW (TIG)', 'Acero al Carbono ASTM A36', 15.00, 'Aprobado', 88000.00),
('Vigas Soldadas para Rascacielos', 1, 'SAW (Arco Sumergido)', 'Acero al Carbono ASTM A36', 180.00, 'Aprobado', 320000.00),
('Tuberia de Grado Sanitario Lacteo', 2, 'GTAW (TIG)', 'Acero Inoxidable 316L', 4.50, 'Aprobado', 55000.00);
