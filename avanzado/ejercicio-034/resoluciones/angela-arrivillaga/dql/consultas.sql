USE campuslands_mysql;

-- 1. promedio de precio comercial y cilindrada por marca para motos disponibles
SELECT marca, AVG(precio_comercial) AS promedio_precio, AVG(cilindrada) AS promedio_cilindrada
FROM motos_garaje
WHERE estado = 'disponible'
GROUP BY marca;

-- 2. top 3 motocicletas más costosas del inventario del garaje
SELECT marca, modelo, cilindrada, precio_comercial, estado
FROM motos_garaje
ORDER BY precio_comercial DESC
LIMIT 3;

-- 3. listado detallado de motos filtradas por un estado operativo específico
SELECT marca, modelo, cilindrada, precio_comercial
FROM motos_garaje
WHERE estado = 'disponible'
ORDER BY cilindrada DESC;

-- 4. reporte analítico agrupado por estado actual con conteo y valor total del parque automotor
SELECT estado, COUNT(*) AS total_motos, SUM(precio_comercial) AS valor_inventario
FROM motos_garaje
GROUP BY estado;

-- 5. consulta de la tabla de auditoría generada automáticamente por el Trigger tras los cambios de estado
SELECT a.id, m.marca, m.modelo, a.accion, a.detalle, a.fecha_evento
FROM auditoria_motos a
JOIN motos_garaje m ON a.moto_id = m.id
ORDER BY a.fecha_evento DESC;