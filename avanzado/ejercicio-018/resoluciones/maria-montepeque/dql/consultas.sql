USE campuslands_mysql;

-- 1. Funciones de texto: nombre en mayusculas, correo en minusculas y
-- un codigo de reserva generado con CONCAT + SUBSTRING + LPAD
SELECT id_itinerario,
       UPPER(viajero_nombre) AS viajero,
       LOWER(viajero_email) AS email,
       CONCAT(UPPER(SUBSTRING(destino, 1, 3)), '-', LPAD(id_itinerario, 4, '0')) AS codigo_reserva
FROM itinerarios_avanzado
ORDER BY id_itinerario;

-- 2. Funciones de fecha: duracion del viaje en dias y mes de salida
SELECT id_itinerario, destino,
       DATEDIFF(fecha_regreso, fecha_salida) AS duracion_dias,
       MONTHNAME(fecha_salida) AS mes_salida
FROM itinerarios_avanzado
ORDER BY duracion_dias DESC;

-- 3. Funciones numericas: precio final redondeado tras aplicar el descuento
SELECT id_itinerario, destino, precio_base, descuento_pct,
       ROUND(precio_base * (1 - descuento_pct / 100), 2) AS precio_final
FROM itinerarios_avanzado
ORDER BY precio_final DESC;

-- 4. Funcion de agregacion + funcion de fecha: duracion promedio de todos los viajes
SELECT ROUND(AVG(DATEDIFF(fecha_regreso, fecha_salida)), 1) AS duracion_promedio_dias
FROM itinerarios_avanzado;

-- 5. Funcion de texto: dominio de correo de cada viajero con SUBSTRING_INDEX
SELECT viajero_nombre, SUBSTRING_INDEX(viajero_email, '@', -1) AS dominio_correo
FROM itinerarios_avanzado
ORDER BY dominio_correo;

-- 6. Funcion condicional CASE: clasificar el viaje segun su duracion
SELECT id_itinerario, destino,
       DATEDIFF(fecha_regreso, fecha_salida) AS duracion_dias,
       CASE
         WHEN DATEDIFF(fecha_regreso, fecha_salida) <= 3 THEN 'corto'
         WHEN DATEDIFF(fecha_regreso, fecha_salida) <= 7 THEN 'medio'
         ELSE 'largo'
       END AS tipo_viaje
FROM itinerarios_avanzado
ORDER BY duracion_dias;
