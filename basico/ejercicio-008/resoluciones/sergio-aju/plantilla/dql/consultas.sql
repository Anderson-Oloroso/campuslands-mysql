USE db_futbol_sala;

SELECT nombre, puntos, estado FROM equipos_sala ORDER BY puntos DESC;
SELECT nombre, puntos FROM equipos_sala WHERE estado = 'Clasificado';
SELECT nombre, goles_favor FROM equipos_sala ORDER BY goles_favor DESC LIMIT 3;
SELECT nombre, puntos FROM equipos_sala WHERE puntos < 10;
SELECT estado, COUNT(*) AS total, AVG(puntos) AS promedio FROM equipos_sala GROUP BY estado;