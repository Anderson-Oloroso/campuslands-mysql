-- Datos de practica. Puedes cambiarlos o agregar mas filas.
USE campuslands_mysql;


INSERT INTO software_3d (nombre_software, desarrollador, licencia_tipo) VALUES
('Blender', 'Blender Foundation', 'Gratuito'),
('Autodesk Maya', 'Autodesk', 'Suscripción'),
('SideFX Houdini', 'SideFX', 'Suscripción');

INSERT INTO estudios_animacion (nombre_estudio, pais_origen, anio_fundacion) VALUES
('Pixar Animation Studios', 'Estados Unidos', 1986),
('Studio Ghibli', 'Japón', 1985),
('Framestore', 'Reino Unido', 1986);

INSERT INTO artistas_3d (estudio_id, nombre_artista, especialidad, correo) VALUES
(1, 'Carlos Méndez', 'Animación', 'carlos.mendez@pixar.com'),
(1, 'Andrea Ríos', 'Rigging', 'andrea.rios@pixar.com'),
(2, 'Kenji Takahashi', 'Modelado', 'kenji.takahashi@ghibli.jp'),
(3, 'Sarah Jenkins', 'Render/VFX', 'sarah.jenkins@framestore.com');

INSERT INTO proyectos_3d (estudio_id, software_id, titulo_proyecto, tipo_produccion, duracion_segundos, presupuesto_usd) VALUES
(1, 2, 'Aventura Estelar', 'Largometraje', 5400, 75000000.00),
(1, 1, 'El Salto del Conejo', 'Cortometraje', 360, 150000.00),
(2, 2, 'Leyendas del Viento', 'Largometraje', 6600, 45000000.00),
(3, 3, 'Impacto Cósmico', 'Comercial', 60, 250000.00);

INSERT INTO asignaciones_proyecto (proyecto_id, artista_id, rol_en_proyecto, horas_asignadas) VALUES
(1, 1, 'Lead Animator', 320.00),
(1, 2, 'Senior Rigger', 180.00),
(2, 1, 'Character Animator', 120.00),
(3, 3, 'Lead Modeler', 250.00),
(4, 4, 'VFX Supervisor', 90.00);