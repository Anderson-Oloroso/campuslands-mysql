USE garaje_motos_db;

-- Consulta 1: Listado general de motocicletas en el garaje ordenadas por cilindrada
SELECT 
    id_moto AS 'ID Moto',
    marca AS 'Marca',
    modelo AS 'Modelo',
    cilindrada_cc AS 'Cilindrada (cc)',
    costo_mantenimiento AS 'Costo Mantenimiento ($)',
    estado_operativo AS 'Estado'
FROM motos_garaje
ORDER BY cilindrada_cc DESC;

-- Consulta 2: Actualizar el estado de una moto para disparar el Trigger AFTER UPDATE y registrar la auditoría
UPDATE motos_garaje 
SET estado_operativo = 'Disponible' 
WHERE id_moto = 3;

-- Consulta 3: Consultar la tabla de bitácora generada automáticamente por el trigger de auditoría
SELECT 
    b.id_bitacora AS 'ID Registro',
    m.marca AS 'Marca',
    m.modelo AS 'Modelo',
    b.accion AS 'Acción Realizada',
    b.detalles AS 'Detalles del Cambio',
    b.fecha_registro AS 'Fecha y Hora'
FROM bitacora_motos b
JOIN motos_garaje m ON b.id_moto = m.id_moto
ORDER BY b.fecha_registro DESC;

-- Consulta 4: Reporte estadístico agrupado por estado operativo evaluando costos y cilindrada promedio
SELECT 
    estado_operativo AS 'Estado Operativo',
    COUNT(*) AS 'Total de Motos',
    AVG(cilindrada_cc) AS 'Cilindrada Promedio (cc)',
    SUM(costo_mantenimiento) AS 'Costo Total de Mantenimiento ($)'
FROM motos_garaje
GROUP BY estado_operativo
ORDER BY 'Total de Motos' DESC;

-- Consulta 5: Top 3 de motocicletas con mayor costo de mantenimiento en el garaje
SELECT 
    marca AS 'Marca',
    modelo AS 'Modelo',
    cilindrada_cc AS 'Cilindrada (cc)',
    costo_mantenimiento AS 'Costo de Mantenimiento ($)'
FROM motos_garaje
ORDER BY costo_mantenimiento DESC
LIMIT 3;
