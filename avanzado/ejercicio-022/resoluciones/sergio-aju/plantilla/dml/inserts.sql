USE campuslands_mysql;

INSERT INTO categorias_animacion (nombre_categoria) VALUES
('Modelado'), ('Animacion'), ('Rigging'), ('Renderizado');

INSERT INTO proyectos_animacion (nombre, categoria_id, puntaje, estado, fecha_entrega) VALUES
('Dragon 3D', 1, 85.50, 'activo', '2026-09-01'),
('Robot Walk', 2, 92.00, 'activo', '2026-09-05'),
('Textura Base', 1, 45.00, 'inactivo', '2026-08-10'),
('Rigging Bipedo', 3, 78.50, 'revision', '2026-09-10'),
('Iluminacion', 4, 60.00, 'activo', '2026-09-12'),
('Ciclo Caminata', 2, 88.00, 'activo', '2026-09-15'),
('Setup Facial', 3, 98.00, 'revision', '2026-09-20'),
('Render Final', 4, 45.00, 'inactivo', '2026-08-20');