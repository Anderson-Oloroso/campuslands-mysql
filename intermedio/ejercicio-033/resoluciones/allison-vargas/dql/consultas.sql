USE shooter_skins_group_db;

-- Consulta 1: Conteo de skins y valor total acumulado agrupados por la rareza del ítem
SELECT 
    rareza AS 'Rareza de la Skin',
    COUNT(*) AS 'Total de Skins',
    SUM(precio) AS 'Valor Total Acumulado ($)'
FROM skins_shooter
GROUP BY rareza
ORDER BY 'Valor Total Acumulado ($)' DESC;

-- Consulta 2: Promedio de precios y precio máximo agrupados por estado operativo en el inventario
SELECT 
    estado_inventario AS 'Estado Operativo',
    COUNT(*) AS 'Cantidad de Ítems',
    AVG(precio) AS 'Precio Promedio ($)',
    MAX(precio) AS 'Precio Máximo ($)'
FROM skins_shooter
GROUP BY estado_inventario
ORDER BY 'Precio Promedio ($)' DESC;

-- Consulta 3: Análisis agrupado por tipo de arma evaluando la skin más económica y la más costosa
SELECT 
    arma AS 'Tipo de Arma',
    COUNT(*) AS 'Skins por Arma',
    MIN(precio) AS 'Precio Mínimo ($)',
    MAX(precio) AS 'Precio Máximo ($)'
FROM skins_shooter
GROUP BY arma
ORDER BY 'Skins por Arma' DESC;

-- Consulta 4: Filtrar agrupaciones por rareza que tengan un precio promedio superior a 100 dólares (uso de HAVING)
SELECT 
    rareza AS 'Rareza',
    COUNT(*) AS 'Total de Skins',
    AVG(precio) AS 'Precio Promedio ($)'
FROM skins_shooter
GROUP BY rareza
HAVING AVG(precio) > 100.00
ORDER BY 'Precio Promedio ($)' DESC;

-- Consulta 5: Reporte consolidado agrupado por estado y rareza para evaluar distribución del inventario
SELECT 
    estado_inventario AS 'Estado',
    rareza AS 'Rareza',
    COUNT(*) AS 'Cantidad',
    SUM(precio) AS 'Suma de Precios ($)'
FROM skins_shooter
GROUP BY estado_inventario, rareza
ORDER BY estado_inventario ASC, 'Suma de Precios ($)' DESC;
