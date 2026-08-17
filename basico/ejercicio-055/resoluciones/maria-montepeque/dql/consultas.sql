USE campuslands_mysql;

-- 1. Total de pruebas registradas
SELECT COUNT(*) AS total_pruebas
FROM pruebas_lab_basico;

-- 2. Cantidad de pruebas por tipo de reaccion
SELECT tipo_reaccion, COUNT(*) AS total
FROM pruebas_lab_basico
GROUP BY tipo_reaccion
ORDER BY total DESC;

-- 3. Gasto total en reactivos de todo el laboratorio
SELECT SUM(costo_reactivos) AS gasto_total
FROM pruebas_lab_basico;

-- 4. Gasto en reactivos agrupado por resultado de la prueba
SELECT resultado, SUM(costo_reactivos) AS gasto_total, COUNT(*) AS total_pruebas
FROM pruebas_lab_basico
GROUP BY resultado
ORDER BY gasto_total DESC;

-- 5. Cantidad de pruebas exitosas frente a fallidas
SELECT
  COUNT(CASE WHEN resultado = 'exitoso' THEN 1 END) AS exitosas,
  COUNT(CASE WHEN resultado = 'fallido' THEN 1 END) AS fallidas,
  COUNT(CASE WHEN resultado = 'en_analisis' THEN 1 END) AS en_analisis
FROM pruebas_lab_basico;

-- 6. Total de muestras analizadas y numero de pruebas por tipo de reaccion
SELECT tipo_reaccion, COUNT(*) AS total_pruebas, SUM(cantidad_muestras) AS total_muestras
FROM pruebas_lab_basico
GROUP BY tipo_reaccion
ORDER BY total_muestras DESC;
