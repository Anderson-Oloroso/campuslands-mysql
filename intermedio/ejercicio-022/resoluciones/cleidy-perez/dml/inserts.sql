-- Datos de practica. Puedes cambiarlos o agregar mas filas.
USE plattform_animacion;

-- Insertar Temáticas
INSERT INTO tematicas (nombre, descripcion) VALUES
('animacion 3D', 'Principios, flujos de trabajo, cámaras y dinámicas en animación tridimensional.'),
('modelado 3D', 'Creación de mallas, topología y escultura digital.');

INSERT INTO ejercicios (codigo, titulo, dificultad, id_tematica, instrucciones) VALUES
('EJ-021', 'Principios de Squash & Stretch', 'Intermedio', 1, 'Aplicar deformación de volumen a una esfera durante una caída.'),
('EJ-022', 'vistas avanzadas para animacion 3D', 'Avanzado aplicado', 1, 'Configurar un sistema de cámaras personalizadas, motion trails y visores multienfoque para optimizar el flujo de trabajo.');

INSERT INTO entregas (id_ejercicio, nombre_alumno, url_archivo_3d, estado, calificacion) VALUES
(2, 'Carlos Mendoza', 'https://storage.ejemplo.com/entregas/carlos_ej022.mb', 'Aprobado', 9.50),
(2, 'Ana Gómez', 'https://storage.ejemplo.com/entregas/ana_ej022.blend', 'En Revisión', NULL);