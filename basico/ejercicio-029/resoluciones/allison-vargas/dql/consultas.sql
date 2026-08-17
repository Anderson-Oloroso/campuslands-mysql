USE marketplace_fechas_db;

-- Consulta 1: Listado de accesorios ordenados por su fecha de lanzamiento de la más reciente a la más antigua
SELECT 
    nombre_accesorio AS 'Accesorio',
    categoria AS 'Categoría',
    precio AS 'Precio ($)',
    fecha_lanzamiento AS 'Fecha de Lanzamiento'
FROM accesorios_lanzamiento
ORDER BY fecha_lanzamiento DESC;

-- Consulta 2: Filtrar accesorios lanzados únicamente durante el año 2026
SELECT 
    nombre_accesorio AS 'Accesorio 2026',
    categoria AS 'Categoría',
    fecha_lanzamiento AS 'Lanzamiento'
FROM accesorios_lanzamiento
WHERE YEAR(fecha_lanzamiento) = 2026;

-- Consulta 3: Conteo de accesorios y precio promedio agrupados por el año de lanzamiento
SELECT 
    YEAR(fecha_lanzamiento) AS 'Año de Lanzamiento',
    COUNT(*) AS 'Total de Accesorios',
    AVG(precio) AS 'Precio Promedio ($)'
FROM accesorios_lanzamiento
GROUP BY YEAR(fecha_lanzamiento)
ORDER BY 'Año de Lanzamiento' DESC;

-- Consulta 4: Top 3 de accesorios con mayor vigencia o cobertura de garantía en días
SELECT 
    nombre_accesorio AS 'Accesorio',
    fecha_lanzamiento AS 'Inicio',
    fecha_garantia_hasta AS 'Fin de Garantía',
    DATEDIFF(fecha_garantia_hasta, fecha_lanzamiento) AS 'Días de Garantía'
FROM accesorios_lanzamiento
ORDER BY 'Días de Garantía' DESC
LIMIT 3;

-- Consulta 5: Filtrar accesorios cuya garantía vence antes de finalizar el año 2026
SELECT 
    nombre_accesorio AS 'Accesorio',
    categoria AS 'Categoría',
    fecha_garantia_hasta AS 'Vencimiento de Garantía'
FROM accesorios_lanzamiento
WHERE fecha_garantia_hasta <= '2026-12-31'
ORDER BY fecha_garantia_hasta ASC;
