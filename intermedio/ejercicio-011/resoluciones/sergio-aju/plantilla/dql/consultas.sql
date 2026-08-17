-- Consultas base. Completa o reemplaza segun el enunciado.
USE torneo_pingpong;

-- 1. Ver los partidos que aún están en curso
SELECT jugador_1, jugador_2, sets_j1, sets_j2 FROM partidos WHERE estado = 'en_curso';

-- 2. Contar el total de partidos ya terminados en el torneo
SELECT COUNT(id_partido) AS partidos_terminados FROM partidos WHERE estado = 'finalizado';

-- 3. Buscar las "barridas" (partidos donde el jugador 1 ganó 3 a 0)
SELECT jugador_1, jugador_2 FROM partidos WHERE sets_j1 = 3 AND sets_j2 = 0;

-- 4. Promedio de sets que logra ganar el jugador 2 en partidos finalizados
SELECT AVG(sets_j2) AS prom_sets_visitante FROM partidos WHERE estado = 'finalizado';

-- 5. Calcular la cantidad total de sets disputados sumando todos los partidos finalizados
SELECT SUM(sets_j1 + sets_j2) AS total_sets_jugados FROM partidos WHERE estado = 'finalizado';