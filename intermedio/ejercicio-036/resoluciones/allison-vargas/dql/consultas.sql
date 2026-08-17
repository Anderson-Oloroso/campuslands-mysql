USE hiperdeportivos_1fn_db;

-- Consulta 1: Listado general de hiperdeportivos en 1FN ordenados por potencia atómica de mayor a menor
SELECT 
    id_auto AS 'ID Único',
    marca AS 'Marca',
    modelo AS 'Modelo',
    potencia_hp AS 'Potencia (HP)',
    velocidad_max_kmh AS 'Velocidad Máxima (km/h)',
    estado_disponibilidad AS 'Estado'
FROM autos_hiperdeportivos
ORDER BY potencia_hp DESC;

-- Consulta 2: Filtrar vehículos disponibles con datos atómicos específicos de precio y velocidad
SELECT 
    marca AS 'Marca',
    modelo AS 'Modelo',
    precio AS 'Precio ($)',
    velocidad_max_kmh AS 'Velocidad Máxima (km/h)'
FROM autos_hiperdeportivos
WHERE estado_disponibilidad = 'Disponible'
ORDER BY precio ASC;

-- Consulta 3: Top 3 de hiperdeportivos con mayor velocidad máxima registrada (Atomicidad garantizada)
SELECT 
    marca AS 'Marca',
    modelo AS 'Modelo',
    velocidad_max_kmh AS 'Velocidad Máxima (km/h)',
    precio AS 'Precio ($)'
FROM autos_hiperdeportivos
ORDER BY velocidad_max_kmh DESC
LIMIT 3;

-- Consulta 4: Reporte estadístico agrupado por estado evaluando promedios atómicos de potencia y valor total
SELECT 
    estado_disponibilidad AS 'Estado de Disponibilidad',
    COUNT(*) AS 'Total de Unidades',
    AVG(potencia_hp) AS 'Potencia Promedio (HP)',
    SUM(precio) AS 'Valor Total del Inventario ($)'
FROM autos_hiperdeportivos
GROUP BY estado_disponibilidad
ORDER BY 'Valor Total del Inventario ($)' DESC;

-- Consulta 5: Análisis relacional calculando la relación de precio por cada caballo de fuerza (Precio / Potencia)
SELECT 
    marca AS 'Marca',
    modelo AS 'Modelo',
    potencia_hp AS 'Potencia (HP)',
    precio AS 'Precio ($)',
    ROUND(precio / potencia_hp, 2) AS 'Costo por HP ($/HP)'
FROM autos_hiperdeportivos
WHERE estado_disponibilidad != 'Vendido'
ORDER BY 'Costo por HP ($/HP)' ASC;
