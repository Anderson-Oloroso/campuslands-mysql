-- DQL: Consultas avanzadas utilizando bloqueos de lectura/escritura a nivel de fila y reportes
USE campuslands_mysql;

-- 1. Uso de FOR UPDATE (Bloqueo de exclusión mutua para procesar resultado de la pelea sin condiciones de carrera)
START TRANSACTION;

SELECT 
    pelea_id, 
    evento, 
    estado_pelea, 
    cupo_apuestas 
FROM peleas_kickboxing 
WHERE pelea_id = 1 
FOR UPDATE;

UPDATE peleas_kickboxing 
SET estado_pelea = 'finalizada' 
WHERE pelea_id = 1;

COMMIT;

-- 2. Uso de LOCK IN SHARE MODE (Bloqueo compartido de lectura para auditoría de apuestas)
START TRANSACTION;

SELECT 
    a.apuesta_id,
    a.apostador,
    a.monto,
    p.nombre_peleador AS apostado_a
FROM apuestas_kickboxing a
INNER JOIN peleadores_kickboxing p ON a.peleador_apostado_id = p.peleador_id
WHERE a.pelea_id = 1
FOR SHARE;

COMMIT;

-- 3. Reporte consolidado de peleas con sus combatientes y estado
SELECT 
    pk.pelea_id,
    pk.evento,
    projo.nombre_peleador AS esquina_roja,
    pazul.nombre_peleador AS esquina_azul,
    pk.estado_pelea
FROM peleas_kickboxing pk
INNER JOIN peleadores_kickboxing projo ON pk.peleador_rojo_id = projo.peleador_id
INNER JOIN peleadores_kickboxing pazul ON pk.peleador_azul_id = pazul.peleador_id;

-- 4. Ranking Top 3 peleadores con mayor efectividad (Victorias)
SELECT 
    nombre_peleador,
    apodo,
    categoria_peso,
    victorias,
    derrotas
FROM peleadores_kickboxing
WHERE estado = 'activo'
ORDER BY victorias DESC
LIMIT 3;

-- 5. Total de dinero apostado agrupado por pelea y evento
SELECT 
    pk.pelea_id,
    pk.evento,
    COUNT(a.apuesta_id) AS total_apuestas,
    IFNULL(SUM(a.monto), 0.00) AS bolsa_acumulada
FROM peleas_kickboxing pk
LEFT JOIN apuestas_kickboxing a ON pk.pelea_id = a.pelea_id
GROUP BY pk.pelea_id, pk.evento;
