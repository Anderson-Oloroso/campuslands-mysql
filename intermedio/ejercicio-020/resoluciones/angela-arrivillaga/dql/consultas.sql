USE estudio_tatuajes_db;

-- 1. Subconsulta escalar en el WHERE: Listar los tatuajes cuyo precio estimado sea superior al precio promedio de todos los registros del estudio
SELECT codigo_tatuaje, nombre_diseno, precio_estimado, tiempo_horas, estado_diseno
FROM tatuajes_studio
WHERE precio_estimado > (SELECT AVG(precio_estimado) FROM tatuajes_studio)
ORDER BY precio_estimado DESC;

-- 2. Subconsulta con operador IN: Consultar los tatuajes que pertenecen a estilos cuyo nombre contiene la palabra 'Blackwork' o 'Fine Line'
SELECT codigo_tatuaje, nombre_diseno, precio_estimado, tiempo_horas, estado_diseno
FROM tatuajes_studio
WHERE id_estilo IN (
    SELECT id_estilo 
    FROM estilos_tatuaje 
    WHERE nombre_estilo LIKE '%Blackwork%' OR nombre_estilo LIKE '%Fine Line%'
)
ORDER BY precio_estimado DESC;

-- 3. Subconsulta correlacionada: Listar aquellos tatuajes cuyo precio sea el más alto dentro de su respectivo estilo
SELECT t.codigo_tatuaje, t.nombre_diseno, t.precio_estimado, t.tiempo_horas
FROM tatuajes_studio t
WHERE t.precio_estimado = (
    SELECT MAX(sub.precio_estimado)
    FROM tatuajes_studio sub
    WHERE sub.id_estilo = t.id_estilo
)
ORDER BY t.precio_estimado DESC;

-- 4. Subconsulta en el FROM (Tabla derivada): Calcular el promedio de precios por estilo utilizando una tabla derivada y formateando los resultados
SELECT dt.estilo_nombre, dt.total_disenos, CONCAT('$', FORMAT(dt.precio_medio, 2)) AS precio_promedio_estilo
FROM (
    SELECT e.nombre_estilo AS estilo_nombre, COUNT(t.id_tatuaje) AS total_disenos, AVG(t.precio_estimado) AS precio_medio
    FROM estilos_tatuaje e
    LEFT JOIN tatuajes_studio t ON e.id_estilo = t.id_estilo
    GROUP BY e.id_estilo, e.nombre_estilo
) dt
ORDER BY dt.precio_medio DESC;

-- 5. Subconsulta con operador NOT IN: Identificar los estilos de tatuaje que actualmente NO tienen ningún diseño registrado en la tabla de tatuajes
SELECT id_estilo, nombre_estilo, descripcion_estilo
FROM estilos_tatuaje
WHERE id_estilo NOT IN (
    SELECT DISTINCT id_estilo 
    FROM tatuajes_studio 
    WHERE id_estilo IS NOT NULL
);