-- Datos de practica: maquetas de un estudio de arquitectura 3D.
USE campuslands_mysql;

INSERT INTO maquetas_basico (nombre, tipo_construccion, software, precio, estado) VALUES
('Casa Moderna Los Alamos', 'residencial', 'SketchUp', 4700.00, 'boceto'),
('Edificio Oficinas Sur', 'comercial', 'Revit', 19000.00, 'boceto'),
('Casa Campestre El Retiro', 'residencial', 'SketchUp', 5300.00, 'boceto'),
('Centro Comercial Oriente', 'comercial', 'Revit', 33000.00, 'modelado'),
('Biblioteca Distrital', 'institucional', 'ArchiCAD', 15500.00, 'modelado'),
('Planta Industrial Norte', 'industrial', 'Revit', 26000.00, 'renderizado'),
('Parque Ribera del Rio', 'paisajismo', 'Lumion', 9500.00, 'entregado'),
('Casa Minimalista Cedro', 'residencial', 'SketchUp', 4900.00, 'boceto');

-- UPDATE 1: una sola fila identificada por su PRIMARY KEY.
UPDATE maquetas_basico
SET estado = 'entregado'
WHERE id_maqueta = 6;

-- UPDATE 2: varias filas que cumplen una condicion (avanzan de fase todas
-- las casas residenciales que seguian en boceto).
UPDATE maquetas_basico
SET estado = 'modelado'
WHERE tipo_construccion = 'residencial' AND estado = 'boceto';

-- UPDATE 3: actualizacion con una expresion (incremento del 8% al precio
-- de los proyectos comerciales, por ajuste de costos).
UPDATE maquetas_basico
SET precio = precio * 1.08
WHERE tipo_construccion = 'comercial';

-- UPDATE 4: actualizacion masiva con CASE, para avanzar de fase en
-- cascada solo los proyectos hechos en Revit.
UPDATE maquetas_basico
SET estado = CASE estado
  WHEN 'boceto' THEN 'modelado'
  WHEN 'modelado' THEN 'renderizado'
  ELSE estado
END
WHERE software = 'Revit';
