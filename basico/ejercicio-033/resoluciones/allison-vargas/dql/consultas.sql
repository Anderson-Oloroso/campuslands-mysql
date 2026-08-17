USE shooter_skins_basico_db;

-- Consulta 1: Listado general de skins ordenadas por precio de mayor a menor
SELECT 
    id_skin AS 'ID Único (PK)',
    nombre_skin AS 'Skin',
    arma AS 'Arma',
    rareza AS 'Rareza',
    precio AS 'Precio ($)',
    estado_inventario AS 'Estado'
FROM skins_shooter
ORDER BY precio DESC;

-- Consulta 2: Filtrar skins que se encuentran disponibles para la venta o uso en el inventario
SELECT 
    nombre_skin AS 'Skin Disponible',
    arma AS 'Arma',
    precio AS 'Precio ($)'
FROM skins_shooter
WHERE estado_inventario = 'Disponible'
ORDER BY precio ASC;

-- Consulta 3: Top 3 de skins más costosas del inventario (Ranking de valor)
SELECT 
    nombre_skin AS 'Skin Premium',
    rareza AS 'Rareza',
    precio AS 'Precio Máximo ($)'
FROM skins_shooter
ORDER BY precio DESC
LIMIT 3;

-- Consulta 4: Conteo y valorización total del inventario agrupados por rareza
SELECT 
    rareza AS 'Rareza de la Skin',
    COUNT(*) AS 'Cantidad de Ítems',
    SUM(precio) AS 'Valor Total por Rareza ($)'
FROM skins_shooter
GROUP BY rareza
ORDER BY 'Valor Total por Rareza ($)' DESC;

-- Consulta 5: Reporte analítico de precio promedio agrupado por el estado operativo en el inventario
SELECT 
    estado_inventario AS 'Estado Operativo',
    COUNT(*) AS 'Total de Skins',
    AVG(precio) AS 'Precio Promedio ($)'
FROM skins_shooter
GROUP BY estado_inventario
ORDER BY 'Precio Promedio ($)' DESC;
