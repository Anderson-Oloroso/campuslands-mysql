use soldadura_db;

insert into procesos_soldadura (codigo_proceso, nombre_proceso, descripcion_proceso) values
('SMAW', 'SMAW / Electrodo Revestido', 'soldadura por arco metalico protegido con electrodo revestido.'),
('GMAW', 'GMAW / MIG-MAG', 'soldadura por arco con gas protector y alambre macizo.'),
('GTAW', 'GTAW / TIG', 'soldadura por arco con gas tungsteno inerte de alta precision.'),
('FCAW', 'FCAW / Tubular', 'soldadura por arco con alambre tubular auto-protegido o con gas.');

insert into soldadores (nombre_soldador, certificacion, nivel_experiencia) values
('carlos arturo gomez', 'ASME Sec IX - 6G', 'senior'),
('valeria mendoza', 'AWS D1.1 - 3G', 'semi_senior'),
('sofia de la cruz', 'ASME Sec IX - 4F', 'junior'),
('mateo silva', 'AWS D1.1 - 2G', 'senior');

insert into juntas_soldadas (codigo_junta, id_proceso, id_soldador, material_base, espesor_mm, amperaje_usado, estado_inspeccion) values
('JNT-001', 1, 1, 'Acero al Carbono A36', 12.50, 140, 'aprobada'),
('JNT-002', 2, 2, 'Acero Inoxidable 304', 6.00, 115, 'aprobada'),
('JNT-003', 3, 3, 'Aluminio 6061', 4.50, 95, 'pendiente'),
('JNT-004', 4, 4, 'Acero Estructural A572', 19.00, 220, 'aprobada'),
('JNT-005', 1, 2, 'Acero al Carbono A36', 10.00, 130, 'rechazada'),
('JNT-006', 3, 1, 'Aleacion Titanio Gr5', 3.20, 85, 'aprobada'),
('JNT-007', 2, 3, 'Acero Inoxidable 316', 8.00, 125, 'pendiente'),
('JNT-008', 4, 4, 'Acero Estructural A572', 25.40, 250, 'aprobada');