-- DQL: Consultas analíticas y comandos de verificación de Backup Lógico (mysqldump)
USE campuslands_mysql;

-- 1. Reporte general de vehículos con pilotos y categoría
SELECT 
    v.vehiculo_id,
    p.nombre_piloto,
    p.apodo,
    v.marca,
    v.modelo,
    v.caballos_fuerza,
    v.categoria
FROM vehiculos_carreras v
INNER JOIN pilotos_carreras p ON v.piloto_id = p.piloto_id
ORDER BY v.caballos_fuerza DESC;

-- 2. Ranking de pilotos por total de puntos acumulados en el campeonato
SELECT 
    p.nombre_piloto,
    p.apodo,
    COUNT(r.resultado_id) AS carreras_disputadas,
    SUM(r.puntos_obtenidos) AS total_puntos
FROM pilotos_carreras p
INNER JOIN vehiculos_carreras v ON p.piloto_id = v.piloto_id
INNER JOIN resultados_carreras r ON v.vehiculo_id = r.vehiculo_id
GROUP BY p.piloto_id, p.nombre_piloto, p.apodo
ORDER BY total_puntos DESC;

-- 3. Promedio de potencia (HP) agrupado por categoría de vehículo
SELECT 
    categoria,
    COUNT(vehiculo_id) AS total_vehiculos,
    ROUND(AVG(caballos_fuerza), 2) AS potencia_promedio_hp
FROM vehiculos_carreras
GROUP BY categoria;

-- 4. Tiempos más rápidos por circuito (Pole Positions)
SELECT 
    r.circuito,
    p.apodo AS piloto_ganador,
    CONCAT(v.marca, ' ', v.modelo) AS vehiculo,
    MIN(r.tiempo_segundos) AS mejor_tiempo_seg
FROM resultados_carreras r
INNER JOIN vehiculos_carreras v ON r.vehiculo_id = v.vehiculo_id
INNER JOIN pilotos_carreras p ON v.piloto_id = p.piloto_id
GROUP BY r.circuito, p.apodo, v.marca, v.modelo;

-- 5. Consulta de verificación del esquema y metadatos de las tablas
SELECT 
    table_name AS tabla,
    table_rows AS registros_estimados,
    data_length AS tamano_datos_bytes
FROM information_schema.tables
WHERE table_schema = 'campuslands_mysql' 
  AND table_name LIKE '%carreras%';

/* 
   ========================================================================
   GUÍA DE COMANDOS DE BACKUP LÓGICO Y RESTAURACIÓN (mysqldump):
   ========================================================================
   1. Generar Backup Lógico completo (Estructura + Datos):
      mysqldump -u root -p --routines --triggers campuslands_mysql > backup_carreras_urbanas.sql

   2. Generar Backup únicamente de la Estructura (DDL):
      mysqldump -u root -p --no-data campuslands_mysql > backup_estructura.sql

   3. Restaurar Backup Lógico:
      mysql -u root -p campuslands_mysql < backup_carreras_urbanas.sql
   ========================================================================
*/
