SELECT * FROM rankingBR
ORDER BY puesto ASC;

SELECT * FROM rankingBR
ORDER BY puntos DESC, cantidad_kills DESC;

SELECT * FROM rankingBR
WHERE cantidad_kills > 100;

SELECT * FROM rankingBR
WHERE cantidad_muertes < 80;

SELECT * FROM rankingBR
WHERE puntos > 2000 AND cantidad_kills > 90;