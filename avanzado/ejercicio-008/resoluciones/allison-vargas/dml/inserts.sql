-- DML: Carga de datos para prueba de Roles y Permisos en Fútbol Sala
USE campuslands_mysql;

-- Inserción de Usuarios
INSERT INTO usuarios_futsal (nombre_completo, email, estado) VALUES
('Carlos Mendoza', 'carlos.mendoza@futsal.gt', 'activo'),
('Ana Lucía Gómez', 'ana.gomez@futsal.gt', 'activo'),
('Luis Fernando Torres', 'luis.torres@futsal.gt', 'activo'),
('Sofía Ramírez', 'sofia.ramirez@futsal.gt', 'activo'),
('Diego Alvarado', 'diego.alvarado@futsal.gt', 'bloqueado'),
('María José Castillo', 'maria.castillo@futsal.gt', 'activo'),
('Jorge Mario Estrada', 'jorge.estrada@futsal.gt', 'inactivo'),
('Valeria Morales', 'valeria.morales@futsal.gt', 'activo');

-- Inserción de Roles
INSERT INTO roles (nombre_rol, descripcion) VALUES
('Administrador', 'Acceso total al sistema de fútbol sala'),
('Árbitro', 'Registro de planillas y faltas en partidos'),
('Entrenador', 'Consulta de estadísticas y gestión de alineaciones'),
('Analista', 'Acceso de solo lectura a reportes estadísticos');

-- Inserción de Permisos
INSERT INTO permisos (nombre_permiso, modulo, descripcion) VALUES
('crear_torneo', 'Torneos', 'Creación de nuevos torneos de futsal'),
('registrar_acta', 'Partidos', 'Registrar resultado y tarjetas del partido'),
('ver_estadisticas', 'Reportes', 'Visualizar tablas de posiciones y goleadores'),
('gestionar_usuarios', 'Seguridad', 'Alta, baja y modificación de usuarios');

-- Asignación de Permisos a Roles
INSERT INTO rol_permisos (rol_id, permiso_id) VALUES
(1, 1), (1, 2), (1, 3), (1, 4), -- Administrador tiene todos los permisos
(2, 2), (2, 3),                 -- Árbitro puede registrar actas y ver estadísticas
(3, 3),                         -- Entrenador solo ve estadísticas
(4, 3);                         -- Analista solo ve estadísticas

-- Asignación de Roles a Usuarios (Mínimo 8 registros de relación)
INSERT INTO usuario_roles (usuario_id, rol_id) VALUES
(1, 1), -- Carlos es Administrador
(2, 2), -- Ana es Árbitro
(3, 3), -- Luis es Entrenador
(4, 4), -- Sofía es Analista
(5, 3), -- Diego es Entrenador
(6, 2), -- María es Árbitro
(7, 4), -- Jorge es Analista
(8, 3); -- Valeria es Entrenador
