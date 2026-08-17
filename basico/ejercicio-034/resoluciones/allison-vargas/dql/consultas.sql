USE garaje_motos_basico_db;

-- Consulta 1: Listado general de todas las motocicletas registradas ordenadas por cilindrada
SELECT 
    id_moto AS 'ID Moto',
    marca AS 'Marca',
    modelo AS 'Modelo',
    cilindrada_cc AS 'Cilindrada (cc)',
    estado_operativo AS 'Estado'
FROM motos_garaje
ORDER BY cilindrada_cc DESC;

-- Consulta 2: Filtrar motocicletas que se encuentran disponibles para uso en el garaje
SELECT 
    marca AS 'Marca',
    modelo AS 'Modelo',
    cilindrada_cc AS 'Cilindrada (cc)',
    costo_mantenimiento AS 'Costo Mantenimiento ($)'
FROM motos_garaje
WHERE estado_operativo = 'Disponible'
ORDER BY costo_mantenimiento ASC;

-- Consulta 3: Top 3 de motocicletas con mayor cilindrada en el garaje (Ranking de potencia)
SELECT 
    marca AS 'Marca',
    modelo AS 'Modelo',
    cilindrada_cc AS 'Cilindrada Máxima (cc)'
FROM motos_garaje
ORDER BY cilindrada_cc DESC
LIMIT 3;

-- Consulta 4: Conteo y costo total de mantenimiento agrupados por estado operativo
SELECT 
    estado_operativo AS 'Estado Operativo',
    COUNT(*) AS 'Total de Motos',
    SUM(costo_mantenimiento) AS 'Costo Acumulado ($)'
FROM motos_garaje
GROUP BY estado_operativo
ORDER BY 'Costo Acumulado ($)' DESC;

-- Consulta 5: Reporte analítico calculando el costo estimado de mantenimiento por cada 100 cc de cilindrada
SELECT 
    marca AS 'Marca',
    modelo AS 'Modelo',
    cilindrada_cc AS 'Cilindrada',
    costo_mantenimiento AS 'Costo',
    ROUND((costo_mantenimiento / cilindrada_cc) * 100, 2) AS 'Costo por cada 100 cc'
FROM motos_garaje
WHERE estado_operativo != 'Fuera de Servicio'
ORDER BY 'Costo por cada 100 cc' DESC;
