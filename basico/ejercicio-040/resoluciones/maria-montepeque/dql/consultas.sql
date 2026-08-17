USE campuslands_mysql;

-- 1. Total de corredores registrados
SELECT COUNT(*) AS total_corredores
FROM corredores_basico;

-- 2. Cantidad de corredores por categoria
SELECT categoria, COUNT(*) AS total
FROM corredores_basico
GROUP BY categoria
ORDER BY total DESC;

-- 3. Total recaudado en inscripciones
SELECT SUM(costo_inscripcion) AS recaudo_total
FROM corredores_basico;

-- 4. Recaudo agrupado por categoria
SELECT categoria, SUM(costo_inscripcion) AS recaudo, COUNT(*) AS total_corredores
FROM corredores_basico
GROUP BY categoria
ORDER BY recaudo DESC;

-- 5. Cantidad de corredores finalizados, con abandono y descalificados
SELECT
  COUNT(CASE WHEN resultado = 'finalizado' THEN 1 END) AS finalizados,
  COUNT(CASE WHEN resultado = 'abandono' THEN 1 END) AS abandonos,
  COUNT(CASE WHEN resultado = 'descalificado' THEN 1 END) AS descalificados
FROM corredores_basico;

-- 6. Cantidad de corredores y tiempo total acumulado por categoria
SELECT categoria, COUNT(*) AS total_corredores, SUM(tiempo_minutos) AS tiempo_total_minutos
FROM corredores_basico
GROUP BY categoria
ORDER BY tiempo_total_minutos DESC;
