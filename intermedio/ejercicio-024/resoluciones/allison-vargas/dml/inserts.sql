USE soldadura_fk_db;

-- Insercion en Tabla Padre (Inspectores)
INSERT INTO inspectores (nombre_inspector, certificacion_nivel, email) VALUES
('Ing. Roberto Mendez', 'CWI Nivel III', 'rmendez@certificaciones.com'),
('Tec. Maria Estrada', 'CWI Nivel II', 'mestrada@certificaciones.com'),
('Ing. Fernando Gomez', 'VT/UT Nivel II', 'fgomez@certificaciones.com'),
('Tec. Lucia Morales', 'CWI Nivel I', 'lmorales@certificaciones.com');

-- Insercion en Tabla Hija (Inspecciones con FK validas)
INSERT INTO inspecciones_calidad (id_inspector, codigo_junta, tipo_ensayo, resultado, costo_ensayo_usd, fecha_inspeccion) VALUES
(1, 'JUNTA-PIPE-101', 'RT_Radiografia', 'aprobado', 250.00, '2026-02-10'),
(2, 'JUNTA-EST-204', 'VT_Visual', 'aprobado', 75.00, '2026-02-12'),
(1, 'JUNTA-TANQ-501', 'UT_Ultrasonido', 'requiere_reparacion', 320.00, '2026-02-15'),
(3, 'JUNTA-PIPE-102', 'PT_Tintes', 'rechazado', 110.00, '2026-02-18'),
(4, 'JUNTA-EST-205', 'VT_Visual', 'aprobado', 75.00, '2026-02-20'),
(2, 'JUNTA-TANQ-502', 'UT_Ultrasonido', 'aprobado', 320.00, '2026-02-22'),
(3, 'JUNTA-PIPE-103', 'RT_Radiografia', 'aprobado', 250.00, '2026-02-25'),
(1, 'JUNTA-VIGA-901', 'UT_Ultrasonido', 'rechazado', 300.00, '2026-03-01');
