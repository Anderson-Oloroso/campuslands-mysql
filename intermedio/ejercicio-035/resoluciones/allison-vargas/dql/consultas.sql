USE taller_motos_subconsultas_db;

-- Consulta 1: Obtener las reparaciones cuyo costo sea superior al costo promedio general del taller (Subconsulta escalar)
SELECT 
    id_reparacion AS 'ID',
    placa_moto AS 'Placa',
    propietario AS 'Propietario',
    modelo_moto AS 'Modelo',
    costo_servicio AS 'Costo del Servicio ($)'
FROM taller_motos
WHERE costo_servicio > (SELECT AVG(costo_servicio) FROM taller_motos)
ORDER BY costo_servicio DESC;

-- Consulta 2: Mostrar la orden de reparación que posee el costo más alto registrado en el taller
SELECT 
    id_reparacion AS 'ID',
    placa_moto AS 'Placa',
    propietario AS 'Propietario',
    modelo_moto AS 'Modelo',
    costo_servicio AS 'Costo Máximo ($)'
FROM taller_motos
WHERE costo_servicio = (SELECT MAX(costo_servicio) FROM taller_motos);

-- Consulta 3: Listar las motos cuyos estados coinciden con estados que tienen más de 1 orden registrada (Subconsulta con IN)
SELECT 
    placa_moto AS 'Placa',
    propietario AS 'Propietario',
    modelo_moto AS 'Modelo',
    estado_reparacion AS 'Estado'
FROM taller_motos
WHERE estado_reparacion IN (
    SELECT estado_reparacion 
    FROM taller_motos 
    GROUP BY estado_reparacion 
    HAVING COUNT(*) > 1
)
ORDER BY estado_reparacion ASC;

-- Consulta 4: Mostrar cada orden junto con la diferencia de su costo respecto al costo promedio del taller (Subconsulta en la cláusula SELECT)
SELECT 
    placa_moto AS 'Placa',
    modelo_moto AS 'Modelo',
    costo_servicio AS 'Costo del Servicio ($)',
    ROUND(costo_servicio - (SELECT AVG(costo_servicio) FROM taller_motos), 2) AS 'Diferencia vs Promedio ($)'
FROM taller_motos
ORDER BY 'Diferencia vs Promedio ($)' DESC;

-- Consulta 5: Filtrar las reparaciones cuyos costos sean menores o iguales al costo promedio de su propio estado (Subconsulta correlacionada)
SELECT 
    t1.placa_moto AS 'Placa',
    t1.modelo_moto AS 'Modelo',
    t1.estado_reparacion AS 'Estado',
    t1.costo_servicio AS 'Costo ($)'
FROM taller_motos t1
WHERE t1.costo_servicio <= (
    SELECT AVG(t2.costo_servicio) 
    FROM taller_motos t2 
    WHERE t2.estado_reparacion = t1.estado_reparacion
)
ORDER BY t1.costo_servicio ASC;
