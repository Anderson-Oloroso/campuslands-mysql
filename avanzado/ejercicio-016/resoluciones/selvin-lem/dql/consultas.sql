-- Consultas de análisis e indicadores para el restaurante urbano.
USE campuslands_mysql;

-- 1. Consulta general de platillos y estados registrados
SELECT 
  id, 
  nombre, 
  categoria, 
  puntaje AS precio_valoracion, 
  estado, 
  creado_en
FROM avanzado_ejercicio_016
ORDER BY creado_en DESC;

-- 2. Métricas globales agrupadas por categoría de comida urbana
SELECT 
  categoria,
  COUNT(*) AS total_registros,
  SUM(puntaje) AS total_acumulado,
  AVG(puntaje) AS promedio_puntaje,
  MIN(puntaje) AS puntaje_minimo,
  MAX(puntaje) AS puntaje_maximo
FROM avanzado_ejercicio_016
GROUP BY categoria
ORDER BY promedio_puntaje DESC;

-- 3. Platillos activos de alta valoración/precio
SELECT 
  id, 
  nombre, 
  categoria, 
  puntaje, 
  estado
FROM avanzado_ejercicio_016
WHERE estado = 'activo' AND puntaje >= 50.00
ORDER BY puntaje DESC;

-- 4. Conteo de ítems según su estado de preparación u homologación
SELECT 
  estado,
  COUNT(*) AS cantidad_platillos,
  ROUND(AVG(puntaje), 2) AS promedio_valor
FROM avanzado_ejercicio_016
GROUP BY estado;

-- 5. Consulta combinada con filtrado y subconsulta (Mapeo de ítems sobre el promedio global)
SELECT 
  nombre,
  categoria,
  puntaje,
  estado
FROM avanzado_ejercicio_016
WHERE puntaje > (SELECT AVG(puntaje) FROM avanzado_ejercicio_016)
ORDER BY puntaje DESC;