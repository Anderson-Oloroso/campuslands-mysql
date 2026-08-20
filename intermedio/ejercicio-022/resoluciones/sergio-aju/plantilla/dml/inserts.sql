USE campuslands_mysql;

-- 1. Inserción de categorías
INSERT INTO categorias_animacion (nombre_categoria, descripcion) VALUES
('Modelado', 'Creación de mallas 3D y esculpido digital'),
('Animacion', 'Esquemas de movimiento y rigging de personajes'),
('Rigging', 'Estructuras de huesos y controles para animación'),
('Renderizado', 'Procesamiento final de luces, sombras y texturas');

-- 2. Inserción de proyectos vinculados a sus respectivas categorías (mínimo 8 registros)
INSERT INTO proyectos_animacion (nombre, categoria_id, puntaje, estado) VALUES
('Dragon 3D', 1, 85.50, 'activo'),
('Robot Walk', 2, 92.00, 'activo'),
('Textura Base', 1, 45.00, 'inactivo'),
('Rigging Bipedo', 3, 78.50, 'revision'),
('Iluminacion Escena', 4, 60.00, 'activo'),
('Ciclo Caminata', 2, 55.50, 'activo'),
('Setup Facial', 3, 98.00, 'revision'),
('Render Final', 4, 45.00, 'inactivo');