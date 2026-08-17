USE hiperdeportivos_explain_db;

-- Consulta 1: Analizar con EXPLAIN la búsqueda exacta por marca utilizando el índice compuesto
EXPLAIN 
SELECT 
    id_auto AS 'ID',
    marca AS 'Marca',
    modelo AS 'Modelo',
    potencia_hp AS 'Potencia (HP)',
    precio AS 'Precio ($)'
FROM autos_hiperdeportivos
WHERE marca = 'Bugatti';

-- Consulta 2: Analizar con EXPLAIN el filtrado por estado de disponibilidad aprovechando el índice idx_estado
EXPLAIN 
SELECT 
    marca AS 'Marca',
    modelo AS 'Modelo',
    estado_disponibilidad AS 'Estado'
FROM autos_hiperdeportivos
WHERE estado_disponibilidad = 'Disponible';

-- Consulta 3: Analizar con EXPLAIN el rango de precios utilizando el índice idx_precio
EXPLAIN 
SELECT 
    marca AS 'Marca',
    modelo AS 'Modelo',
    precio AS 'Precio ($)'
FROM autos_hiperdeportivos
WHERE precio BETWEEN 2000000.00 AND 3500000.00
ORDER BY precio ASC;

-- Consulta 4: Analizar con EXPLAIN una consulta agrupada con funciones de agregación
EXPLAIN 
SELECT 
    estado_disponibilidad AS 'Estado',
    COUNT(*) AS 'Total Autos',
    AVG(potencia_hp) AS 'Potencia Promedio (HP)',
    SUM(precio) AS 'Valor Total Inventario ($)'
FROM autos_hiperdeportivos
GROUP BY estado_disponibilidad;

-- Consulta 5: Analizar con EXPLAIN el Top 3 de hiperdeportivos más costosos ordenados por precio
EXPLAIN 
SELECT 
    marca AS 'Marca',
    modelo AS 'Modelo',
    precio AS 'Precio Máximo ($)'
FROM autos_hiperdeportivos
ORDER BY precio DESC
LIMIT 3;
