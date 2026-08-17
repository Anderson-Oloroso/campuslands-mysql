USE carreras_urbanas_backup_db;

-- Consulta 1: Listado oficial de participantes con conversión de tiempos a formato legible (Minutos y Segundos)
SELECT 
    id_participante AS 'Dorsal',
    nombre_corredor AS 'Corredor',
    categoria AS 'Categoría',
    distancia_km AS 'Distancia (KM)',
    FLOOR(tiempo_segundos / 60) AS 'Minutos',
    MOD(tiempo_segundos, 60) AS 'Segundos',
    estado_participacion AS 'Estado'
FROM carreras_urbanas
WHERE estado_participacion = 'Finalizado'
ORDER BY tiempo_segundos ASC;

-- Consulta 2: Top 3 de corredores más rápidos en la distancia de 10 kilómetros
SELECT 
    nombre_corredor AS 'Corredor',
    categoria AS 'Categoría',
    tiempo_segundos AS 'Tiempo Total (s)'
FROM carreras_urbanas
WHERE distancia_km = 10.0 AND estado_participacion = 'Finalizado'
ORDER BY tiempo_segundos ASC
LIMIT 3;

-- Consulta 3: Reporte estadístico agrupado por categoría con tiempos promedio de finalización
SELECT 
    categoria AS 'Categoría',
    COUNT(*) AS 'Total Inscritos',
    AVG(CASE WHEN tiempo_segundos > 0 THEN tiempo_segundos END) AS 'Promedio Tiempo (s)'
FROM carreras_urbanas
GROUP BY categoria;

-- Consulta 4: Filtrar participantes que se encuentran activos o en desarrollo de la carrera (En Ruta / Inscritos)
SELECT 
    id_participante AS 'Dorsal',
    nombre_corredor AS 'Corredor',
    categoria AS 'Categoría',
    distancia_km AS 'Distancia (KM)',
    estado_participacion AS 'Situación Actual'
FROM carreras_urbanas
WHERE estado_participacion IN ('Inscrito', 'En Ruta')
ORDER BY distancia_km DESC;

-- Consulta 5: Auditoría general de estados de participación en el evento deportivo
SELECT 
    estado_participacion AS 'Estado de Participación',
    COUNT(*) AS 'Cantidad de Atletas'
FROM carreras_urbanas
GROUP BY estado_participacion
ORDER BY 'Cantidad de Atletas' DESC;
