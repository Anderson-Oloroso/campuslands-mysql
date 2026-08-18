USE campuslands_mysql;

SELECT
    id_peleador,
    CONCAT(nombre, ' ', apellido) AS peleador,
    categoria,
    peso,
    victorias,
    derrotas,
    estado
FROM peleadores
WHERE estado = 'activo'
ORDER BY victorias DESC;

SELECT
    categoria,
    COUNT(*) AS total_peleadores,
    AVG(peso) AS peso_promedio,
    AVG(victorias) AS promedio_victorias
FROM peleadores
GROUP BY categoria
ORDER BY promedio_victorias DESC;

SELECT
    CONCAT(nombre, ' ', apellido) AS peleador,
    categoria,
    victorias,
    derrotas,
    (victorias + derrotas) AS combates
FROM peleadores
ORDER BY victorias DESC
LIMIT 5;

SELECT
    estado,
    COUNT(*) AS total_peleadores,
    AVG(edad) AS edad_promedio
FROM peleadores
GROUP BY estado
ORDER BY total_peleadores DESC;