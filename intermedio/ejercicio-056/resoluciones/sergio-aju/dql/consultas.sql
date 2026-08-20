USE campuslands_mysql;

-- 1. Ranking Top 5 Personajes por Potencial Combativo (Nivel + Fuerza/Agilidad/Inteligencia)
SELECT 
    p.nombre_jugador,
    c.nombre_clase,
    p.nivel,
    (p.fuerza + p.agilidad + p.inteligencia) AS total_atributos_base,
    p.probabilidad_critico,
    p.estado
FROM personajes p
INNER JOIN clases_rpg c ON p.clase_id = c.id
WHERE p.estado != 'Baneado'
ORDER BY p.nivel DESC, total_atributos_base DESC
LIMIT 5;

-- 2. Reporte de Salud y Maná en Porcentaje con Estado Físico
SELECT 
    p.nombre_jugador,
    c.nombre_clase,
    p.puntos_vida_actual,
    p.puntos_vida_max,
    ROUND((p.puntos_vida_actual / p.puntos_vida_max) * 100, 2) AS porcentaje_salud,
    p.puntos_mana_actual,
    p.puntos_mana_max,
    ROUND((p.puntos_mana_actual / p.puntos_mana_max) * 100, 2) AS porcentaje_mana,
    p.estado
FROM personajes p
INNER JOIN clases_rpg c ON p.clase_id = c.id
ORDER BY porcentaje_salud ASC;

-- 3. Análisis de Economía: Valor Total del Inventario de Equipamiento por Jugador
SELECT 
    p.nombre_jugador,
    p.oro_acumulado AS oro_en_bolsa,
    COUNT(inv.equipamiento_id) AS items_distintos,
    SUM(inv.cantidad) AS total_objetos_poseidos,
    IFNULL(SUM(e.precio_tienda * inv.cantidad), 0.00) AS valor_inventario_oro,
    (p.oro_acumulado + IFNULL(SUM(e.precio_tienda * inv.cantidad), 0.00)) AS patrimonio_neto
FROM personajes p
LEFT JOIN inventario_personaje inv ON p.id = inv.personaje_id
LEFT JOIN equipamiento e ON inv.equipamiento_id = e.id
GROUP BY p.id, p.nombre_jugador, p.oro_acumulado
ORDER BY patrimonio_neto DESC;

-- 4. Búsqueda de Equipamiento Legendario/Mítico que el personaje 'Aron_Kael' puede usar según su nivel
SELECT 
    p.nombre_jugador,
    p.nivel AS nivel_personaje,
    e.nombre_item,
    e.rareza,
    e.nivel_requerido,
    e.bono_ataque,
    e.bono_defensa,
    e.precio_tienda
FROM personajes p
CROSS JOIN equipamiento e
WHERE p.nombre_jugador = 'Aron_Kael'
  AND e.rareza IN ('Épico', 'Legendario', 'Mítico')
  AND p.nivel >= e.nivel_requerido
ORDER BY e.nivel_requerido DESC;

-- 5. Métricas de Balance por Clase de Personaje
SELECT 
    c.nombre_clase,
    c.rol,
    COUNT(p.id) AS cantidad_personajes,
    ROUND(AVG(p.nivel), 1) AS nivel_promedio,
    ROUND(AVG(p.puntos_vida_max), 0) AS hp_max_promedio,
    ROUND(AVG(p.puntos_mana_max), 0) AS mana_max_promedio,
    ROUND(AVG(p.probabilidad_critico), 2) AS critico_promedio
FROM clases_rpg c
LEFT JOIN personajes p ON c.id = p.clase_id
GROUP BY c.id, c.nombre_clase, c.rol
ORDER BY cantidad_personajes DESC;