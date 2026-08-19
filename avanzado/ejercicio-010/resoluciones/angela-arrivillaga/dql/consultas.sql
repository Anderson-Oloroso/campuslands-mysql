USE carreras_urbanas;

-- 1. Listado general de corredores inscritos con su respectiva categoria y dorsal
SELECT c.nombre_completo, c.correo, cat.nombre_categoria, i.numero_dorsal, i.estado_pago
FROM corredores c
JOIN inscripciones i ON c.id_corredor = i.id_corredor
JOIN categorias cat ON i.id_categoria = cat.id_categoria;

-- 2. Conteo de inscripciones totales agrupadas por categoria de carrera
SELECT cat.nombre_categoria, COUNT(i.id_inscripcion) AS total_inscritos
FROM categorias cat
LEFT JOIN inscripciones i ON cat.id_categoria = i.id_categoria
GROUP BY cat.id_categoria, cat.nombre_categoria
ORDER BY total_inscritos DESC;

-- 3. Corredores que tienen su estado de pago registrado como 'pagado'
SELECT c.nombre_completo, i.numero_dorsal, i.estado_pago
FROM corredores c
JOIN inscripciones i ON c.id_corredor = i.id_corredor
WHERE i.estado_pago = 'pagado';

-- 4. Categorias que tienen mas de un corredor inscrito
SELECT cat.nombre_categoria, COUNT(i.id_inscripcion) AS total_inscritos
FROM categorias cat
JOIN inscripciones i ON cat.id_categoria = i.id_categoria
GROUP BY cat.id_categoria, cat.nombre_categoria
HAVING total_inscritos > 1;

-- 5. Reporte de respaldo simulado: Conteo y resumen de datos clave para validacion de dump logico
SELECT 
    (SELECT COUNT(*) FROM corredores) AS total_corredores,
    (SELECT COUNT(*) FROM categorias) AS total_categorias,
    (SELECT COUNT(*) FROM inscripciones) AS total_inscripciones;