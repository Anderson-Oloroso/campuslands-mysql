USE arquitectura_3d_update_db;

-- Insercion de 8 registros iniciales de prueba
INSERT INTO render_escenas (nombre_escena, categoria, autor, precio_base_usd, poligonos_k, estado, fecha_modificacion) VALUES
('Fachada Moderna Glass', 'Exterior', 'Carlos Ruiz', 120.00, 450, 'en_proceso', '2026-03-01'),
('Interior Kitchen Minimal', 'Interior', 'Valeria Gomez', 85.00, 220, 'en_proceso', '2026-03-02'),
('Plaza Urbana Central', 'Urbanismo', 'Sofia Lopez', 250.00, 1200, 'revisado', '2026-03-05'),
('Auditorio Acustico', 'Interior', 'Ana Martinez', 180.00, 800, 'en_proceso', '2026-03-10'),
('Casa de Campo Rustica', 'Exterior', 'Carlos Ruiz', 95.00, 310, 'revisado', '2026-03-12'),
('Parque Ecologico Master', 'Urbanismo', 'Sofia Lopez', 310.00, 1500, 'en_proceso', '2026-03-15'),
('Lobby Hotel 5 Estrellas', 'Interior', 'Valeria Gomez', 210.00, 950, 'archivado', '2026-03-18'),
('Estructura Parametrica', 'Estructural', 'Ana Martinez', 140.00, 600, 'en_proceso', '2026-03-20');

-- Modificaciones con UPDATE (Practica central del ejercicio)
-- Update 1: Promocionar escenas revisadas a estado publicado
UPDATE render_escenas
SET estado = 'publicado', fecha_modificacion = '2026-03-22'
WHERE estado = 'revisado';

-- Update 2: Incrementar precio un 15% a los modelos de alta complejidad (> 800k poligonos)
UPDATE render_escenas
SET precio_base_usd = precio_base_usd * 1.15, fecha_modificacion = '2026-03-23'
WHERE poligonos_k > 800;

-- Update 3: Actualizar estado de trabajo en proceso a revisado para el autor Carlos Ruiz
UPDATE render_escenas
SET estado = 'revisado', fecha_modificacion = '2026-03-24'
WHERE autor = 'Carlos Ruiz' AND estado = 'en_proceso';
