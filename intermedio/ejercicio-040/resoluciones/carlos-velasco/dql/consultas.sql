USE campuslands_mysql;

-- 1. Mostrar todos los participantes registrados.
SELECT
    id_participante,
    nombre_completo,
    documento,
    categoria,
    ciudad,
    edad,
    tiempo_mejor_marca,
    estado
FROM participantes_carreras
ORDER BY nombre_completo ASC;


-- 2. Mostrar los participantes activos.
SELECT
    nombre_completo,
    documento,
    categoria,
    ciudad,
    tiempo_mejor_marca
FROM participantes_carreras
WHERE estado = 'activo'
ORDER BY tiempo_mejor_marca ASC;


-- 3. Mostrar los mejores tiempos de la categoria 5K.
SELECT
    nombre_completo,
    ciudad,
    tiempo_mejor_marca
FROM participantes_carreras
WHERE categoria = '5K'
ORDER BY tiempo_mejor_marca ASC;


-- 4. Contar participantes por categoria.
SELECT
    categoria,
    COUNT(*) AS total_participantes
FROM participantes_carreras
GROUP BY categoria
ORDER BY total_participantes DESC;


-- 5. Consultar el mejor tiempo registrado en cada categoria.
SELECT
    categoria,
    MIN(tiempo_mejor_marca) AS mejor_tiempo
FROM participantes_carreras
GROUP BY categoria
ORDER BY mejor_tiempo ASC;


-- 6. Consultar participantes de Bogota.
SELECT
    nombre_completo,
    categoria,
    tiempo_mejor_marca,
    estado
FROM participantes_carreras
WHERE ciudad = 'Bogota'
ORDER BY tiempo_mejor_marca ASC;


-- 7. Verificar que los documentos registrados son unicos.
SELECT
    documento,
    COUNT(*) AS cantidad_registros
FROM participantes_carreras
GROUP BY documento
HAVING COUNT(*) > 1;


-- 8. Mostrar los cinco mejores tiempos generales.
SELECT
    nombre_completo,
    categoria,
    ciudad,
    tiempo_mejor_marca
FROM participantes_carreras
WHERE estado = 'activo'
ORDER BY tiempo_mejor_marca ASC
LIMIT 5;