USE campuslands_mysql;

SELECT
    id_peleador,
    CONCAT(nombre, ' ', apellido) AS peleador,
    categoria,
    peso,
    victorias,
    estado
FROM peleadores
WHERE estado = 'activo'
ORDER BY victorias DESC;

SELECT
    categoria,
    COUNT(*) AS total_peleadores,
    AVG(peso) AS peso_promedio
FROM peleadores
GROUP BY categoria
ORDER BY total_peleadores DESC;

SELECT
    CONCAT(nombre, ' ', apellido) AS peleador,
    victorias,
    derrotas,
    (victorias + derrotas) AS combates
FROM peleadores
ORDER BY victorias DESC;


SELECT
    id_peleador,
    CONCAT(nombre, ' ', apellido) AS peleador,
    categoria,
    estado
FROM peleadores
WHERE estado = 'inactivo';