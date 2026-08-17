USE ejercicio_09;

-- 1. Eliminar una pelea específica
DELETE FROM fights
WHERE fight_id = 2;

SELECT * FROM fights;

-- 2. Eliminar un torneo sin peleas asociadas
DELETE FROM tournaments
WHERE tournament_id = 2;

SELECT * FROM tournaments;

-- 3. Eliminar un peleador sin registros de peleas
DELETE FROM fighters
WHERE fighter_id = 2;

SELECT * FROM fighters;

-- 4. Eliminar un gimnasio sin peleadores asociados
DELETE FROM gyms
WHERE gym_id = 2;

SELECT * FROM gyms;

-- 5. Eliminar una pelea ganada en 3 rounds
DELETE FROM fights
WHERE fight_id = 4;

SELECT * FROM fights;

-- 6. Eliminar un torneo sin referencias después de eliminar sus peleas
DELETE FROM tournaments
WHERE tournament_id = 4;

SELECT * FROM tournaments;