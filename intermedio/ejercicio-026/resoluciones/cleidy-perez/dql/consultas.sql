-- Consultas base. Completa o reemplaza segun el enunciado.
SELECT 
    codigo,
    titulo,
    dificultad,
    tematica,
    recompensa_exp
FROM ejercicios
WHERE tematica = 'videojuego RPG'
ORDER BY recompensa_exp DESC;

-- Esta consulta dará ERROR en MySQL porque violaría el CHECK (puntos_vida_actual <= puntos_vida_max):
INSERT INTO personajes (nombre_jugador, id_clase, nivel, puntos_vida_actual, puntos_vida_max, mana_actual, mana_max)
VALUES ('HackerPlayer', 1, 10, 9999, 100, 50, 50);