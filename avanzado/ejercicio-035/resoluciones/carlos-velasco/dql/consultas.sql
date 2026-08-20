USE campuslands_mysql;

-- 1. Consultar los servicios registrados actualmente
SELECT
    id_servicio,
    placa,
    marca,
    modelo,
    tipo_servicio,
    fecha_ingreso,
    estado,
    costo
FROM servicios_mecanicos
ORDER BY fecha_ingreso DESC;


-- 2. Buscar servicios de una motocicleta específica
SELECT
    id_servicio,
    placa,
    marca,
    modelo,
    tipo_servicio,
    estado,
    costo
FROM servicios_mecanicos
WHERE placa = 'MTA101';


-- 3. Consultar las motocicletas que tienen servicios pendientes
SELECT
    id_servicio,
    placa,
    marca,
    modelo,
    tipo_servicio,
    fecha_ingreso,
    costo
FROM servicios_mecanicos
WHERE estado = 'pendiente'
ORDER BY fecha_ingreso ASC;


-- 4. Consultar servicios en proceso
SELECT
    id_servicio,
    placa,
    marca,
    modelo,
    tipo_servicio,
    fecha_ingreso,
    costo
FROM servicios_mecanicos
WHERE estado = 'en_proceso'
ORDER BY costo DESC;


-- 5. Obtener indicadores económicos del taller
SELECT
    COUNT(*) AS total_servicios,
    SUM(costo) AS ingresos_proyectados,
    AVG(costo) AS costo_promedio,
    MAX(costo) AS servicio_mas_costoso,
    MIN(costo) AS servicio_menos_costoso
FROM servicios_mecanicos;


-- 6. Mostrar cantidad y costo promedio por estado
SELECT
    estado,
    COUNT(*) AS total_servicios,
    AVG(costo) AS costo_promedio
FROM servicios_mecanicos
GROUP BY estado
ORDER BY costo_promedio DESC;


-- 7. Verificar los índices creados en la tabla
SHOW INDEX FROM servicios_mecanicos;

-- Verificar el posible uso del índice de placa
EXPLAIN
SELECT
    id_servicio,
    placa,
    marca,
    modelo,
    tipo_servicio,
    estado,
    costo
FROM servicios_mecanicos
WHERE placa = 'MTA101';

-- Verificar el posible uso del índice de estado
EXPLAIN
SELECT
    id_servicio,
    placa,
    marca,
    modelo,
    estado,
    costo
FROM servicios_mecanicos
WHERE estado = 'pendiente';

-- Verificar el posible uso del índice de fecha
EXPLAIN
SELECT
    id_servicio,
    placa,
    tipo_servicio,
    fecha_ingreso,
    estado
FROM servicios_mecanicos
WHERE fecha_ingreso >= '2026-07-08';