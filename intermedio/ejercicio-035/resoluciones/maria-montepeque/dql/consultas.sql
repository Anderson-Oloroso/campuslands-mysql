USE campuslands_mysql;

-- 1. Citas con costo mayor al promedio general (subconsulta escalar)
SELECT id_cita, mecanico, tipo_servicio, costo
FROM citas_taller_intermedio
WHERE costo > (SELECT AVG(costo) FROM citas_taller_intermedio)
ORDER BY costo DESC;

-- 2. Citas mas caras que el promedio de su propio tipo de servicio (correlacionada)
SELECT c1.id_cita, c1.tipo_servicio, c1.costo
FROM citas_taller_intermedio c1
WHERE c1.costo > (
  SELECT AVG(c2.costo)
  FROM citas_taller_intermedio c2
  WHERE c2.tipo_servicio = c1.tipo_servicio
)
ORDER BY c1.tipo_servicio;

-- 3. Clientes con al menos una cita realizada (EXISTS)
SELECT nombre, ciudad
FROM clientes_taller_intermedio cl
WHERE EXISTS (
  SELECT 1 FROM citas_taller_intermedio ci
  WHERE ci.id_cliente = cl.id_cliente AND ci.estado = 'realizada'
);

-- 4. Clientes que nunca han agendado ninguna cita (NOT EXISTS)
SELECT nombre, ciudad
FROM clientes_taller_intermedio cl
WHERE NOT EXISTS (
  SELECT 1 FROM citas_taller_intermedio ci
  WHERE ci.id_cliente = cl.id_cliente
);

-- 5. Mecanico con mayor ingreso en citas realizadas (subconsulta en el FROM)
SELECT mecanico, ingreso_total
FROM (
  SELECT mecanico, SUM(costo) AS ingreso_total
  FROM citas_taller_intermedio
  WHERE estado = 'realizada'
  GROUP BY mecanico
) AS resumen_mecanicos
ORDER BY ingreso_total DESC
LIMIT 1;

-- 6. Cita mas cara registrada por cada tipo de servicio (correlacionada con MAX)
SELECT c.id_cita, c.tipo_servicio, c.costo
FROM citas_taller_intermedio c
WHERE c.costo = (
  SELECT MAX(c2.costo)
  FROM citas_taller_intermedio c2
  WHERE c2.tipo_servicio = c.tipo_servicio
)
ORDER BY c.tipo_servicio;
