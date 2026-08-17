USE carreras_urbanas_count_sum_db;

-- Consulta 1: Contar el número total de participantes registrados utilizando COUNT(*)
SELECT 
    COUNT(*) AS 'Total de Participantes'
FROM carreras_urbanas;

-- Consulta 2: Calcular la sumatoria total de kilómetros recorridos por todos los atletas con SUM()
SELECT 
    SUM(distancia_km) AS 'Kilómetros Totales Acumulados'
FROM carreras_urbanas;

-- Consulta 3: Agrupar por categoría utilizando COUNT para conocer la cantidad de corredores y SUM para los kilómetros totales
SELECT 
    categoria AS 'Categoría',
    COUNT(*) AS 'Cantidad de Corredores',
    SUM(distancia_km) AS 'Suma de Kilómetros'
FROM carreras_urbanas
GROUP BY categoria
ORDER BY 'Cantidad de Corredores' DESC;

-- Consulta 4: Agrupar por estado de participación aplicando COUNT y SUM de tiempos acumulados en segundos
SELECT 
    estado_participacion AS 'Estado',
    COUNT(*) AS 'Total Atletas',
    SUM(tiempo_segundos) AS 'Suma de Segundos Empleados'
FROM carreras_urbanas
GROUP BY estado_participacion
ORDER BY 'Total Atletas' DESC;

-- Consulta 5: Contar y sumar exclusivamente los registros de corredores que han finalizado con éxito la carrera
SELECT 
    COUNT(id_participante) AS 'Total Finalistas',
    SUM(tiempo_segundos) AS 'Tiempo Acumulado Finalistas (s)'
FROM carreras_urbanas
WHERE estado_participacion = 'Finalizado';
