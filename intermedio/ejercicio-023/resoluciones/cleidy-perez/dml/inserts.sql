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

INSERT INTO estudiantes (nombre, email) VALUES
('Alejandro Navarro', 'ale.navarro@mail.com'),
('Beatriz Castillo', 'b.castillo@mail.com'),
('Christian Vega', 'chris.vega@mail.com'),
('Diana Rios', 'diana.rios@mail.com'),
('Eduardo Silva', 'edu.silva@mail.com'),
('Fernanda López', 'fer.lopez@mail.com');