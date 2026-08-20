-- Ejercicio 014 - fechas basicas para saga de ciencia ficcion
-- Ejecutar despues de inserts.sql

USE campuslands_mysql;

-- 1. Entregas ordenadas por fecha de estreno (mas antigua primero)
SELECT titulo, numero_entrega, fecha_estreno
FROM basico_ejercicio_014
ORDER BY fecha_estreno ASC;

-- 2. Entregas estrenadas en un año especifico (2019)
SELECT titulo, fecha_estreno, estado
FROM basico_ejercicio_014
WHERE YEAR(fecha_estreno) = 2019;

-- 3. Dias transcurridos desde el estreno hasta hoy, solo entregas estrenadas
SELECT titulo,
    fecha_estreno,
    DATEDIFF(CURDATE(), fecha_estreno) AS dias_desde_estreno
FROM basico_ejercicio_014
WHERE estado = 'estrenada'
ORDER BY dias_desde_estreno ASC;

-- 4. Proximas entregas, ordenadas por fecha ascendente
SELECT titulo, numero_entrega, fecha_estreno
FROM basico_ejercicio_014
WHERE estado = 'proxima'
ORDER BY fecha_estreno ASC;

-- 5. Cantidad de entregas por año de estreno
SELECT YEAR(fecha_estreno) AS anio,
    COUNT(*) AS total_entregas
FROM basico_ejercicio_014
GROUP BY YEAR(fecha_estreno)
ORDER BY anio ASC;
