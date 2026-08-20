USE campuslands_mysql;

CALL sp_obtener_ranking();

CALL sp_obtener_estadisticas_jugador(1);

CALL sp_obtener_estadisticas_jugador(5);


CALL sp_obtener_estadisticas_jugador(7);

CALL sp_registrar_partida(
    1,
    2,
    10,
    '2026-07-10'
);

CALL sp_obtener_ranking();