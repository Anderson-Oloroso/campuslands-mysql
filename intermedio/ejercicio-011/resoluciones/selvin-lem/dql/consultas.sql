-- Consultas para practicar CHECK y filtros basicos sobre partidos_pingpong.
USE campuslands_mysql;

-- 1. Listado completo ordenado por fecha
SELECT * FROM partidos_pingpong
ORDER BY fecha_partido;

-- 2. Ganador de cada partido usando CASE
SELECT id, jugador_local, jugador_visitante, sets_local, sets_visitante,
       CASE WHEN sets_local > sets_visitante THEN jugador_local ELSE jugador_visitante END AS ganador
FROM partidos_pingpong
ORDER BY id;

-- 3. Partidos cerrados (diferencia de un solo set)
SELECT * FROM partidos_pingpong
WHERE ABS(sets_local - sets_visitante) = 1
ORDER BY fecha_partido;

-- 4. Cantidad de victorias por jugador (como local o visitante)
SELECT jugador, COUNT(*) AS victorias FROM (
  SELECT jugador_local AS jugador FROM partidos_pingpong WHERE sets_local > sets_visitante
  UNION ALL
  SELECT jugador_visitante AS jugador FROM partidos_pingpong WHERE sets_visitante > sets_local
) AS ganadores
GROUP BY jugador
ORDER BY victorias DESC;

-- 5. Verificacion de la restriccion CHECK: intentar un empate debe fallar
-- (descomentar para probar el error 3819 de MySQL por violacion de CHECK)
-- INSERT INTO partidos_pingpong (jugador_local, jugador_visitante, sets_local, sets_visitante, sede, fecha_partido)
-- VALUES ('Carlos Rios', 'Luis Perez', 2, 2, 'Mesa 1', '2025-01-15');
