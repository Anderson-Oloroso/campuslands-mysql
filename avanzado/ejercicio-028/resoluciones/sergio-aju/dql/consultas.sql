USE campuslands_mysql;

-- ==========================================
-- SECCIÓN DE CONSULTAS CON MANIPULACIÓN JSON
-- ==========================================

-- 1. Extraer datos específicos del JSON usando el operador de extracción (->>) para mostrar puntajes técnicos
SELECT 
    nombre_completo,
    programa_principal,
    estado,
    metadatos_academicos->>'$.puntaje_tecnico' AS puntaje_tecnico,
    metadatos_academicos->>'$.proyectos_completados' AS proyectos_completados
FROM estudiantes_academia_avanzado
ORDER BY CAST(metadatos_academicos->>'$.puntaje_tecnico' AS DECIMAL(5,2)) DESC;

-- 2. Filtrar estudiantes activos cuyo puntaje técnico extraído del JSON sea mayor o igual a 90
SELECT 
    nombre_completo,
    programa_principal,
    metadatos_academicos->>'$.puntaje_tecnico' AS puntaje_tecnico
FROM estudiantes_academia_avanzado
WHERE estado = 'activo' 
  AND CAST(metadatos_academicos->>'$.puntaje_tecnico' AS DECIMAL(5,2)) >= 90.00
ORDER BY puntaje_tecnico DESC;

-- 3. Utilizar JSON_CONTAINS para buscar estudiantes que posean la habilidad de 'Python' dentro del arreglo JSON
SELECT 
    nombre_completo,
    programa_principal,
    estado,
    metadatos_academicos->>'$.habilidades' AS habilidades
FROM estudiantes_academia_avanzado
WHERE JSON_CONTAINS(metadatos_academicos, '"Python"', '$.habilidades');

-- 4. Reporte analítico agrupado por programa principal calculando el promedio de puntaje técnico extraído del JSON
SELECT 
    programa_principal,
    COUNT(*) AS total_estudiantes,
    AVG(CAST(metadatos_academicos->>'$.puntaje_tecnico' AS DECIMAL(5,2))) AS promedio_puntaje_tecnico
FROM estudiantes_academia_avanzado
GROUP BY programa_principal
ORDER BY promedio_puntaje_tecnico DESC;

-- 5. Identificación de estudiantes que cuentan con certificaciones registradas (verificando longitud del arreglo JSON)
SELECT 
    nombre_completo,
    programa_principal,
    metadatos_academicos->>'$.certificaciones' AS certificaciones
FROM estudiantes_academia_avanzado
WHERE JSON_LENGTH(metadatos_academicos, '$.certificaciones') > 0
ORDER BY nombre_completo ASC;