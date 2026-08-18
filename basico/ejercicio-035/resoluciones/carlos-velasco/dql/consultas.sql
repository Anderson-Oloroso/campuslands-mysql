USE campuslands_mysql;

-- 1. Mostrar todos los servicios registrados.
SELECT
    id_servicio,
    cliente,
    marca_moto,
    modelo_moto,
    tipo_servicio,
    costo,
    fecha_servicio,
    estado
FROM servicios_mecanicos
ORDER BY id_servicio;


-- 2. Mostrar los servicios finalizados.
SELECT
    cliente,
    marca_moto,
    modelo_moto,
    tipo_servicio,
    costo
FROM servicios_mecanicos
WHERE estado = 'finalizado'
ORDER BY fecha_servicio DESC;


-- 3. Mostrar servicios cuyo costo sea superior a 200.
SELECT
    cliente,
    marca_moto,
    tipo_servicio,
    costo
FROM servicios_mecanicos
WHERE costo > 200
ORDER BY costo DESC;


-- 4. Mostrar los servicios realizados a motos Yamaha u Honda.
SELECT
    cliente,
    marca_moto,
    modelo_moto,
    tipo_servicio,
    costo
FROM servicios_mecanicos
WHERE marca_moto IN ('Yamaha', 'Honda')
ORDER BY marca_moto ASC, costo DESC;


-- 5. Mostrar los cinco servicios más costosos.
SELECT
    cliente,
    marca_moto,
    modelo_moto,
    tipo_servicio,
    costo
FROM servicios_mecanicos
ORDER BY costo DESC
LIMIT 5;


-- 6. Obtener indicadores generales de los servicios.
SELECT
    COUNT(*) AS total_servicios,
    ROUND(SUM(costo), 2) AS ingresos_totales,
    ROUND(AVG(costo), 2) AS costo_promedio
FROM servicios_mecanicos;