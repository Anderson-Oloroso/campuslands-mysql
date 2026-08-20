-- Consultas base e indicadores optimizados para el estudio de tatuajes.
USE campuslands_mysql;

-- 1. Consulta general de diseños y piezas de tatuaje
SELECT * FROM estudio_tatuajes;

-- 2. Agrupación por categoría aprovechando idx_tatuajes_categoria
SELECT 
  categoria, 
  COUNT(*) AS total_registros, 
  ROUND(AVG(puntaje), 2) AS promedio
FROM estudio_tatuajes
GROUP BY categoria
ORDER BY promedio DESC;

-- 3. Búsqueda rápida por categoría y estado aprovechando el índice compuesto (idx_tatuajes_cat_estado)
SELECT 
  id,
  nombre,
  categoria,
  puntaje,
  estado
FROM estudio_tatuajes
WHERE categoria = 'Realismo' AND estado = 'activo';

-- 4. Búsqueda por rango de puntuación/valoración con filtro de índice en estado
SELECT 
  nombre,
  categoria,
  puntaje,
  estado
FROM estudio_tatuajes
WHERE estado = 'activo' AND puntaje >= 70.00
ORDER BY puntaje DESC;

-- 5. Resumen consolidado del catálogo de estilos según disponibilidad
SELECT 
  estado,
  COUNT(*) AS cantidad_diseños,
  ROUND(AVG(puntaje), 2) AS valoracion_promedio
FROM estudio_tatuajes
GROUP BY estado;