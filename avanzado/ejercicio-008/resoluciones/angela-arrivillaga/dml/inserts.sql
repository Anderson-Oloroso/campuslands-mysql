USE futbol_sala;

INSERT INTO roles (nombre_rol, descripcion) VALUES
('Administrador', 'Control total del sistema de gestion'),
('Arbitro', 'Gestion de partidos y registro de incidencias'),
('Entrenador', 'Acceso a convocatorias y estadisticas de equipo'),
('Jugador', 'Consulta de perfil y partidos programados');

INSERT INTO permisos (nombre_permiso, modulo) VALUES
('CREAR_USUARIO', 'Usuarios'),
('EDITAR_PARTIDO', 'Partidos'),
('VER_ESTADISTICAS', 'Reportes'),
('REGISTRAR_GOLES', 'Partidos'),
('VER_CALENDARIO', 'Partidos');

INSERT INTO rol_permisos (id_rol, id_permiso) VALUES
(1, 1), (1, 2), (1, 3), (1, 4), (1, 5),
(2, 2), (2, 4), (2, 5),
(3, 3), (3, 5),
(4, 5);

INSERT INTO usuarios (nombre, correo, id_rol, estado) VALUES
('Carlos Perez', 'carlos.perez@admin.com', 1, 'activo'),
('Andres Gomez', 'andres.gomez@arbitro.com', 2, 'activo'),
('Sofia Ruiz', 'sofia.ruiz@entrenador.com', 3, 'activo'),
('Mateo Silva', 'mateo.silva@jugador.com', 4, 'activo'),
('Lucia Torres', 'lucia.torres@jugador.com', 4, 'activo'),
('Esteban Rey', 'esteban.rey@arbitro.com', 2, 'inactivo'),
('Valentina Mora', 'valentina.mora@entrenador.com', 3, 'activo'),
('Julian Castro', 'julian.castro@jugador.com', 4, 'suspendido');