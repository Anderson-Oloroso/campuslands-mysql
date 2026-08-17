USE shooter_skins_db;

-- Consulta 1: Listado completo aplicando la función personalizada para mostrar el precio real de mercado
SELECT 
    nombre_skin AS 'Skin',
    arma AS 'Arma',
    rareza AS 'Rareza',
    precio_base AS 'Precio Base ($)',
    nivel_desgaste AS 'Desgaste',
    fn_calcular_precio_real(precio_base, nivel_desgaste) AS 'Precio Real Valuado ($)',
    estado_inventario AS 'Estado'
FROM skins_shooter
ORDER BY 'Precio Real Valuado ($)' DESC;

-- Consulta 2: Filtrar skins de rareza Épica o Legendaria cuyo precio real valuado supere los 100 dólares
SELECT 
    nombre_skin AS 'Skin Destacada',
    arma AS 'Arma',
    rareza AS 'Rareza',
    fn_calcular_precio_real(precio_base, nivel_desgaste) AS 'Valor Actual ($)'
FROM skins_shooter
WHERE rareza IN ('Épica', 'Legendaria') 
  AND fn_calcular_precio_real(precio_base, nivel_desgaste) > 100.00
ORDER BY 'Valor Actual ($)' DESC;

-- Consulta 3: Conteo y valorización total del inventario agrupados por estado actual
SELECT 
    estado_inventario AS 'Estado del Inventario',
    COUNT(*) AS 'Cantidad de Skins',
    SUM(fn_calcular_precio_real(precio_base, nivel_desgaste)) AS 'Valor Total Acumulado ($)'
FROM skins_shooter
GROUP BY estado_inventario
ORDER BY 'Valor Total Acumulado ($)' DESC;

-- Consulta 4: Top 3 de skins con menor nivel de desgaste (mejor condición estética)
SELECT 
    nombre_skin AS 'Skin',
    arma AS 'Arma',
    nivel_desgaste AS 'Nivel de Desgaste',
    rareza AS 'Rareza'
FROM skins_shooter
ORDER BY nivel_desgaste ASC
LIMIT 3;

-- Consulta 5: Reporte analítico de precio promedio base y real agrupado por rareza de las skins
SELECT 
    rareza AS 'Rareza de la Skin',
    COUNT(*) AS 'Total de Ítems',
    AVG(precio_base) AS 'Precio Base Promedio ($)',
    AVG(fn_calcular_precio_real(precio_base, nivel_desgaste)) AS 'Precio Real Promedio ($)'
FROM skins_shooter
GROUP BY rareza
ORDER BY 'Precio Real Promedio ($)' DESC;
