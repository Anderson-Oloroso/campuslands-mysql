-- Consultas base. Completa o reemplaza segun el enunciado.
USE rpg_game_db;

WITH ResumenClases AS (
    SELECT 
        c.nombre AS nombre_clase,
        COUNT(p.id) AS total_jugadores,
        AVG(p.nivel) AS nivel_promedio,
        SUM(p.puntos_experiencia) AS experiencia_total
    FROM clases c
    LEFT JOIN personajes p ON c.id = p.id_clase
    GROUP BY c.id, c.nombre
)
SELECT 
    nombre_clase,
    total_jugadores,
    ROUND(nivel_promedio, 2) AS nivel_promedio,
    experiencia_total
FROM ResumenClases
ORDER BY nivel_promedio DESC;

WITH ValorInventarios AS (
    SELECT 
        i.id_personaje,
        SUM(i.cantidad * o.precio_oro) AS valor_total_oro,
        COUNT(i.id_objeto) AS total_items_diferentes
    FROM inventarios i
    INNER JOIN objetos o ON i.id_objeto = o.id
    GROUP BY i.id_personaje
),
PersonajesDetalle AS (
    SELECT 
        p.id,
        p.nombre_jugador,
        c.nombre AS clase,
        p.nivel
    FROM personajes p
    INNER JOIN clases c ON p.id_clase = c.id
)
SELECT 
    pd.nombre_jugador,
    pd.clase,
    pd.nivel,
    IFNULL(vi.total_items_diferentes, 0) AS tipos_de_objetos,
    IFNULL(vi.valor_total_oro, 0) AS oro_en_inventario
FROM PersonajesDetalle pd
LEFT JOIN ValorInventarios vi ON pd.id = vi.id_personaje
ORDER BY oro_en_inventario DESC;
