USE carreras_urbanas_unique_db;

-- Consulta 1: Listado oficial de corredores ordenados por su número de dorsal único
SELECT 
    dorsal AS 'Dorsal',
    nombre_corredor AS 'Corredor',
    correo_electronico AS 'Correo Electrónico',
    categoria AS 'Categoría',
    distancia_km AS 'Distancia (KM)',
    estado_participacion AS 'Estado'
FROM carreras_urbanas
ORDER BY dorsal ASC;

-- Consulta 2: Top 3 de corredores más rápidos en la distancia de 10 kilómetros con sus respectivos dorsales
SELECT 
    dorsal AS 'Dorsal',
    nombre_corredor AS 'Corredor',
    categoria AS 'Categoría',
    tiempo_segundos AS 'Tiempo Total (s)'
FROM carreras_urbanas
WHERE distancia_km = 10.0 AND estado_participacion = 'Finalizado'
ORDER BY tiempo_segundos ASC
LIMIT 3;

-- Consulta 3: Reporte estadístico agrupado por categoría aplicando COUNT y SUM de distancias
SELECT 
    categoria AS 'Categoría',
    COUNT(*) AS 'Total de Atletas',
    SUM(distancia_km) AS 'Kilómetros Acumulados'
FROM carreras_urbanas
GROUP BY categoria
ORDER BY 'Total de Atletas' DESC;

-- Consulta 4: Filtrar participantes que se encuentran activos en la competencia (En Ruta o Inscritos)
SELECT 
    dorsal AS 'Dorsal',
    nombre_corredor AS 'Corredor',
    correo_electronico AS 'Correo',
    categoria AS 'Categoría',
    estado_participacion AS 'Situación Actual'
FROM carreras_urbanas
WHERE estado_participacion IN ('Inscrito', 'En Ruta')
ORDER BY dorsal ASC;

-- Consulta 5: Auditoría general de tiempos promedio y acumulados agrupados por estado de participación
SELECT 
    estado_participacion AS 'Estado',
    COUNT(*) AS 'Cantidad de Corredores',
    SUM(tiempo_segundos) AS 'Suma de Segundos',
    AVG(tiempo_segundos) AS 'Promedio de Segundos'
FROM carreras_urbanas
GROUP BY estado_participacion
ORDER BY 'Cantidad de Corredores' DESC;
