WITH RECURSIVE CadenaMisiones CTE AS (
    SELECT 
        mision_id,
        mision_padre_id,
        titulo_mision,
        nivel_requerido,
        recompensa_oro,
        recompensa_xp,
        1 AS paso_cadena,
        CAST(titulo_mision AS CHAR(500)) AS ruta_misiones
    FROM misiones_rpg
    WHERE mision_padre_id IS NULL

    UNION ALL

    SELECT 
        m.mision_id,
        m.mision_padre_id,
        m.titulo_mision,
        m.nivel_requerido,
        m.recompensa_oro,
        m.recompensa_xp,
        c.paso_cadena + 1 AS paso_cadena,
        CONCAT(c.ruta_misiones, ' -> ', m.titulo_mision) AS ruta_misiones
    FROM misiones_rpg m
    INNER JOIN CadenaMisiones CTE c ON m.mision_padre_id = c.mision_id
)
SELECT 
    mision_id,
    titulo_mision,
    paso_cadena,
    nivel_requerido,
    recompensa_oro,
    recompensa_xp,
    ruta_misiones
FROM CadenaMisiones CTE
ORDER BY paso_cadena ASC, mision_id ASC;

WITH ValorInventario CTE AS (
    SELECT 
        inv.jugador_id,
        COUNT(DISTINCT inv.item_id) AS items_distintos,
        SUM(inv.cantidad) AS total_objetos,
        SUM(inv.cantidad * it.valor_oro) AS valor_total_inventario
    FROM inventario_jugadores inv
    INNER JOIN items_juego it ON inv.item_id = it.item_id
    GROUP BY inv.jugador_id
),
MisionesJugador CTE AS (
    SELECT 
        mc.jugador_id,
        COUNT(mc.mision_id) AS total_misiones_completadas,
        COALESCE(SUM(m.recompensa_oro), 0) AS oro_ganado_misiones,
        COALESCE(SUM(m.recompensa_xp), 0) AS xp_ganada_misiones
    FROM misiones_completadas mc
    INNER JOIN misiones_rpg m ON mc.mision_id = m.mision_id
    GROUP BY mc.jugador_id
)
SELECT 
    j.jugador_id,
    j.nombre_usuario,
    j.clase_personaje,
    j.nivel,
    j.oro_acumulado AS oro_en_bolsa,
    COALESCE(vi.valor_total_inventario, 0) AS valor_inventario_oro,
    (j.oro_acumulado + COALESCE(vi.valor_total_inventario, 0)) AS patrimonio_total_oro,
    COALESCE(mj.total_misiones_completadas, 0) AS misiones_resueltas
FROM jugadores_rpg j
LEFT JOIN ValorInventario CTE vi ON j.jugador_id = vi.jugador_id
LEFT JOIN MisionesJugador CTE mj ON j.jugador_id = mj.jugador_id
ORDER BY patrimonio_total_oro DESC;



SELECT 
    j.jugador_id,
    j.nombre_usuario,
    j.clase_personaje,
    m.titulo_mision,
    mc.fecha_completado
FROM misiones_completadas mc
INNER JOIN jugadores_rpg j ON mc.jugador_id = j.jugador_id
INNER JOIN misiones_rpg m ON mc.mision_id = m.mision_id
ORDER BY mc.fecha_completado ASC;

SELECT 
    j.nombre_usuario,
    it.nombre_item,
    it.tipo_item,
    it.rareza,
    inv.cantidad,
    inv.equipado,
    (inv.cantidad * it.valor_oro) AS subtotal_valor
FROM inventario_jugadores inv
INNER JOIN jugadores_rpg j ON inv.jugador_id = j.jugador_id
INNER JOIN items_juego it ON inv.item_id = it.item_id
ORDER BY j.nombre_usuario ASC, subtotal_valor DESC;