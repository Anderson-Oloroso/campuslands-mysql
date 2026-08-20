-- Consultas Avanzadas para Ejercicio 032 - procedimientos almacenados para ranking battle royale
-- Concepto principal: procedimientos almacenados
USE campuslands_mysql;

-- 1. Llamada al Procedimiento Almacenado de prueba
CALL sp_registrar_o_actualizar_battle_royale('Elemento de Prueba Avanzado', 1, 999.99, @resultado);
SELECT @resultado AS mensaje_procedimiento;

-- Validar insercion
SELECT * FROM partidas_br WHERE id_jugador = 'Elemento de Prueba Avanzado';

-- 2. Metricas agregadas con desviacion respecto al promedio general
SELECT 
    p.nickname AS categoria_principal,
    COUNT(s.id_partida) AS cantidad_registros,
    AVG(s.eliminaciones) AS promedio_categoria,
    (AVG(s.eliminaciones) - (SELECT AVG(eliminaciones) FROM partidas_br)) AS diferencia_vs_global
FROM jugadores_br p
INNER JOIN partidas_br s ON p.id_jugador = s.mapa
GROUP BY p.id_jugador, p.nickname
ORDER BY promedio_categoria DESC;

-- 3. Top 3 elementos con mayor desempeno
SELECT 
    s.id_jugador AS nombre_destacado,
    p.nickname AS origen,
    s.eliminaciones AS metrica_maxima
FROM partidas_br s
INNER JOIN jugadores_br p ON s.mapa = p.id_jugador
ORDER BY s.eliminaciones DESC
LIMIT 3;
