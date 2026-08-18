-- ============================================================
-- Ejercicio 023 - Datos iniciales
-- ============================================================

USE campuslands_mysql;


-- ------------------------------------------------------------
-- Arquitectos
-- ------------------------------------------------------------
INSERT INTO arquitectos (
    nombre,
    especialidad,
    experiencia_anios,
    estado
)
VALUES
    ('Sofia Martinez', 'arquitectura residencial', 8, 'activo'),
    ('Daniel Gomez', 'arquitectura comercial', 10, 'activo'),
    ('Camila Rodriguez', 'diseño sostenible', 6, 'activo'),
    ('Mateo Lopez', 'urbanismo', 12, 'activo'),
    ('Valentina Perez', 'arquitectura residencial', 5, 'activo'),
    ('Andres Castillo', 'modelado arquitectonico', 9, 'activo'),
    ('Laura Hernandez', 'diseño sostenible', 7, 'activo'),
    ('Nicolas Ramirez', 'arquitectura comercial', 4, 'activo'),
    ('Gabriela Morales', 'interiorismo', 6, 'activo'),
    ('Diego Torres', 'urbanismo', 3, 'inactivo');


-- ------------------------------------------------------------
-- Proyectos de arquitectura
-- ------------------------------------------------------------
INSERT INTO proyectos_arquitectura (
    id_arquitecto,
    nombre,
    tipo,
    fecha_inicio,
    presupuesto,
    estado
)
VALUES
    (1, 'Residencial Los Pinos', 'residencial', '2026-01-05', 85000.00, 'en_progreso'),
    (2, 'Centro Comercial Aurora', 'comercial', '2026-01-12', 250000.00, 'en_progreso'),
    (3, 'EcoCasa Verde', 'sostenible', '2026-02-01', 120000.00, 'finalizado'),
    (4, 'Parque Urbano Central', 'urbanismo', '2026-02-15', 180000.00, 'en_progreso'),
    (5, 'Villa Moderna', 'residencial', '2026-03-01', 95000.00, 'planificado'),
    (6, 'Torre Empresarial Norte', 'comercial', '2026-03-10', 320000.00, 'en_progreso'),
    (7, 'Complejo EcoVida', 'sostenible', '2026-04-01', 210000.00, 'planificado'),
    (8, 'Galeria Metropolitana', 'comercial', '2026-04-15', 145000.00, 'finalizado'),
    (9, 'Residencial Horizonte', 'residencial', '2026-05-01', 110000.00, 'en_progreso'),
    (1, 'Casa Minimalista', 'residencial', '2026-06-01', 78000.00, 'planificado');


-- ------------------------------------------------------------
-- Modelos 3D
-- ------------------------------------------------------------
INSERT INTO modelos_3d (
    id_proyecto,
    nombre,
    categoria,
    horas_modelado,
    nivel_detalle,
    estado
)
VALUES
    (1, 'Fachada Principal', 'exterior', 28.50, 'alto', 'aprobado'),
    (1, 'Interior Sala', 'interior', 18.00, 'medio', 'revision'),
    (2, 'Entrada Comercial', 'exterior', 35.00, 'alto', 'aprobado'),
    (2, 'Zona de Restaurantes', 'interior', 26.50, 'alto', 'revision'),
    (3, 'Casa Ecologica', 'residencial', 42.00, 'alto', 'aprobado'),
    (4, 'Plaza Central', 'urbanismo', 38.50, 'alto', 'revision'),
    (5, 'Villa Principal', 'residencial', 30.00, 'medio', 'borrador'),
    (6, 'Torre Empresarial', 'exterior', 55.00, 'alto', 'aprobado'),
    (7, 'Edificio Sostenible', 'exterior', 48.00, 'alto', 'borrador'),
    (8, 'Galeria Exterior', 'exterior', 32.00, 'medio', 'aprobado'),
    (9, 'Residencia Horizonte', 'residencial', 36.00, 'alto', 'revision'),
    (10, 'Casa Minimalista', 'residencial', 24.50, 'medio', 'borrador');