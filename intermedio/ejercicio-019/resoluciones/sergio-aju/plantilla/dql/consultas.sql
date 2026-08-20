USE campuslands_mysql;

-- 1. Niveles de experiencia con un precio promedio mayor a $250.00 (uso de HAVING)
SELECT 
    nivel_experiencia,
    COUNT(*) AS total_modalidades,
    ROUND(AVG(precio), 2) AS precio_promedio
FROM saltos_paracaidismo
WHERE estado = 'activo'
GROUP BY nivel_experiencia
HAVING AVG(precio) > 250.00;

-- 2. Zonas de salto que cuentan con 2 o más modalidades activas registradas
SELECT 
    zona_salto,
    COUNT(*) AS cantidad_saltos,
    ROUND(AVG(calificacion), 2) AS promedio_calificacion
FROM saltos_paracaidismo
WHERE estado = 'activo'
GROUP BY zona_salto
HAVING COUNT(*) >= 2;

-- 3. Niveles de experiencia cuyo puntaje promedio sea igual o superior a 4.80
SELECT 
    nivel_experiencia,
    ROUND(AVG(calificacion), 2) AS promedio_satisfaccion,
    MAX(precio) AS precio_maximo
FROM saltos_paracaidismo
WHERE estado = 'activo'
GROUP BY nivel_experiencia
HAVING AVG(calificacion) >= 4.80;

-- 4. Zonas con altura promedio de salto superior a 13,000 pies
SELECT 
    zona_salto,
    ROUND(AVG(altura_pies), 0) AS altura_promedio_pies,
    COUNT(*) AS total_ofertas
FROM saltos_paracaidismo
WHERE estado = 'activo'
GROUP BY zona_salto
HAVING AVG(altura_pies) > 13000;

-- 5. Resumen general por nivel de experiencia con facturación potencial total mayor a $500.00
SELECT 
    nivel_experiencia,
    COUNT(*) AS cantidad,
    SUM(precio) AS suma_precios
FROM saltos_paracaidismo
WHERE estado = 'activo'
GROUP BY nivel_experiencia
HAVING SUM(precio) > 500.00;