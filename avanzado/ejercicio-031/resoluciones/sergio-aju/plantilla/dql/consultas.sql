USE campuslands_mysql;

-- =========================================================================
-- DEMOSTRACIÓN DE TRANSACCIÓN ACID (Simulación de Fichaje / Traspaso Seguro)
-- =========================================================================
START TRANSACTION;

-- 1. Descontar presupuesto al equipo comprador (Ej: G2 Esports - ID 4 compra por 200,000)
UPDATE equipos_moba_avanzado 
SET presupuesto = presupuesto - 200000.00 
WHERE id = 4 AND presupuesto >= 200000.00;

-- 2. Acreditar presupuesto al equipo vendedor (Ej: Cloud9 - ID 2 recibe 200,000)
UPDATE equipos_moba_avanzado 
SET presupuesto = presupuesto + 200000.00 
WHERE id = 2;

-- 3. Registrar la operación en el historial de traspasos
INSERT INTO historial_traspasos_moba (equipo_origen_id, equipo_destino_id, jugador_fichado, costo_traspaso, fecha_traspaso) 
VALUES (2, 4, 'Bwipo', 200000.00, NOW());

-- Si todo es correcto, aplicamos COMMIT. (Si ocurriera un fallo lógico, se usaría ROLLBACK).
COMMIT;

-- =========================================================================
-- CONSULTAS ANALÍTICAS DEL MÓDULO
-- =========================================================================

-- 1. Listar el ranking de equipos ordenados por puntos de liga y presupuesto disponible
SELECT 
    nombre_equipo,
    region,
    presupuesto,
    puntos_liga,
    estado_equipo
FROM equipos_moba_avanzado
ORDER BY puntos_liga DESC, presupuesto DESC;

-- 2. Consultar el historial completo de traspasos utilizando JOINs para mostrar nombres claros de origen y destino
SELECT 
    t.id AS id_traspaso,
    e1.nombre_equipo AS equipo_vendedor,
    e2.nombre_equipo AS equipo_comprador,
    t.jugador_fichado,
    t.costo_traspaso,
    t.fecha_traspaso
FROM historial_traspasos_moba t
JOIN equipos_moba_avanzado e1 ON t.equipo_origen_id = e1.id
JOIN equipos_moba_avanzado e2 ON t.equipo_destino_id = e2.id
ORDER BY t.fecha_traspaso DESC;

-- 3. Conteo de equipos y presupuesto total acumulado agrupados por región
SELECT 
    region,
    COUNT(*) AS total_equipos,
    SUM(presupuesto) AS presupuesto_total_region,
    ROUND(AVG(puntos_liga), 2) AS promedio_puntos
FROM equipos_moba_avanzado
GROUP BY region
ORDER BY presupuesto_total_region DESC;

-- 4. Filtrar equipos cuyo estado sea 'clasificado' y cuyo presupuesto supere el millón de unidades monetarias
SELECT 
    nombre_equipo,
    region,
    presupuesto,
    puntos_liga
FROM equipos_moba_avanzado
WHERE estado_equipo = 'clasificado' AND presupuesto > 1000000.00
ORDER BY presupuesto DESC;

-- 5. Top 3 equipos con mayor presupuesto financiero en el torneo MOBA
SELECT 
    nombre_equipo,
    region,
    presupuesto,
    estado_equipo
FROM equipos_moba_avanzado
ORDER BY presupuesto DESC
LIMIT 3;