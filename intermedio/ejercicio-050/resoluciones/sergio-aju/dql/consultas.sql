USE campuslands_mysql;

-- 1. Subconsulta Escalar: Citas cuyos costos superan el promedio global de la tienda
SELECT 
    c.id AS cita_id,
    CONCAT(cli.nombre, ' ', cli.apellido) AS cliente,
    CONCAT(t.nombre, ' ', t.apellido) AS tatuador,
    e.nombre_estilo AS estilo,
    c.costo_total
FROM citas_tatuajes c
INNER JOIN clientes cli ON c.cliente_id = cli.id
INNER JOIN tatuadores t ON c.tatuador_id = t.id
INNER JOIN estilos_tatuaje e ON c.estilo_id = e.id
WHERE c.costo_total > (
    SELECT AVG(costo_total) 
    FROM citas_tatuajes 
    WHERE estado = 'Finalizada'
) AND c.estado = 'Finalizada'
ORDER BY c.costo_total DESC;

-- 2. Subconsulta en WHERE (IN / NOT IN): Clientes que han agendado sesiones en estilo "Realismo"
SELECT 
    id AS cliente_id,
    CONCAT(nombre, ' ', apellido) AS cliente,
    email,
    telefono
FROM clientes
WHERE id IN (
    SELECT DISTINCT cliente_id 
    FROM citas_tatuajes 
    WHERE estilo_id = (
        SELECT id 
        FROM estilos_tatuaje 
        WHERE nombre_estilo = 'Realismo'
    )
);

-- 3. Subconsulta Correlacionada: Tatuadores cuya tarifa por hora supera el promedio de su nivel de experiencia
SELECT 
    t.id AS tatuador_id,
    CONCAT(t.nombre, ' ', t.apellido) AS tatuador,
    t.especialidad,
    t.tarifa_hora,
    t.experiencia_anios
FROM tatuadores t
WHERE t.tarifa_hora >= (
    SELECT AVG(tarifa_hora) 
    FROM tatuadores 
    WHERE experiencia_anios >= t.experiencia_anios
);

-- 4. Subconsulta en FROM (Tabla Derivada): Resumen consolidado del total generado por tatuador con promedio de duración
SELECT 
    resumen.tatuador_nombre,
    resumen.total_sesiones,
    resumen.ingresos_totales,
    ROUND(resumen.promedio_duracion, 2) AS horas_promedio_por_cita
FROM (
    SELECT 
        CONCAT(t.nombre, ' ', t.apellido) AS tatuador_nombre,
        COUNT(c.id) AS total_sesiones,
        SUM(c.costo_total) AS ingresos_totales,
        AVG(c.duracion_horas) AS promedio_duracion
    FROM tatuadores t
    INNER JOIN citas_tatuajes c ON t.id = c.tatuador_id
    WHERE c.estado = 'Finalizada'
    GROUP BY t.id, t.nombre, t.apellido
) AS resumen
WHERE resumen.ingresos_totales > 500.00
ORDER BY resumen.ingresos_totales DESC;

-- 5. Subconsulta con NOT EXISTS: Estilos de tatuaje que NUNCA han sido solicitados en citas finalizadas
SELECT 
    e.id AS estilo_id,
    e.nombre_estilo,
    e.descripcion
FROM estilos_tatuaje e
WHERE NOT EXISTS (
    SELECT 1 
    FROM citas_tatuajes c 
    WHERE c.estilo_id = e.id AND c.estado = 'Finalizada'
);