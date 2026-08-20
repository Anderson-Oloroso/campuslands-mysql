USE campuslands_mysql;

SELECT
    nombre,
    clase,
    nivel,
    experiencia,
    monedas,
    salud,
    ataque
FROM personajes_accion_aventura
WHERE estado = 'activo'
ORDER BY nivel DESC, experiencia DESC;

SELECT
    clase,
    COUNT(*) AS total_personajes,
    ROUND(AVG(nivel), 2) AS nivel_promedio,
    ROUND(AVG(ataque), 2) AS ataque_promedio,
    SUM(experiencia) AS experiencia_total
FROM personajes_accion_aventura
WHERE estado = 'activo'
GROUP BY clase
ORDER BY nivel_promedio DESC;

SELECT
    clase,
    COUNT(*) AS total_personajes,
    ROUND(SUM(monedas), 2) AS monedas_totales,
    ROUND(AVG(monedas), 2) AS monedas_promedio
FROM personajes_accion_aventura
WHERE estado = 'activo'
GROUP BY clase
ORDER BY monedas_totales DESC;