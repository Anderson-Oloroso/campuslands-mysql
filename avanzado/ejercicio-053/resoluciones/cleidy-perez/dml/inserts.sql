-- Datos de practica. Puedes cambiarlos o agregar mas filas.
-- Insertar Temáticas (6 registros)
INSERT INTO tematicas (nombre, descripcion) VALUES
('arquitectura 3D', 'Modelado arquitectónico, renderizado de Interiores y Exteriores.'),
('animacion 3D', 'Principios de movimiento, rigging y secuencias de cámara.'),
('iluminacion y render', 'Configuración de motores de render como V-Ray y Corona.'),
('texturizado PBR', 'Creación de materiales realistas usando Substance Painter.'),
('postproduccion', 'Edición de pases de render en Photoshop y After Effects.'),
('BIM y paramétrico', 'Integración de modelos 3D con datos de construcción.');

-- Insertar Instructores (6 registros)
INSERT INTO instructores (nombre, email) VALUES
('Arq. Roberto Gómez', 'roberto.gomez@academia.com'),
('Lic. Sofia Martínez', 'sofia.martinez@academia.com'),
('Ing. Carlos Ruiz', 'carlos.ruiz@academia.com'),
('Arq. Elena Torres', 'elena.torres@academia.com'),
('Diseñador Mario Paez', 'mario.paez@academia.com'),
('Arq. Lucia Méndez', 'lucia.mendez@academia.com');

-- Insertar Ejercicios (6 registros)
INSERT INTO ejercicios (codigo, titulo, dificultad, id_tematica, id_instructor, contexto, objetivo) VALUES
('EJ-020', 'Modelado de Fachada Minimalista', 'Basico', 1, 1, 'Proyecto de edificación residencial urbana.', 'Crear volumen exterior limpio con muros cortina.'),
('EJ-021', 'Iluminación HDRI para Interiores', 'Intermedio', 3, 2, 'Render nocturno de departamento.', 'Balancear luz natural HDRI con luces artificiales IES.'),
('EJ-022', 'normalizacion 2FN para animacion 3D', 'Intermedio aplicado', 2, 3, 'Optimización de base de datos para assets de animación.', 'Aplicar 2FN a la estructura de proyectos.'),
('EJ-023', 'normalizacion 3FN para arquitectura 3D', 'Intermedio aplicado', 1, 4, 'Modulo de datos para academia de arquitectura 3D.', 'Practicar normalización 3FN en MySQL desde cero.'),
('EJ-024', 'Materiales Complejos de Concreto y Cristal', 'Avanzado', 4, 5, 'Estructura brutalista moderna.', 'Configurar mapas de rugosidad y refracción avanzados.'),
('EJ-025', 'Recorrido Virtual Animado', 'Avanzado aplicado', 2, 6, 'Presentación de conjunto habitacional.', 'Animar cámaras fijas y en movimiento suave.');

-- Insertar Estudiantes (6 registros)
INSERT INTO estudiantes (nombre, email) VALUES
('Alejandro Navarro', 'ale.navarro@mail.com'),
('Beatriz Castillo', 'b.castillo@mail.com'),
('Christian Vega', 'chris.vega@mail.com'),
('Diana Rios', 'diana.rios@mail.com'),
('Eduardo Silva', 'edu.silva@mail.com'),
('Fernanda López', 'fer.lopez@mail.com');

-- Insertar Entregas (6 registros)
INSERT INTO entregas (id_ejercicio, id_estudiante, url_render, estado, calificacion, fecha_entrega) VALUES
(4, 1, 'https://storage.academia.com/renders/ale_ej023.png', 'Aprobado', 9.80, '2026-03-01 10:15:00'),
(4, 2, 'https://storage.academia.com/renders/beatriz_ej023.png', 'Aprobado', 8.50, '2026-03-01 11:30:00'),
(4, 3, 'https://storage.academia.com/renders/chris_ej023.png', 'En Revisión', NULL, '2026-03-02 09:00:00'),
(1, 4, 'https://storage.academia.com/renders/diana_ej020.png', 'Aprobado', 10.00, '2026-02-20 14:20:00'),
(2, 5, 'https://storage.academia.com/renders/edu_ej021.png', 'Rechazado', 4.00, '2026-02-22 16:45:00'),
(4, 6, 'https://storage.academia.com/renders/fer_ej023.png', 'Pendiente', NULL, '2026-03-02 12:10:00');