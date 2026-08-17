USE arquitectura_3d_roles_db;

-- Insercion de Roles
INSERT INTO roles (nombre_rol, descripcion) VALUES
('Arquitecto Principal', 'Control total de diseno y aprobacion de planos'),
('Modelador 3D', 'Creacion de geometrias y estructuras tridimensionales'),
('Renderista', 'Mapeado de texturas, iluminacion y motor de render'),
('Auditor BIM', 'Revision de normativas y permisos de construccion');

-- Insercion de Usuarios
INSERT INTO usuarios (nombre, email, estado) VALUES
('Carlos Ruiz', 'carlos.ruiz@arch3d.com', 'activo'),
('Valeria Gomez', 'valeria.gomez@arch3d.com', 'activo'),
('Sofia Lopez', 'sofia.lopez@arch3d.com', 'activo'),
('Ana Martinez', 'ana.martinez@arch3d.com', 'activo'),
('Diego Morales', 'diego.morales@arch3d.com', 'inactivo');

-- Insercion de 8 Proyectos de Arquitectura 3D
INSERT INTO proyectos_arquitectura (nombre_proyecto, categoria, presupuesto_usd, m2_superficie, estado, fecha_creacion) VALUES
('Torre Residencial Horizon', 'Residencial', 450000.00, 1200.50, 'aprobado', '2026-01-15'),
('Centro Comercial Plaza Real', 'Comercial', 850000.00, 3500.00, 'revision', '2026-02-01'),
('Casa Campestre EcoLux', 'Residencial', 180000.00, 450.00, 'aprobado', '2026-02-10'),
('Pavellon de Exposiciones', 'Cultural', 300000.00, 850.25, 'diseno', '2026-03-01'),
('Remodelacion Loft Urbano', 'Residencial', 75000.00, 120.00, 'aprobado', '2026-03-05'),
('Hospital Central Modulo B', 'Hospitalario', 1200000.00, 5000.00, 'revision', '2026-03-12'),
('Puente Peatonal Futurista', 'Infraestructura', 250000.00, 300.00, 'diseno', '2026-03-20'),
('Complejo Deportivo Master', 'Deportivo', 600000.00, 2200.00, 'archivado', '2026-03-25');

-- Insercion de Asignaciones de Roles a Proyectos
INSERT INTO asignacion_roles (id_usuario, id_proyecto, id_rol, nivel_acceso, fecha_asignacion) VALUES
(1, 1, 1, 'administrador', '2026-01-16'),
(2, 1, 2, 'escritura', '2026-01-17'),
(3, 1, 3, 'lectura', '2026-01-18'),
(1, 2, 1, 'administrador', '2026-02-02'),
(4, 2, 4, 'escritura', '2026-02-03'),
(2, 3, 2, 'administrador', '2026-02-11'),
(3, 3, 3, 'escritura', '2026-02-12'),
(1, 6, 1, 'administrador', '2026-03-13'),
(4, 6, 4, 'escritura', '2026-03-14'),
(2, 7, 2, 'escritura', '2026-03-21');
