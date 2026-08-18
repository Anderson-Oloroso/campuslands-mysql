-- Consultas base e implementacion de funciones SQL para viajes y turismo.
USE campuslands_mysql;

-- 1. Consulta general de destinos registrados
SELECT * FROM viajes_turismo;

-- 2. Agrupación por categoría con agregaciones numéricas (COUNT, AVG, ROUND)
SELECT 
  categoria, 
  COUNT(*) AS total_registros, 
  ROUND(AVG(puntaje), 2) AS promedio
FROM viajes_turismo
GROUP BY categoria
ORDER BY promedio DESC;

-- 3. Funciones de cadena y condicionales (UPPER, CONCAT, CASE)
SELECT 
  id,
  UPPER(nombre) AS destino_mayusculas,
  CONCAT('Categoría: ', categoria) AS etiqueta_categoria,
  puntaje,
  CASE 
    WHEN puntaje >= 1000 THEN 'Paquete Premium'
    WHEN puntaje >= 500 THEN 'Paquete Estándar'
    ELSE 'Paquete Económico'
  END AS nivel_precio
FROM viajes_turismo
WHERE estado = 'activo';

-- 4. Funciones de fecha y formato (DATE_FORMAT, NOW, DATEDIFF)
SELECT 
  nombre,
  categoria,
  DATE_FORMAT(creado_en, '%d/%m/%Y %H:%i') AS fecha_registro_formateada,
  DATEDIFF(NOW(), creado_en) AS dias_desde_registro
FROM viajes_turismo;

-- 5. Métricas globales de la plataforma turística (SUM, MIN, MAX)
SELECT 
  COUNT(*) AS total_paquetes,
  ROUND(AVG(puntaje), 2) AS promedio_general,
  MIN(puntaje) AS paquete_mas_barato,
  MAX(puntaje) AS paquete_mas_costoso
FROM viajes_turismo
WHERE estado != 'inactivo';