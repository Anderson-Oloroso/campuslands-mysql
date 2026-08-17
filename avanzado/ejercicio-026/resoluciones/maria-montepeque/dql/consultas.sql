USE campuslands_mysql;

-- 1. CTE recursivo: arbol completo de habilidades, con su profundidad
-- y la ruta completa desde la raiz de su clase.
WITH RECURSIVE arbol_habilidades AS (
  SELECT id_habilidad, nombre, clase, nivel_requerido, id_habilidad_previa,
         0 AS profundidad,
         CAST(nombre AS CHAR(500)) AS ruta
  FROM habilidades_avanzado
  WHERE id_habilidad_previa IS NULL

  UNION ALL

  SELECT h.id_habilidad, h.nombre, h.clase, h.nivel_requerido, h.id_habilidad_previa,
         a.profundidad + 1,
         CONCAT(a.ruta, ' -> ', h.nombre)
  FROM habilidades_avanzado h
  INNER JOIN arbol_habilidades a ON a.id_habilidad = h.id_habilidad_previa
)
SELECT clase, profundidad, nombre, nivel_requerido, ruta
FROM arbol_habilidades
ORDER BY clase, profundidad;

-- 2. CTE recursivo: cadena de prerequisitos de una habilidad especifica,
-- subiendo hasta la raiz (recorrido ascendente, no descendente).
WITH RECURSIVE cadena_prerequisitos AS (
  SELECT id_habilidad, nombre, nivel_requerido, id_habilidad_previa, 0 AS pasos_hacia_atras
  FROM habilidades_avanzado
  WHERE nombre = 'Furia Berserker'

  UNION ALL

  SELECT h.id_habilidad, h.nombre, h.nivel_requerido, h.id_habilidad_previa, c.pasos_hacia_atras + 1
  FROM habilidades_avanzado h
  INNER JOIN cadena_prerequisitos c ON h.id_habilidad = c.id_habilidad_previa
)
SELECT nombre, nivel_requerido, pasos_hacia_atras
FROM cadena_prerequisitos
ORDER BY pasos_hacia_atras DESC;

-- 3. CTE recursivo generador de secuencia: tabla de XP requerida por
-- nivel, calculada con una formula acumulativa (no es un recorrido de
-- arbol, sino una progresion numerica).
WITH RECURSIVE tabla_experiencia AS (
  SELECT 1 AS nivel, 100 AS xp_requerida
  UNION ALL
  SELECT nivel + 1, xp_requerida + (nivel * 50)
  FROM tabla_experiencia
  WHERE nivel < 10
)
SELECT nivel, xp_requerida
FROM tabla_experiencia;

-- 4. CTE simple: cantidad de habilidades por clase
WITH resumen_por_clase AS (
  SELECT clase, COUNT(*) AS total_habilidades
  FROM habilidades_avanzado
  GROUP BY clase
)
SELECT clase, total_habilidades
FROM resumen_por_clase
ORDER BY total_habilidades DESC;

-- 5. CTE simple: habilidades finales (hojas del arbol, ninguna otra
-- habilidad las tiene como prerequisito).
WITH prerequisitos_usados AS (
  SELECT DISTINCT id_habilidad_previa AS id_habilidad
  FROM habilidades_avanzado
  WHERE id_habilidad_previa IS NOT NULL
)
SELECT h.nombre, h.clase, h.nivel_requerido
FROM habilidades_avanzado h
LEFT JOIN prerequisitos_usados p ON p.id_habilidad = h.id_habilidad
WHERE p.id_habilidad IS NULL
ORDER BY h.clase;

-- 6. Varios CTE encadenados: habilidades raiz y su cantidad de
-- descendientes directos, combinando dos CTE en una sola consulta.
WITH raices AS (
  SELECT id_habilidad, nombre, clase
  FROM habilidades_avanzado
  WHERE id_habilidad_previa IS NULL
),
descendientes_directos AS (
  SELECT id_habilidad_previa AS id_habilidad, COUNT(*) AS total_hijos
  FROM habilidades_avanzado
  WHERE id_habilidad_previa IS NOT NULL
  GROUP BY id_habilidad_previa
)
SELECT r.nombre AS habilidad_raiz, r.clase, COALESCE(d.total_hijos, 0) AS hijos_directos
FROM raices r
LEFT JOIN descendientes_directos d ON d.id_habilidad = r.id_habilidad
ORDER BY hijos_directos DESC;
