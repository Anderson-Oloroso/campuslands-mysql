USE campuslands_mysql;

-- 1. Mostrar todos los saltos registrados.
SELECT
    id_salto,
    nombre_paracaidista,
    nivel_experiencia,
    fecha_salto,
    altura_salto_metros,
    duracion_caida_segundos,
    modalidad,
    estado
FROM saltos_paracaidismo
ORDER BY fecha_salto;


-- 2. Mostrar los saltos realizados.
SELECT
    nombre_paracaidista AS paracaidista,
    nivel_experiencia AS nivel,
    fecha_salto,
    altura_salto_metros AS altura_metros,
    modalidad
FROM saltos_paracaidismo
WHERE estado = 'realizado'
ORDER BY fecha_salto;


-- 3. Mostrar los saltos de mayor altura.
SELECT
    nombre_paracaidista AS paracaidista,
    altura_salto_metros AS altura_metros,
    duracion_caida_segundos AS duracion_segundos,
    estado
FROM saltos_paracaidismo
ORDER BY altura_salto_metros DESC
LIMIT 5;


-- 4. Obtener indicadores generales de los saltos.
SELECT
    COUNT(*) AS total_saltos,
    MIN(altura_salto_metros) AS altura_minima,
    MAX(altura_salto_metros) AS altura_maxima,
    ROUND(AVG(altura_salto_metros), 2) AS altura_promedio
FROM saltos_paracaidismo;


-- 5. Verificar los registros generados automáticamente por el trigger.
SELECT
    id_auditoria,
    id_salto,
    nombre_paracaidista AS paracaidista,
    accion,
    fecha_auditoria
FROM auditoria_saltos
ORDER BY id_auditoria;