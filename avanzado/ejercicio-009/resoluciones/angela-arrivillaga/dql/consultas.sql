USE kickboxing_bloqueos;

-- 1. Demostracion de bloqueo de tabla con transaccion y SELECT ... FOR UPDATE
START TRANSACTION;
SELECT * FROM combates WHERE id_combate = 3 FOR UPDATE;
COMMIT;

-- 2. Conteo de bloqueos registrados por cada tipo de tecnica
SELECT t.nombre_bloqueo, t.zona_afectada, COUNT(r.id_registro) AS total_ejecuciones
FROM tipos_bloqueo t
LEFT JOIN registro_bloqueos r ON t.id_tipo = r.id_tipo
GROUP BY t.id_tipo, t.nombre_bloqueo, t.zona_afectada
ORDER BY total_ejecuciones DESC;

-- 3. Porcentaje de efectividad de los bloqueos por luchador
SELECT luchador_ejecutor, 
       COUNT(*) AS total_intentos,
       SUM(CASE WHEN exitoso = TRUE THEN 1 ELSE 0 END) AS exitosos,
       ROUND((SUM(CASE WHEN exitoso = TRUE THEN 1 ELSE 0 END) / COUNT(*)) * 100, 2) AS porcentaje_efectividad
FROM registro_bloqueos
GROUP BY luchador_ejecutor;

-- 4. Tipos de bloqueo con dificultad avanzada o intermedia que han sido utilizados
SELECT DISTINCT t.nombre_bloqueo, t.nivel_dificultad, t.zona_afectada
FROM tipos_bloqueo t
JOIN registro_bloqueos r ON t.id_tipo = r.id_tipo
WHERE t.nivel_dificultad IN ('intermedio', 'avanzado');

-- 5. Combates que registran mas de un intento de bloqueo fallido
SELECT c.id_combate, c.luchador_azul, c.luchador_rojo, COUNT(r.id_registro) AS bloqueos_fallidos
FROM combates c
JOIN registro_bloqueos r ON c.id_combate = r.id_combate
WHERE r.exitoso = FALSE
GROUP BY c.id_combate, c.luchador_azul, c.luchador_rojo
HAVING bloqueos_fallidos >= 1;