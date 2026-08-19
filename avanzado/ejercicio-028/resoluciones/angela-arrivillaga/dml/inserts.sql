use academia_tech_json_db;

insert into rutas_aprendizaje (nombre_ruta, nivel_dificultad) values
('desarrollo full-stack web', 'semi_senior'),
('ingenieria de videojuegos', 'senior'),
('bases de datos y sql avanzado', 'senior'),
('python y analisis de datos', 'junior'),
('frontend con css y ux', 'junior');

insert into estudiantes (id_ruta, nombre_completo, correo, estado_estudiante) values
(1, 'angela arrivillaga', 'angela.arrivillaga@campus.tech', 'activo'),
(2, 'jinx chaosmaker', 'jinx.chaos@campus.tech', 'activo'),
(3, 'cyber valka', 'valka.cyber@campus.tech', 'activo'),
(4, 'ghibli dreamer', 'ghibli.dream@campus.tech', 'activo'),
(5, 'neon brush', 'neon.brush@campus.tech', 'activo'),
(1, 'hollow knight fan', 'hollow.knight@campus.tech', 'graduado'),
(2, 'i ker mauricio', 'iker.mauricio@campus.tech', 'activo'),
(3, 'allison vargas', 'allison.vargas@campus.tech', 'pausado'),
(4, 'cleidy lorena', 'cleidy.lorena@campus.tech', 'activo'),
(5, 'anderson stiven', 'anderson.stiven@campus.tech', 'activo');

insert into evaluaciones_estudiantes (id_estudiante, titulo_modulo, puntaje_final, competencias_json, configuracion_json) values
(1, 'arquitectura sql y ctes', 98.50, 
 '[{"habilidad": "mysql", "nivel": "avanzado"}, {"habilidad": "modelado", "nivel": "experto"}, {"habilidad": "optimizacion", "nivel": "avanzado"} ]',
 '{"editor": "vscode", "tema": "coquette", "sistema": "linux", "notificaciones": true}'),

(2, 'motores de videojuegos y fisica', 95.00, 
 '[{"habilidad": "c_plus_plus", "nivel": "avanzado"}, {"habilidad": "fisica_2d", "nivel": "experto"}, {"habilidad": "shaders", "nivel": "intermedio"} ]',
 '{"editor": "vscode", "tema": "neon_dark", "sistema": "windows", "notificaciones": false}'),

(3, 'bioquimica computacional y python', 91.20, 
 '[{"habilidad": "python", "nivel": "experto"}, {"habilidad": "pandas", "nivel": "avanzado"}, {"habilidad": "numpy", "nivel": "avanzado"} ]',
 '{"editor": "vscode", "tema": "matrix", "sistema": "linux", "notificaciones": true}'),

(4, 'quimica verde y apis web', 88.00, 
 '[{"habilidad": "javascript", "nivel": "intermedio"}, {"habilidad": "fetch_api", "nivel": "avanzado"}, {"habilidad": "css3", "nivel": "avanzado"} ]',
 '{"editor": "vscode", "tema": "pastel", "sistema": "macos", "notificaciones": true}'),

(5, 'nanomateriales y interfaces ui', 93.50, 
 '[{"habilidad": "css3", "nivel": "experto"}, {"habilidad": "figma", "nivel": "avanzado"}, {"habilidad": "javascript", "nivel": "intermedio"} ]',
 '{"editor": "vscode", "tema": "dark_blue", "sistema": "linux", "notificaciones": false}'),

(6, 'toxicologia avanzada y auditoria', 89.90, 
 '[{"habilidad": "auditoria_db", "nivel": "experto"}, {"habilidad": "seguridad", "nivel": "avanzado"} ]',
 '{"editor": "vscode", "tema": "coquette", "sistema": "windows", "notificaciones": true}'),

(7, 'sistemas distribuidos y ctes', 94.00, 
 '[{"habilidad": "mysql", "nivel": "experto"}, {"habilidad": "docker", "nivel": "avanzado"}, {"habilidad": "git", "nivel": "experto"} ]',
 '{"editor": "vscode", "tema": "neon_dark", "sistema": "linux", "notificaciones": true}'),

(8, 'gestion de datos relacionales', 85.50, 
 '[{"habilidad": "sql", "nivel": "intermedio"}, {"habilidad": "diagramas_er", "nivel": "avanzado"} ]',
 '{"editor": "vscode", "tema": "pastel", "sistema": "windows", "notificaciones": false}'),

(9, 'analisis estadistico con python', 92.40, 
 '[{"habilidad": "python", "nivel": "avanzado"}, {"habilidad": "estadistica", "nivel": "experto"} ]',
 '{"editor": "vscode", "tema": "coquette", "sistema": "linux", "notificaciones": true}'),

(10, 'diseno responsive sin frameworks', 96.00, 
 '[{"habilidad": "html5", "nivel": "experto"}, {"habilidad": "css3", "nivel": "experto"}, {"habilidad": "flexbox", "nivel": "experto"} ]',
 '{"editor": "vscode", "tema": "dark_blue", "sistema": "macos", "notificaciones": true}');