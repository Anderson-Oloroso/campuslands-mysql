-- DQL: Consultas relacionales y validación de unicidad en registros de competencia
USE campuslands_mysql;

-- 1. Listado completo de vehículos con su escuderia, número de competencia y VIN único
SELECT 
    a.auto_id,
    e.nombre_escuderia,
    a.numero_competencia,
    a.modelo,
    a.numero_vin,
    a.potencia_hp,
    a.estado
FROM autos_carreras a
INNER JOIN escuderias_carreras e ON a.escuderia_id = e.escuderia_id
ORDER BY a.numero_competencia ASC;

-- 2. Conteo de vehículos y promedio de potencia agrupado por escudería
SELECT 
    e.nombre_escuderia,
    e.codigo_escuderia,
    COUNT(a.auto_id) AS total_vehiculos,
    ROUND(AVG(a.potencia_hp), 2) AS potencia_promedio_hp
FROM escuderias_carreras e
LEFT JOIN autos_carreras a ON e.escuderia_id = a.escuderia_id
GROUP BY e.escuderia_id, e.nombre_escuderia, e.codigo_escuderia;

-- 3. Búsqueda directa por número de competencia único
SELECT 
    a.numero_competencia,
    a.modelo,
    a.potencia_hp,
    e.nombre_escuderia,
    e.patrocinador_principal
FROM autos_carreras a
INNER JOIN escuderias_carreras e ON a.escuderia_id = e.escuderia_id
WHERE a.numero_competencia = 99;

-- 4. Vehículos con mayor potencia registrados por escudería
SELECT 
    a.modelo,
    a.potencia_hp,
    a.numero_competencia,
    e.nombre_escuderia
FROM autos_carreras a
INNER JOIN escuderias_carreras e ON a.escuderia_id = e.escuderia_id
WHERE a.estado = 'listo'
ORDER BY a.potencia_hp DESC
LIMIT 3;

-- 5. Verificación de distribución de vehículos por estado técnico
SELECT 
    estado,
    COUNT(*) AS total
FROM autos_carreras
GROUP BY estado;
