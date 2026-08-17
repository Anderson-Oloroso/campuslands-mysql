-- DQL: Ejercicios utilizando subconsultas en MySQL
USE campuslands_mysql;

-- 1. Subconsulta en WHERE: Citas completadas con monto superior al promedio general
SELECT 
    codigo_cita,
    cliente_nombre,
    estilo,
    monto_total
FROM citas_subconsultas
WHERE estado = 'completada' 
  AND monto_total > (SELECT AVG(monto_total) FROM citas_subconsultas WHERE estado = 'completada')
ORDER BY monto_total DESC;

-- 2. Subconsulta con IN: Tatuadores que han atendido citas de estilo 'realismo' o 'blackwork'
SELECT 
    codigo_tatuador,
    nombre,
    especialidad,
    tarifa_hora
FROM tatuadores_subconsultas
WHERE tatuador_id IN (
    SELECT DISTINCT tatuador_id 
    FROM citas_subconsultas 
    WHERE estilo IN ('realismo', 'blackwork')
);

-- 3. Subconsulta escalar en SELECT: Porcentaje de aporte de cada cita completada respecto al total facturado
SELECT 
    codigo_cita,
    cliente_nombre,
    monto_total,
    ROUND((monto_total / (SELECT SUM(monto_total) FROM citas_subconsultas WHERE estado = 'completada')) * 100, 2) AS porcentaje_del_total
FROM citas_subconsultas
WHERE estado = 'completada'
ORDER BY porcentaje_del_total DESC;

-- 4. Subconsulta en FROM (Tabla derivada): Promedio de montos por tatuador analizando únicamente completadas
SELECT 
    resumen.tatuador_nombre,
    resumen.total_citas,
    ROUND(resumen.promedio_monto, 2) AS ticket_promedio
FROM (
    SELECT 
        t.nombre AS tatuador_nombre,
        COUNT(c.cita_id) AS total_citas,
        AVG(c.monto_total) AS promedio_monto
    FROM tatuadores_subconsultas t
    JOIN citas_subconsultas c ON t.tatuador_id = c.tatuador_id
    WHERE c.estado = 'completada'
    GROUP BY t.nombre
) AS resumen
WHERE resumen.promedio_monto > 150.00;

-- 5. Subconsulta correlacionada con EXISTS: Tatuadores que no tienen citas canceladas
SELECT 
    t.codigo_tatuador,
    t.nombre,
    t.especialidad
FROM tatuadores_subconsultas t
WHERE NOT EXISTS (
    SELECT 1 
    FROM citas_subconsultas c 
    WHERE c.tatuador_id = t.tatuador_id AND c.estado = 'cancelada'
);
