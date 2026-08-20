USE campuslands_mysql;

-- 1. Seleccionar todos los registros ordenados por precio_persona descendentemente
SELECT paquete_id, destino, tipo_paquete, duracion_dias, precio_persona, estado
FROM paquetes_turisitcos
ORDER BY precio_persona DESC;

-- 2. Filtrar únicamente los registros en estado Activo
SELECT paquete_id, destino, tipo_paquete, precio_persona
FROM paquetes_turisitcos
WHERE estado = 'Activo';

-- 3. Agrupar por tipo_paquete y calcular total y promedio de precio_persona
SELECT tipo_paquete, COUNT(*) AS total_registros, AVG(precio_persona) AS promedio_valor
FROM paquetes_turisitcos
GROUP BY tipo_paquete
ORDER BY promedio_valor DESC;

-- 4. Filtrar por precio_persona mayor a 2000
SELECT paquete_id, destino, tipo_paquete, precio_persona
FROM paquetes_turisitcos
WHERE precio_persona > 2000.00
ORDER BY precio_persona ASC;

-- 5. Seleccionar los 5 mejores registros según precio_persona
SELECT paquete_id, destino, tipo_paquete, precio_persona
FROM paquetes_turisitcos
ORDER BY precio_persona DESC
LIMIT 5;
