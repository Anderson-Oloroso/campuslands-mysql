USE soldadura_industrial_db;

INSERT INTO registros_soldadura (codigo_cordon, proceso_soldadura, tipo_material, amperaje_usado, calidad_inspeccion_pct, estado_cordon) VALUES
('COR-001', 'GTAW (TIG)', 'Acero Inoxidable 316L', 120, 98.50, 'aprobado'),
('COR-002', 'SMAW', 'Acero al Carbono A36', 140, 72.30, 'rechazado'),
('COR-003', 'GMAW (MIG)', 'Aluminio 6061', 160, 45.00, 'obsoleto'),
('COR-004', 'GTAW (TIG)', 'Titanio Grado 2', 110, 99.10, 'aprobado'),
('COR-005', 'FCAW', 'Acero Estructural', 220, 68.40, 'rechazado'),
('COR-006', 'SMAW', 'Hierro Fundido', 130, 30.20, 'obsoleto'),
('COR-007', 'GMAW (MIG)', 'Acero Galvanizado', 175, 94.80, 'aprobado'),
('COR-008', 'GTAW (TIG)', 'Inconel 718', 135, 96.70, 'revision_pendiente');