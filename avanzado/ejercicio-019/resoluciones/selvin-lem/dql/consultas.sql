-- Consultas base e indicadores para la modalidad de paracaidismo.
USE campuslands_mysql;

-- 1. Listado completo de registros de paracaidismo
SELECT * FROM paracaidismo;

-- 2. Agrupación por categoría con total de saltos y puntaje promedio
SELECT 
  categoria, 
  COUNT(*) AS total_registros, 
  ROUND(AVG(puntaje), 2) AS promedio
FROM paracaidismo
GROUP BY categoria
ORDER BY promedio DESC;

-- 3. Verificación de registros afectados por el Trigger (evaluación vs estado asignado)
SELECT 
  id,
  nombre,
  categoria,
  puntaje,
  estado,
  CASE 
    WHEN puntaje < 40.00 THEN 'Ajustado por Trigger a Revisión'
    ELSE 'Aprobado Directamente'
  END AS diagnostico_trigger
FROM paracaidismo;

-- 4. Saltos activos con alto nivel de desempeño/evaluación
SELECT 
  nombre,
  categoria,
  puntaje,
  estado
FROM paracaidismo
WHERE estado = 'activo' AND puntaje >= 75.00
ORDER BY puntaje DESC;

-- 5. Resumen consolidado por estado del salto
SELECT 
  estado,
  COUNT(*) AS cantidad,
  MIN(puntaje) AS puntaje_minimo,
  MAX(puntaje) AS puntaje_maximo
FROM paracaidismo
GROUP BY estado;