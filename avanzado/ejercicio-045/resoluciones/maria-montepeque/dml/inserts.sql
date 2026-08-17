-- Datos de practica: 5000 registros de actividad sinteticos, generados
-- con un CTE recursivo, repartidos entre 5 usuarios de una biblioteca
-- gamer. Se necesita este volumen (mucho mas que los ~8 registros
-- tipicos de otros ejercicios) para que el optimizador de MySQL tenga
-- motivos reales para preferir un indice sobre un escaneo completo:
-- con pocas filas, MySQL casi siempre prefiere el escaneo completo.
USE campuslands_mysql;

INSERT INTO actividad_biblioteca_avanzado (usuario, juego, tipo_actividad, fecha)
WITH RECURSIVE numeros AS (
  SELECT 1 AS n
  UNION ALL
  SELECT n + 1 FROM numeros WHERE n < 1000
)
SELECT
  ELT(1 + ((n + m.mult) % 5), 'NightOwlGamer', 'PixelQueen', 'RetroArcadeFan', 'CodeAndPlay', 'LunaGamerPro') AS usuario,
  CONCAT('juego_', 1 + ((n * m.mult) % 40)) AS juego,
  ELT(1 + ((n * m.mult) % 4), 'inicio_sesion', 'logro_desbloqueado', 'compra', 'resena') AS tipo_actividad,
  DATE_ADD('2026-01-01 00:00:00', INTERVAL (n * 5 + m.mult) MINUTE) AS fecha
FROM numeros
CROSS JOIN (SELECT 1 AS mult UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5) AS m;
