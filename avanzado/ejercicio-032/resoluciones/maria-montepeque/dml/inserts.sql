-- Datos de practica: jugadores y partidas de un ranking de battle
-- royale, registradas a traves del procedimiento sp_registrar_partida_br.
USE campuslands_mysql;

INSERT INTO jugadores_avanzado (nickname, plataforma) VALUES
('ShadowSniper', 'PC'),
('NovaQueen', 'PS5'),
('ClutchKing99', 'Xbox'),
('GhostRunner', 'PC'),
('IronWolf', 'Xbox');

-- Cada CALL calcula los puntos (posicion + kills), inserta la partida
-- y suma los puntos al total del jugador dentro de una transaccion.
CALL sp_registrar_partida_br(1, 1, 8);
CALL sp_registrar_partida_br(1, 3, 5);
CALL sp_registrar_partida_br(2, 1, 6);
CALL sp_registrar_partida_br(2, 12, 2);
CALL sp_registrar_partida_br(3, 2, 9);
CALL sp_registrar_partida_br(4, 1, 10);
CALL sp_registrar_partida_br(4, 1, 7);
CALL sp_registrar_partida_br(3, 5, 4);
CALL sp_registrar_partida_br(5, 8, 3);
