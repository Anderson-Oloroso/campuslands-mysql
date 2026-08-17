-- Datos de practica: modelos de un estudio de arquitectura 3D.
USE campuslands_mysql;

INSERT INTO modelos_basico (nombre, tipo_construccion, software, precio, estado) VALUES
('Casa Moderna Los Pinos', 'residencial', 'SketchUp', 4500.00, 'boceto'),
('Edificio Oficinas Central', 'comercial', 'Revit', 18000.00, 'boceto'),
('Casa Campestre El Roble', 'residencial', 'SketchUp', 5200.00, 'boceto'),
('Centro Comercial Norte', 'comercial', 'Revit', 32000.00, 'modelado'),
('Biblioteca Municipal', 'institucional', 'ArchiCAD', 15000.00, 'modelado'),
('Planta Industrial Sur', 'industrial', 'Revit', 25000.00, 'renderizado'),
('Parque Urbano Ribera', 'paisajismo', 'Lumion', 9000.00, 'entregado'),
('Casa Minimalista Vista', 'residencial', 'SketchUp', 4800.00, 'boceto');

-- UPDATE 1: una sola fila identificada por su PRIMARY KEY.
UPDATE modelos_basico
SET estado = 'entregado'
WHERE id_modelo = 6;

-- UPDATE 2: varias filas que cumplen una condicion (avanzan de fase todas
-- las casas residenciales que seguian en boceto).
UPDATE modelos_basico
SET estado = 'modelado'
WHERE tipo_construccion = 'residencial' AND estado = 'boceto';

-- UPDATE 3: actualizacion con una expresion (incremento del 8% al precio
-- de los proyectos comerciales, por ajuste de costos).
UPDATE modelos_basico
SET precio = precio * 1.08
WHERE tipo_construccion = 'comercial';

-- UPDATE 4: actualizacion masiva con CASE, para avanzar de fase en
-- cascada solo los proyectos hechos en Revit.
UPDATE modelos_basico
SET estado = CASE estado
  WHEN 'boceto' THEN 'modelado'
  WHEN 'modelado' THEN 'renderizado'
  ELSE estado
END
WHERE software = 'Revit';
