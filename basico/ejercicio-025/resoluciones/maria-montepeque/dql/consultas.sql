USE campuslands_mysql;

-- 1. Total de experimentos registrados
SELECT COUNT(*) AS total_experimentos
FROM experimentos_basico;

-- 2. Cantidad de experimentos por tipo de reaccion
SELECT tipo_reaccion, COUNT(*) AS total
FROM experimentos_basico
GROUP BY tipo_reaccion
ORDER BY total DESC;

-- 3. Gasto total en reactivos de todo el laboratorio
SELECT SUM(costo_reactivos) AS gasto_total
FROM experimentos_basico;

-- 4. Gasto en reactivos agrupado por resultado del experimento
SELECT resultado, SUM(costo_reactivos) AS gasto_total, COUNT(*) AS total_experimentos
FROM experimentos_basico
GROUP BY resultado
ORDER BY gasto_total DESC;

-- 5. Cantidad de experimentos exitosos frente a fallidos
SELECT
  COUNT(CASE WHEN resultado = 'exitoso' THEN 1 END) AS exitosos,
  COUNT(CASE WHEN resultado = 'fallido' THEN 1 END) AS fallidos,
  COUNT(CASE WHEN resultado = 'en_analisis' THEN 1 END) AS en_analisis
FROM experimentos_basico;

-- 6. Total de muestras analizadas y numero de experimentos por tipo de reaccion
SELECT tipo_reaccion, COUNT(*) AS total_experimentos, SUM(cantidad_muestras) AS total_muestras
FROM experimentos_basico
GROUP BY tipo_reaccion
ORDER BY total_muestras DESC;
