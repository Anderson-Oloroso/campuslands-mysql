USE db_kickboxing;

SELECT nombre, categoria, victorias FROM peleadores ORDER BY victorias DESC;
SELECT nombre, categoria FROM peleadores WHERE estado = 'Activo';
SELECT nombre, victorias, derrotas FROM peleadores ORDER BY derrotas ASC LIMIT 3;
SELECT categoria, COUNT(*) AS total FROM peleadores GROUP BY categoria;
SELECT categoria, AVG(victorias) AS promedio_victorias FROM peleadores GROUP BY categoria;