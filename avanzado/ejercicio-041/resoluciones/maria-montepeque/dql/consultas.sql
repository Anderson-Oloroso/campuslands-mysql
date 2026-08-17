USE campuslands_mysql;

-- 1. CTE recursivo: arbol completo de tecnicas, con su profundidad y
-- la ruta completa desde la raiz de su categoria.
WITH RECURSIVE arbol_tecnicas AS (
  SELECT id_tecnica, nombre, categoria, nivel_requerido, id_tecnica_previa,
         0 AS profundidad,
         CAST(nombre AS CHAR(500)) AS ruta
  FROM tecnicas_pingpong_avanzado
  WHERE id_tecnica_previa IS NULL

  UNION ALL

  SELECT t.id_tecnica, t.nombre, t.categoria, t.nivel_requerido, t.id_tecnica_previa,
         a.profundidad + 1,
         CONCAT(a.ruta, ' -> ', t.nombre)
  FROM tecnicas_pingpong_avanzado t
  INNER JOIN arbol_tecnicas a ON a.id_tecnica = t.id_tecnica_previa
)
SELECT categoria, profundidad, nombre, nivel_requerido, ruta
FROM arbol_tecnicas
ORDER BY categoria, profundidad;

-- 2. CTE recursivo: cadena de prerequisitos de una tecnica especifica,
-- subiendo hasta la raiz (recorrido ascendente, no descendente).
WITH RECURSIVE cadena_prerequisitos AS (
  SELECT id_tecnica, nombre, nivel_requerido, id_tecnica_previa, 0 AS pasos_hacia_atras
  FROM tecnicas_pingpong_avanzado
  WHERE nombre = 'Golpe Definitivo'

  UNION ALL

  SELECT t.id_tecnica, t.nombre, t.nivel_requerido, t.id_tecnica_previa, c.pasos_hacia_atras + 1
  FROM tecnicas_pingpong_avanzado t
  INNER JOIN cadena_prerequisitos c ON t.id_tecnica = c.id_tecnica_previa
)
SELECT nombre, nivel_requerido, pasos_hacia_atras
FROM cadena_prerequisitos
ORDER BY pasos_hacia_atras DESC;

-- 3. CTE recursivo generador de secuencia: puntos de entrenamiento
-- requeridos por nivel, calculados con una formula acumulativa (no es
-- un recorrido de arbol, sino una progresion numerica).
WITH RECURSIVE tabla_entrenamiento AS (
  SELECT 1 AS nivel, 100 AS puntos_requeridos
  UNION ALL
  SELECT nivel + 1, puntos_requeridos + (nivel * 50)
  FROM tabla_entrenamiento
  WHERE nivel < 10
)
SELECT nivel, puntos_requeridos
FROM tabla_entrenamiento;

-- 4. CTE simple: cantidad de tecnicas por categoria
WITH resumen_por_categoria AS (
  SELECT categoria, COUNT(*) AS total_tecnicas
  FROM tecnicas_pingpong_avanzado
  GROUP BY categoria
)
SELECT categoria, total_tecnicas
FROM resumen_por_categoria
ORDER BY total_tecnicas DESC;

-- 5. CTE simple: tecnicas finales (hojas del arbol, ninguna otra
-- tecnica las tiene como prerequisito).
WITH prerequisitos_usados AS (
  SELECT DISTINCT id_tecnica_previa AS id_tecnica
  FROM tecnicas_pingpong_avanzado
  WHERE id_tecnica_previa IS NOT NULL
)
SELECT t.nombre, t.categoria, t.nivel_requerido
FROM tecnicas_pingpong_avanzado t
LEFT JOIN prerequisitos_usados p ON p.id_tecnica = t.id_tecnica
WHERE p.id_tecnica IS NULL
ORDER BY t.categoria;

-- 6. Varios CTE encadenados: tecnicas raiz y su cantidad de
-- descendientes directos, combinando dos CTE en una sola consulta.
WITH raices AS (
  SELECT id_tecnica, nombre, categoria
  FROM tecnicas_pingpong_avanzado
  WHERE id_tecnica_previa IS NULL
),
descendientes_directos AS (
  SELECT id_tecnica_previa AS id_tecnica, COUNT(*) AS total_hijos
  FROM tecnicas_pingpong_avanzado
  WHERE id_tecnica_previa IS NOT NULL
  GROUP BY id_tecnica_previa
)
SELECT r.nombre AS tecnica_raiz, r.categoria, COALESCE(d.total_hijos, 0) AS hijos_directos
FROM raices r
LEFT JOIN descendientes_directos d ON d.id_tecnica = r.id_tecnica
ORDER BY hijos_directos DESC;
