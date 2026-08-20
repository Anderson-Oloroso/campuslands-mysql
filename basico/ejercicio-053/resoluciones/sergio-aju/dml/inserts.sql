USE campuslands_mysql;

-- Limpieza de registros previos por seguridad antes de la inserción
TRUNCATE TABLE proyectos_arquitectura_3d;

-- Inserción inicial de 8 registros de proyectos de arquitectura 3D
INSERT INTO proyectos_arquitectura_3d (codigo_proyecto, nombre_proyecto, tipo_inmueble, superficie_m2, honorarios_usd, calificacion_cliente, estado_proyecto) VALUES
('ARQ-001', 'Torre Residencial Vista Hermosa', 'residencial', 1200.50, 15000.00, 4.8, 'en_render'),
('ARQ-002', 'Centro Comercial Aura Plaza', 'comercial', 4500.00, 42000.00, 4.6, 'borrador'),
('ARQ-003', 'Oficinas Corporativas Nexus', 'corporativo', 850.00, 9800.00, 4.9, 'aprobado'),
('ARQ-004', 'Complex Industrial Logística Sur', 'industrial', 6200.00, 55000.00, 4.5, 'en_render'),
('ARQ-005', 'Parque Metropolitano Verde', 'paisajismo', 12500.00, 28000.00, 4.7, 'revision_cliente'),
('ARQ-006', 'Villa Minimalista Los Pinos', 'residencial', 450.00, 7500.00, 4.3, 'borrador'),
('ARQ-007', 'Edificio de Co-Working Innova', 'corporativo', 1500.00, 18500.00, 4.9, 'en_render'),
('ARQ-008', 'Plaza Comercial Galerías del Norte', 'comercial', 3800.00, 39000.00, 4.7, 'aprobado');

-- ==========================================
-- PRÁCTICA DE SENTENCIAS UPDATE (CASOS DE NEGOCIO)
-- ==========================================

-- 1. Actualización de estado: Cambiar todos los proyectos en 'borrador' a 'en_render' para iniciar producción
UPDATE proyectos_arquitectura_3d
SET estado_proyecto = 'en_render'
WHERE estado_proyecto = 'borrador';

-- 2. Actualización de honorarios individual: Ajustar el presupuesto del proyecto ARQ-003 tras ampliación de requerimientos
UPDATE proyectos_arquitectura_3d
SET honorarios_usd = 11500.00, calificacion_cliente = 5.0
WHERE codigo_proyecto = 'ARQ-003';

-- 3. Actualización masiva porcentual: Aplicar un incremento del 10% en los honorarios de todos los proyectos de tipo 'comercial'
UPDATE proyectos_arquitectura_3d
SET honorarios_usd = honorarios_usd * 1.10
WHERE tipo_inmueble = 'comercial';

-- 4. Actualización de estatus por avance: Pasar los proyectos que estaban en 'revision_cliente' a 'aprobado'
UPDATE proyectos_arquitectura_3d
SET estado_proyecto = 'aprobado'
WHERE estado_proyecto = 'revision_cliente';