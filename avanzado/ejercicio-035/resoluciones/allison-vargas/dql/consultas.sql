USE taller_motos_indices_db;

-- Consulta 1: Búsqueda optimizada por placa de motocicleta utilizando el índice idx_placa
SELECT 
    id_reparacion AS 'ID',
    placa_moto AS 'Placa',
    propietario AS 'Propietario',
    modelo_moto AS 'Modelo',
    estado_reparacion AS 'Estado'
FROM taller_motos
WHERE placa_moto = 'M-404GHI';

-- Consulta 2: Filtrado por estado operativo aprovechando el índice idx_estado para agilizar el reporte
SELECT 
    placa_moto AS 'Placa',
    propietario AS 'Propietario',
    modelo_moto AS 'Modelo',
    costo_servicio AS 'Costo del Servicio ($)',
    estado_reparacion AS 'Estado'
FROM taller_motos
WHERE estado_reparacion IN ('En Proceso', 'Pendiente')
ORDER BY costo_servicio DESC;

-- Consulta 3: Filtrado por rango de fechas utilizando el índice idx_fecha
SELECT 
    id_reparacion AS 'ID',
    placa_moto AS 'Placa',
    fecha_ingreso AS 'Fecha de Ingreso',
    costo_servicio AS 'Costo ($)'
FROM taller_motos
WHERE fecha_ingreso BETWEEN '2026-07-01' AND '2026-07-15'
ORDER BY fecha_ingreso ASC;

-- Consulta 4: Conteo y valorización total agrupados por estado de reparación (Uso eficiente de índices y agregación)
SELECT 
    estado_reparacion AS 'Estado de Reparación',
    COUNT(*) AS 'Total de Órdenes',
    SUM(costo_servicio) AS 'Ingreso Acumulado ($)'
FROM taller_motos
GROUP BY estado_reparacion
ORDER BY 'Ingreso Acumulado ($)' DESC;

-- Consulta 5: Top 3 de servicios con mayor costo en el taller mecánico
SELECT 
    propietario AS 'Propietario',
    modelo_moto AS 'Modelo de Moto',
    costo_servicio AS 'Costo del Servicio ($)',
    estado_reparacion AS 'Estado'
FROM taller_motos
ORDER BY costo_servicio DESC
LIMIT 3;
