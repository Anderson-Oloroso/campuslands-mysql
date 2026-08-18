USE campuslands_mysql;

-- 1. Consultar todos los viajes mostrando el precio final.
SELECT
    id_viaje,
    destino,
    pais,
    fecha_salida,
    duracion_dias,
    precio_base,
    descuento_porcentaje,
    fn_calcular_precio_final(
        precio_base,
        descuento_porcentaje
    ) AS precio_final,
    estado
FROM viajes
ORDER BY fecha_salida;


-- 2. Mostrar los viajes disponibles ordenados por precio final.
SELECT
    destino,
    pais,
    duracion_dias,
    precio_base,
    descuento_porcentaje,
    fn_calcular_precio_final(
        precio_base,
        descuento_porcentaje
    ) AS precio_final
FROM viajes
WHERE estado = 'disponible'
ORDER BY precio_final ASC;


-- 3. Obtener los viajes cuyo precio final sea superior a 1000.
SELECT
    destino,
    pais,
    precio_base,
    descuento_porcentaje,
    fn_calcular_precio_final(
        precio_base,
        descuento_porcentaje
    ) AS precio_final
FROM viajes
WHERE fn_calcular_precio_final(
    precio_base,
    descuento_porcentaje
) > 1000
ORDER BY precio_final DESC;


-- 4. Calcular el precio final promedio de todos los viajes.
SELECT
    COUNT(*) AS total_viajes,
    ROUND(
        AVG(
            fn_calcular_precio_final(
                precio_base,
                descuento_porcentaje
            )
        ),
        2
    ) AS precio_final_promedio
FROM viajes;


-- 5. Mostrar el viaje con el menor precio final.
SELECT
    destino,
    pais,
    duracion_dias,
    fn_calcular_precio_final(
        precio_base,
        descuento_porcentaje
    ) AS precio_final
FROM viajes
ORDER BY precio_final ASC
LIMIT 1;