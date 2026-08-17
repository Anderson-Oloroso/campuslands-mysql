USE hiperdeportivos_where_db;

-- Consulta 1: Filtrar hiperdeportivos que se encuentran disponibles usando WHERE con igualdad exacta
SELECT 
    id_auto AS 'ID',
    marca AS 'Marca',
    modelo AS 'Modelo',
    potencia_hp AS 'Potencia (HP)',
    precio AS 'Precio ($)'
FROM autos_hiperdeportivos
WHERE estado_disponibilidad = 'Disponible'
ORDER BY precio ASC;

-- Consulta 2: Filtrar vehículos cuya potencia supere los 1000 HP utilizando operador de comparación mayor que (>)
SELECT 
    marca AS 'Marca',
    modelo AS 'Modelo',
    potencia_hp AS 'Potencia (HP)',
    velocidad_max_kmh AS 'Velocidad Máxima (km/h)'
FROM autos_hiperdeportivos
WHERE potencia_hp > 1000
ORDER BY potencia_hp DESC;

-- Consulta 3: Filtrar autos cuyo precio se encuentre en un rango específico usando BETWEEN
SELECT 
    marca AS 'Marca',
    modelo AS 'Modelo',
    precio AS 'Precio ($)',
    estado_disponibilidad AS 'Estado'
FROM autos_hiperdeportivos
WHERE precio BETWEEN 2000000.00 AND 3000000.00
ORDER BY precio ASC;

-- Consulta 4: Filtrar vehículos cuyos estados sean 'Disponible' o 'Reservado' utilizando el operador IN
SELECT 
    marca AS 'Marca',
    modelo AS 'Modelo',
    velocidad_max_kmh AS 'Velocidad Máxima (km/h)',
    estado_disponibilidad AS 'Estado Actual'
FROM autos_hiperdeportivos
WHERE estado_disponibilidad IN ('Disponible', 'Reservado')
ORDER BY velocidad_max_kmh DESC;

-- Consulta 5: Filtrar marcas que contengan la letra 'a' o 'A' utilizando el operador LIKE con comodines
SELECT 
    marca AS 'Marca',
    modelo AS 'Modelo',
    precio AS 'Precio ($)'
FROM autos_hiperdeportivos
WHERE marca LIKE '%a%' OR marca LIKE '%A%'
ORDER BY marca ASC;
