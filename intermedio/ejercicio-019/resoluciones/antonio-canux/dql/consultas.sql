USE campuslands_mysql;

-- Identificar instructores que han realizado estrictamente mas de 3 saltos
SELECT instructor, COUNT(id) AS total_saltos
    FROM intermedio_ejercicio_019_saltos
    GROUP BY instructor
    HAVING total_saltos > 3
    ORDER BY total_saltos DESC;

-- Zonas de salto donde el promedio de altitud supera los 11,000 pies
SELECT zona_salto, ROUND(AVG(altitud_pies), 0) AS altitud_promedio
    FROM intermedio_ejercicio_019_saltos
    GROUP BY zona_salto
    HAVING altitud_promedio > 11000
    ORDER BY altitud_promedio DESC;

-- Instructores que han tenido al menos 1 salto fallido
SELECT instructor, COUNT(id) AS total_saltos, SUM(CASE WHEN exitoso = FALSE THEN 1 ELSE 0 END) AS saltos_fallidos
    FROM intermedio_ejercicio_019_saltos
    GROUP BY instructor
    HAVING saltos_fallidos > 0
    ORDER BY saltos_fallidos DESC;

-- Zonas con mas de 2 saltos, excluyendo la modalidad 'Base' antes de agrupar
SELECT zona_salto, COUNT(id) AS saltos_validos
    FROM intermedio_ejercicio_019_saltos
    WHERE modalidad != 'Base'
    GROUP BY zona_salto
    HAVING saltos_validos > 2
    ORDER BY saltos_validos DESC;

-- Modalidades donde la altitud maxima alcanzada fue igual o mayor a 14,000 pies
SELECT modalidad, MAX(altitud_pies) AS altitud_maxima, COUNT(id) AS total_saltos
    FROM intermedio_ejercicio_019_saltos
    GROUP BY modalidad
    HAVING altitud_maxima >= 14000
    ORDER BY altitud_maxima DESC;