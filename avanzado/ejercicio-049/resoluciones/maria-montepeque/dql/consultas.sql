USE campuslands_mysql;

-- 1. Contador de saltos completados por instructor, mantenido por los triggers
SELECT nombre, especialidad, total_saltos
FROM instructores_avanzado
ORDER BY total_saltos DESC;

-- 2. Bitacora completa generada automaticamente por los triggers
SELECT id_bitacora, id_salto, accion, detalle, creado_en
FROM bitacora_saltos_avanzado
ORDER BY id_bitacora;

-- 3. Solo los cambios de estado registrados por el trigger de UPDATE
SELECT id_salto, detalle, creado_en
FROM bitacora_saltos_avanzado
WHERE accion = 'actualizado'
ORDER BY creado_en;

-- 4. Saltos completados actuales, con el nombre del instructor
SELECT s.id_salto, i.nombre AS instructor, s.paracaidista, s.tipo_salto, s.estado
FROM saltos_avanzado s
INNER JOIN instructores_avanzado i ON i.id_instructor = s.id_instructor
WHERE s.estado = 'completado'
ORDER BY s.id_salto;

-- 5. Verificacion de consistencia: la suma de los contadores debe
-- coincidir con la cantidad real de saltos completados.
SELECT
  (SELECT SUM(total_saltos) FROM instructores_avanzado) AS suma_contadores,
  (SELECT COUNT(*) FROM saltos_avanzado WHERE estado = 'completado') AS saltos_completados_reales;

-- 6. Ingresos por tipo de salto, solo saltos completados
SELECT tipo_salto, SUM(costo) AS ingresos
FROM saltos_avanzado
WHERE estado = 'completado'
GROUP BY tipo_salto
ORDER BY ingresos DESC;
