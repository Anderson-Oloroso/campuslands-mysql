-- Insercion de datos para animacion 3D (ejercicio-052)
USE campuslands_mysql;

-- Insercion en estudios_animacion
INSERT INTO estudios_animacion (nombre_estudio, pais, motor_render_principal) VALUES
('Pixar Animation Studios', 'Estados Unidos', 'RenderMan'),
('DreamWorks Animation', 'Estados Unidos', 'Arnold'),
('Fortiche Production', 'Francia', 'Arnold'),
('Studio Trigger CGI', 'Japon', 'Blender'),
('ILM VFX', 'Estados Unidos', 'Unreal Engine 5');

-- Insercion en personajes_3d
INSERT INTO personajes_3d (nombre_modelo, id_estudio, software_modelado, poligonos_count, tipo_rig, texturas_4k, costo_produccion) VALUES
('Buzz Lightyear HD Rig', 1, 'Maya', 850000, 'Bipedo Humanoide', 'Si', 15000.00),
('Sox Robot Cat', 1, 'Maya', 450000, 'Criatura Cuadrupeda', 'Si', 8500.00),
('Puss in Boots Final', 2, 'Maya', 920000, 'Bipedo Humanoide', 'Si', 18000.00),
('Death Wolf Sickle', 2, 'ZBrush', 1200000, 'Bipedo Humanoide', 'Si', 22000.00),
('Jinx Zaunite Arcane', 3, 'Blender', 650000, 'Facial Avanzado', 'Si', 25000.00),
('Vi Enforcer Hextech', 3, 'Blender', 700000, 'Facial Avanzado', 'Si', 24000.00),
('Cyber Dragon Mecha', 4, 'Blender', 1500000, 'Mecanico/Robot', 'No', 12000.00),
('Hulkbuster Mk2 VFX', 5, 'Maya', 2800000, 'Mecanico/Robot', 'Si', 35000.00),
('Rancor Monster Cave', 5, 'ZBrush', 3400000, 'Criatura Cuadrupeda', 'Si', 40000.00),
('Woody Cowboy Classic', 1, 'Maya', 500000, 'Bipedo Humanoide', 'Si', 12000.00),
('Shrek Swamp Rig', 2, 'Maya', 620000, 'Bipedo Humanoide', 'Si', 14000.00),
('Silco Crime Lord', 3, 'Blender', 580000, 'Facial Avanzado', 'Si', 21000.00);

