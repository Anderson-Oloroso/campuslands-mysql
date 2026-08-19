USE campuslands_mysql;

SELECT
    nombre,
    clase,
    nivel,
    ataque,
    RANK() OVER (
        ORDER BY ataque DESC
    ) AS ranking_ataque
FROM personajes_accion_aventura
WHERE estado = 'activo'
ORDER BY ranking_ataque, nombre;

SELECT
    nombre,
    clase,
    nivel,
    ataque,
    posicion_clase
FROM (
    SELECT
        nombre,
        clase,
        nivel,
        ataque,
        ROW_NUMBER() OVER (
            PARTITION BY clase
            ORDER BY nivel DESC, ataque DESC
        ) AS posicion_clase
    FROM personajes_accion_aventura
    WHERE estado = 'activo'
) AS ranking_clases
WHERE posicion_clase <= 2
ORDER BY clase, posicion_clase;

SELECT
    nombre,
    clase,
    nivel,
    experiencia,
    LAG(experiencia) OVER (
        ORDER BY experiencia
    ) AS experiencia_anterior,
    experiencia - LAG(experiencia) OVER (
        ORDER BY experiencia
    ) AS diferencia_experiencia
FROM personajes_accion_aventura
WHERE estado = 'activo'
ORDER BY experiencia;