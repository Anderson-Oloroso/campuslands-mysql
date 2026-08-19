USE juego_accion_aventura_db;

-- 1. Consultar artefactos que se encuentran disponibles para equipar o usar, ordenados por nivel de poder de mayor a menor
SELECT codigo_artefacto, nombre_artefacto, tipo_artefacto, nivel_poder, valor_monedas, estado_disponibilidad
FROM artefactos_aventura
WHERE estado_disponibilidad = 'disponible'
ORDER BY nivel_poder DESC;

-- 2. Consultar artefactos de alto valor monetario (superiores o iguales a 2,000 monedas) utilizando filtros y operadores de comparación
SELECT codigo_artefacto, nombre_artefacto, tipo_artefacto, nivel_poder, valor_monedas, estado_disponibilidad
FROM artefactos_aventura
WHERE valor_monedas >= 2000.00
ORDER BY valor_monedas DESC;

-- 3. Filtrar artefactos por categorías clave (Arma y Reliquia) utilizando el operador IN para análisis de inventario estratégico
SELECT codigo_artefacto, nombre_artefacto, tipo_artefacto, nivel_poder, valor_monedas, estado_disponibilidad
FROM artefactos_aventura
WHERE tipo_artefacto IN ('Arma', 'Reliquia')
ORDER BY nivel_poder DESC;

-- 4. Aislar artefactos que no estén en estado 'roto' ni 'perdido' utilizando NOT IN para evaluar recursos operativos listos
SELECT codigo_artefacto, nombre_artefacto, tipo_artefacto, nivel_poder, estado_disponibilidad
FROM artefactos_aventura
WHERE estado_disponibilidad NOT IN ('roto', 'perdido')
ORDER BY nivel_poder DESC;

-- 5. Reporte analítico agrupado por tipo de artefacto: conteo total, nivel de poder máximo y valor acumulado en el inventario
SELECT 
    tipo_artefacto,
    COUNT(*) AS total_artefactos,
    MAX(nivel_poder) AS nivel_poder_maximo,
    CONCAT('$', FORMAT(SUM(valor_monedas), 2)) AS valor_total_monedas
FROM artefactos_aventura
GROUP BY tipo_artefacto
ORDER BY SUM(valor_monedas) DESC;