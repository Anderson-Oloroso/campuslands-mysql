USE campuslands_mysql;

-- 1. Valor total del inventario de un jugador específico
SELECT nombre_jugador, SUM(o.valor_oro) AS valor_total_inventario
FROM inventario_jugador i
JOIN objetos_juego o ON i.id_objeto = o.id_objeto
WHERE i.estado_item != 'vendido'
GROUP BY nombre_jugador;

-- 2. Conteo de ítems por rareza para un jugador
SELECT i.nombre_jugador, o.rareza, COUNT(*) AS cantidad
FROM inventario_jugador i
JOIN objetos_juego o ON i.id_objeto = o.id_objeto
GROUP BY i.nombre_jugador, o.rareza;

-- 3. Listado de objetos equipados de mayor a menor valor
SELECT i.nombre_jugador, o.nombre_objeto, o.valor_oro
FROM inventario_jugador i
JOIN objetos_juego o ON i.id_objeto = o.id_objeto
WHERE i.estado_item = 'equipado'
ORDER BY o.valor_oro DESC;

-- 4. Ranking de rareza de objetos encontrados (Top 3)
SELECT o.rareza, COUNT(*) AS total_encontrados
FROM inventario_jugador i
JOIN objetos_juego o ON i.id_objeto = o.id_objeto
GROUP BY o.rareza
ORDER BY total_encontrados DESC
LIMIT 3;

-- 5. Objetos que aún no han sido vendidos
SELECT o.nombre_objeto, o.tipo_objeto, i.nombre_jugador
FROM inventario_jugador i
JOIN objetos_juego o ON i.id_objeto = o.id_objeto
WHERE i.estado_item IN ('equipado', 'mochila');