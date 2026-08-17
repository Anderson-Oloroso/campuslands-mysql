USE garaje_motos_having_db;

-- Consulta 1: Agrupar por estado operativo y filtrar con HAVING aquellos estados que tengan más de 1 moto registrada
SELECT 
    estado_operativo AS 'Estado Operativo',
    COUNT(*) AS 'Total de Motos',
    AVG(costo_mantenimiento) AS 'Costo Promedio ($)'
FROM motos_garaje
GROUP BY estado_operativo
HAVING COUNT(*) > 1
ORDER BY 'Total de Motos' DESC;

-- Consulta 2: Agrupar por marca de motocicleta y filtrar con HAVING las marcas cuyo costo total de mantenimiento supere los 100 dólares
SELECT 
    marca AS 'Marca de Moto',
    COUNT(*) AS 'Modelos Registrados',
    SUM(costo_mantenimiento) AS 'Costo Total Acumulado ($)'
FROM motos_garaje
GROUP BY marca
HAVING SUM(costo_mantenimiento) > 100.00
ORDER BY 'Costo Total Acumulado ($)' DESC;

-- Consulta 3: Agrupar por estado operativo y filtrar con HAVING los grupos cuya cilindrada promedio sea mayor a 400 cc
SELECT 
    estado_operativo AS 'Estado Operativo',
    COUNT(*) AS 'Cantidad de Motos',
    AVG(cilindrada_cc) AS 'Cilindrada Promedio (cc)'
FROM motos_garaje
GROUP BY estado_operativo
HAVING AVG(cilindrada_cc) > 400.00
ORDER BY 'Cilindrada Promedio (cc)' DESC;

-- Consulta 4: Agrupar por marca evaluando el costo máximo de mantenimiento y filtrando con HAVING los que superen los 100 dólares
SELECT 
    marca AS 'Marca',
    MAX(costo_mantenimiento) AS 'Costo Máximo de Mantenimiento ($)',
    MIN(costo_mantenimiento) AS 'Costo Mínimo de Mantenimiento ($)'
FROM motos_garaje
GROUP BY marca
HAVING MAX(costo_mantenimiento) > 100.00
ORDER BY 'Costo Máximo de Mantenimiento ($)' DESC;

-- Consulta 5: Reporte avanzado combinando WHERE y HAVING para filtrar marcas activas con costo promedio mayor a 90 dólares
SELECT 
    marca AS 'Marca',
    COUNT(*) AS 'Unidades Disponibles',
    AVG(costo_mantenimiento) AS 'Costo Promedio ($)'
FROM motos_garaje
WHERE estado_operativo != 'Fuera de Servicio'
GROUP BY marca
HAVING AVG(costo_mantenimiento) > 90.00
ORDER BY 'Costo Promedio ($)' DESC;
