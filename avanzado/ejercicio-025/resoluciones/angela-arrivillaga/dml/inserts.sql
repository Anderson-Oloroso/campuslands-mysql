use laboratorio_formulas_db;

insert into investigadores (nombre_completo, especialidad, correo, nivel_acceso) values
('angela arrivillaga', 'quimica computacional', 'angela.arrivillaga@lab.chem.com', 'investigador_principal'),
('jinx chaosmaker', 'sintesis de compuestos explosivos', 'jinx.chaos@lab.chem.com', 'director_lab'),
('cyber valka', 'bioquimica molecular', 'valka.cyber@lab.chem.com', 'investigador_principal'),
('ghibli dreamer', 'quimica verde y ecologia', 'ghibli.dream@lab.chem.com', 'asistente'),
('neon brush', 'nanomateriales avanzados', 'neon.brush@lab.chem.com', 'asistente'),
('hollow knight fan', 'toxicologia analitica', 'hollow.knight@lab.chem.com', 'auditor');

insert into reactivos (nombre_reactivo, formula_quimica, peligrosidad, stock_gramos) values
('acido sulfurico', 'h2so4', 'extrema', 5000.00),
('hidroxido de sodio', 'naoh', 'alta', 3500.50),
('cloruro de sodio', 'nacl', 'baja', 10000.00),
('peroxido de hidrogeno', 'h2o2', 'alta', 2500.00),
('etanol anhidro', 'c2h5oh', 'moderada', 8000.00),
('nitrato de potasio', 'kno3', 'alta', 4200.00),
('sulfato de cobre pentahidratado', 'cuso4*5h2o', 'moderada', 3000.00),
('agua destilada', 'h2o', 'baja', 50000.00);

insert into formulas_quimicas (id_investigador, nombre_formula, descripcion, estado_formula, fecha_creacion) values
(1, 'polimero superconductor x', 'formula avanzada basada en nanorrubor y catalizadores de cobre', 'aprobada', '2026-05-10 09:30:00'),
(2, 'solucion pirotecnica zx-9', 'mezcla altamente reactiva para efectos especiales de alto rendimiento', 'en_prueba', '2026-06-12 14:15:00'),
(3, 'biogel regenerativo cellular', 'solucion biologica estabilizada con etanol y sales minerales', 'aprobada', '2026-06-20 11:00:00'),
(4, 'neutralizador ecologico de acidos', 'formula biodegradable para limpieza segura de derrames industriales', 'aprobada', '2026-07-02 08:45:00'),
(5, 'nanocapa anticorrosiva flexible', 'compuesto organometallico para proteccion de aleaciones de titanio', 'en_desarrollo', '2026-07-15 16:20:00'),
(1, 'catalizador optico de alta pureza', 'formula para sensores opticos de baja temperatura', 'aprobada', '2026-07-22 10:10:00'),
(6, 'reactivo patron de calibracion toxica', 'solucion estandar para pruebas cromatograficas de control', 'archivada', '2026-08-01 13:00:00'),
(3, 'cristal liquido sintetico v2', 'formuacion avanzada para pantallas flexibles de bajo consumo', 'en_prueba', '2026-08-05 15:40:00'),
(2, 'agente oxidante de limpieza profunda', 'formula de alta potencia para remoción de residuos metalicos', 'rechazada', '2026-08-10 09:00:00'),
(1, 'solucion buffer estabilizadora ph-7', 'tampon quimico de alta estabilidad termica para laboratorio', 'aprobada', '2026-08-14 11:30:00');

insert into formulas_reactivos (id_formula, id_reactivo, cantidad_requerida_gramos) values
(1, 7, 45.50), (1, 5, 200.00),
(2, 6, 500.00), (2, 5, 150.00),
(3, 3, 50.00), (3, 8, 1000.00),
(4, 2, 120.00), (4, 8, 2500.00),
(5, 1, 80.00), (5, 5, 300.00),
(6, 7, 30.00), (6, 3, 75.00),
(7, 4, 150.00), (7, 8, 900.00),
(8, 5, 400.00), (8, 6, 220.00),
(9, 1, 600.00), (9, 4, 400.00),
(10, 3, 100.00), (10, 8, 1000.00);