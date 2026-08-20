USE campuslands_mysql;

-- ==========================================
-- SECCIÓN DE CONSULTAS CON WINDOW FUNCTIONS
-- ==========================================

-- 1. Ranking de misiones por recompensa de oro dentro de cada región usando RANK()
SELECT 
    nombre_mision,
    region,
    dificultad,
    recompensa_oro,
    RANK() OVER(PARTITION BY region ORDER BY recompensa_oro DESC) AS ranking_region
FROM misiones_aventura_avanzado;

-- 2. Asignación de una numeración secuencial global a las misiones ordenadas por tiempo estimado usando ROW_NUMBER()
SELECT 
    ROW_NUMBER() OVER(ORDER BY tiempo_estimado_min ASC) AS orden_secuencial,
    nombre_mision,
    dificultad,
    tiempo_estimado_min,
    estado
FROM misiones_aventura_avanzado;

-- 3. Comparación de la recompensa de oro de cada misión frente al promedio general de su nivel de dificultad usando AVG() OVER()
SELECT 
    nombre_mision,
    dificultad,
    recompensa_oro,
    AVG(recompensa_oro) OVER(PARTITION BY dificultad) AS promedio_oro_dificultad,
    ROUND(recompensa_oro - AVG(recompensa_oro) OVER(PARTITION BY dificultad), 2) AS diferencia_promedio
FROM misiones_aventura_avanzado;

-- 4. Acumulado histórico del oro total de las misiones ordenadas por ID usando SUM() OVER (ORDER BY)
SELECT 
    id,
    nombre_mision,
    recompensa_oro,
    SUM(recompensa_oro) OVER(ORDER BY id ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS oro_acumulado_historico
FROM misiones_aventura_avanzado;

-- 5. Identificación de la misión anterior y posterior en cuanto a tiempo estimado usando LAG() y LEAD()
SELECT 
    nombre_mision,
    tiempo_estimado_min,
    LAG(nombre_mision, 1, 'Ninguna') OVER(ORDER BY tiempo_estimado_min ASC) AS mision_mas_breve_previa,
    LEAD(nombre_mision, 1, 'Ninguna') OVER(ORDER BY tiempo_estimado_min ASC) AS mision_mas_larga_siguiente
FROM misiones_aventura_avanzado;