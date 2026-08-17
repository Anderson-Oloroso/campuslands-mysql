USE taller_motos_basico_db;

-- Consulta 1: Listado general de todas las órdenes de reparación ordenadas por costo de mayor a menor
SELECT 
    id_reparacion AS 'ID Único',
    placa_moto AS 'Placa',
    propietario AS 'Propietario',
    modelo_moto AS 'Modelo',
    costo_servicio AS 'Costo del Servicio ($)',
    estado_reparacion AS 'Estado'
FROM taller_motos
ORDER BY costo_servicio DESC;

-- Consulta 2: Filtrar aquellas reparaciones que se encuentran activas (Pendientes o En Proceso)
SELECT 
    placa_moto AS 'Placa',
    propietario AS 'Propietario',
    modelo_moto AS 'Modelo',
    fecha_ingreso AS 'Fecha de Ingreso',
    estado_reparacion AS 'Estado Actual'
FROM taller_motos
WHERE estado_reparacion IN ('Pendiente', 'En Proceso')
ORDER BY fecha_ingreso ASC;

-- Consulta 3: Top 3 de servicios de reparación más costosos del taller
SELECT 
    propietario AS 'Propietario',
    modelo_moto AS 'Modelo de Moto',
    costo_servicio AS 'Costo Máximo ($)'
FROM taller_motos
ORDER BY costo_servicio DESC
LIMIT 3;

-- Consulta 4: Conteo y valorización total de las reparaciones agrupadas por su estado actual
SELECT 
    estado_reparacion AS 'Estado de Reparación',
    COUNT(*) AS 'Total de Órdenes',
    SUM(costo_servicio) AS 'Ingreso Acumulado ($)'
FROM taller_motos
GROUP BY estado_reparacion
ORDER BY 'Ingreso Acumulado ($)' DESC;

-- Consulta 5: Reporte analítico proyectando el costo del servicio con un recargo estimado del 12% por impuestos
SELECT 
    placa_moto AS 'Placa',
    modelo_moto AS 'Modelo',
    costo_servicio AS 'Costo Base ($)',
    ROUND(costo_servicio * 1.12, 2) AS 'Costo Total con Impuesto ($)'
FROM taller_motos
WHERE estado_reparacion != 'Entregado'
ORDER BY 'Costo Total con Impuesto ($)' DESC;
