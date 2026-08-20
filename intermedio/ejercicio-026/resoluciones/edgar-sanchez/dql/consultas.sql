-- Consultas base. Completa o reemplaza segun el enunciado.
USE campuslands_mysql;

SELECT 
    p.personaje_id,
    p.nombre_personaje,
    j.username AS propietario,
    c.nombre_clase,
    c.rol_principal,
    p.nivel,
    p.puntos_vida_max,
    p.puntos_mana_max,
    p.oro_acumulado
FROM personajes_rpg p
INNER JOIN jugadores_rpg j ON p.jugador_id = j.jugador_id
INNER JOIN clases_personaje c ON p.clase_id = c.clase_id
WHERE p.nivel >= 30 AND p.oro_acumulado > 5000.00
ORDER BY p.nivel DESC;

SELECT 
    p.nombre_personaje,
    c.nombre_clase,
    e.nombre_item,
    e.tipo_slot,
    e.raridad,
    e.nivel_requerido,
    e.ataque_base,
    e.defensa_base
FROM equipamiento_personaje e
INNER JOIN personajes_rpg p ON e.personaje_id = p.personaje_id
INNER JOIN clases_personaje c ON p.clase_id = c.clase_id
WHERE e.raridad IN ('Épico', 'Legendario', 'Mítico')
ORDER BY e.nivel_requerido DESC;