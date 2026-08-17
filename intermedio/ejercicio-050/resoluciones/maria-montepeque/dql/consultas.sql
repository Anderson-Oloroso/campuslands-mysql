USE campuslands_mysql;

-- 1. Citas con costo mayor al promedio general (subconsulta escalar)
SELECT id_cita, tatuador, estilo, costo
FROM citas_estudio_intermedio
WHERE costo > (SELECT AVG(costo) FROM citas_estudio_intermedio)
ORDER BY costo DESC;

-- 2. Citas mas caras que el promedio de su propio estilo (correlacionada)
SELECT c1.id_cita, c1.estilo, c1.costo
FROM citas_estudio_intermedio c1
WHERE c1.costo > (
  SELECT AVG(c2.costo)
  FROM citas_estudio_intermedio c2
  WHERE c2.estilo = c1.estilo
)
ORDER BY c1.estilo;

-- 3. Clientes con al menos una cita realizada (EXISTS)
SELECT nombre, ciudad
FROM clientes_estudio_intermedio cl
WHERE EXISTS (
  SELECT 1 FROM citas_estudio_intermedio ci
  WHERE ci.id_cliente = cl.id_cliente AND ci.estado = 'realizada'
);

-- 4. Clientes que nunca han agendado ninguna cita (NOT EXISTS)
SELECT nombre, ciudad
FROM clientes_estudio_intermedio cl
WHERE NOT EXISTS (
  SELECT 1 FROM citas_estudio_intermedio ci
  WHERE ci.id_cliente = cl.id_cliente
);

-- 5. Tatuador con mayor ingreso en citas realizadas (subconsulta en el FROM)
SELECT tatuador, ingreso_total
FROM (
  SELECT tatuador, SUM(costo) AS ingreso_total
  FROM citas_estudio_intermedio
  WHERE estado = 'realizada'
  GROUP BY tatuador
) AS resumen_tatuadores
ORDER BY ingreso_total DESC
LIMIT 1;

-- 6. Cita mas cara registrada por cada estilo (correlacionada con MAX)
SELECT c.id_cita, c.estilo, c.costo
FROM citas_estudio_intermedio c
WHERE c.costo = (
  SELECT MAX(c2.costo)
  FROM citas_estudio_intermedio c2
  WHERE c2.estilo = c.estilo
)
ORDER BY c.estilo;
