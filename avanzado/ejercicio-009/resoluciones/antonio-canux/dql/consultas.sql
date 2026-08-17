-- Consultas base demostrando bloqueos de tabla (Table Locks) y bloqueos de fila (Row Locks).
USE campuslands_mysql;

-- 1. Bloqueo explicito de tabla para lectura (Impide que otras sesiones modifiquen los datos mientras generamos un reporte)
LOCK TABLES avanzado_ejercicio_009_peleadores READ;
SELECT nombre, victorias, derrotas 
    FROM avanzado_ejercicio_009_peleadores 
    WHERE victorias > 100 
    ORDER BY victorias DESC;
UNLOCK TABLES;

-- 2. Bloqueo explicito de tabla para escritura (Garantiza acceso exclusivo para un mantenimiento masivo de estados)
LOCK TABLES avanzado_ejercicio_009_peleadores WRITE;
UPDATE avanzado_ejercicio_009_peleadores 
    SET estado = 'inactivo' 
    WHERE derrotas > 15 AND estado = 'activo';
UNLOCK TABLES;

-- 3. Transaccion con bloqueo de fila exclusivo (FOR UPDATE) para registrar de forma segura el resultado de una pelea
START TRANSACTION;
SELECT nombre, victorias, puntos_ranking 
    FROM avanzado_ejercicio_009_peleadores 
    WHERE nombre = 'Badr Hari' FOR UPDATE;
UPDATE avanzado_ejercicio_009_peleadores 
    SET victorias = victorias + 1, puntos_ranking = puntos_ranking + 50 
    WHERE nombre = 'Badr Hari';
COMMIT;

-- 4. Transaccion con bloqueo de fila compartido (FOR SHARE / LOCK IN SHARE MODE) para calcular promedios del ranking sin frenar otras lecturas
START TRANSACTION;
SELECT categoria, ROUND(AVG(puntos_ranking), 2) AS promedio_puntos 
    FROM avanzado_ejercicio_009_peleadores 
    WHERE categoria = 'Peso Pesado' FOR SHARE;
COMMIT;

-- 5. Verificacion del estado final de los peleadores tras las operaciones concurrentes simuladas
SELECT nombre, estado, victorias, puntos_ranking 
    FROM avanzado_ejercicio_009_peleadores 
    WHERE nombre = 'Badr Hari' OR nombre = 'Bob Sapp';