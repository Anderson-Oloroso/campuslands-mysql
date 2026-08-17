SELECT a.marca, a.modelo, c.detalle 
FROM autos a JOIN caracteristicas c ON a.id = c.auto_id;

SELECT marca, modelo, velocidad FROM autos ORDER BY velocidad DESC LIMIT 3;

SELECT marca, AVG(precio) AS promedio_precio FROM autos GROUP BY marca;

SELECT a.marca, c.detalle FROM autos a JOIN caracteristicas c ON a.id = c.auto_id WHERE a.marca = 'Koenigsegg';

SELECT COUNT(*) AS total, MAX(velocidad) AS max_velocidad FROM autos;