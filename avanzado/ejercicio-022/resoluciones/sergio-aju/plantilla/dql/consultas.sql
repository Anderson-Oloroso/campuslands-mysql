USE campuslands_mysql;

-- 1. Consultar el rendimiento promedio desde la vista
SELECT * FROM vista_reporte_rendimiento_categorias ORDER BY promedio_puntaje DESC;

-- 2. Listar proyectos prioritarios mediante la vista
SELECT * FROM vista_proyectos_prioritarios;

-- 3. Proyectos filtrados por estado 'activo' con ordenamiento avanzado
SELECT nombre, puntaje FROM proyectos_animacion 
WHERE estado = 'activo' ORDER BY puntaje DESC;

-- 4. Categorías con mayor cantidad de proyectos
SELECT nombre_categoria, total_proyectos FROM vista_reporte_rendimiento_categorias 
WHERE total_proyectos > 1;

-- 5. Consulta compleja: Proyectos que vencen pronto (usando fecha actual)
SELECT nombre, fecha_entrega FROM proyectos_animacion 
WHERE fecha_entrega > CURDATE() ORDER BY fecha_entrega ASC;