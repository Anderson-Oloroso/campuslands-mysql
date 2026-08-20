USE agencia_viajes_db;

-- 1. Listado completo de paquetes turisticos relacionando su destino principal, pais, duracion y precio base
SELECT p.codigo_referencia, p.nombre_paquete, d.nombre_destino, d.pais, p.duracion_dias, p.precio_base, p.estado_paquete
FROM paquetes_turisticos p
JOIN destinos_turisticos d ON p.id_destino = d.id_destino
ORDER BY p.precio_base DESC;

-- 2. Conteo de paquetes, precio promedio y cupos totales agrupados por destino turistico
SELECT d.nombre_destino AS destino, d.pais, COUNT(p.id_paquete) AS total_paquetes, ROUND(AVG(p.precio_base), 2) AS precio_promedio, SUM(p.cupos_disponibles) AS cupos_totales
FROM destinos_turisticos d
LEFT JOIN paquetes_turisticos p ON d.id_destino = p.id_destino
GROUP BY d.id_destino, d.nombre_destino, d.pais
ORDER BY total_paquetes DESC;

-- 3. Paquetes turisticos que se encuentran con estado 'activo' y disponen de cupos mayores a cero
SELECT p.codigo_referencia, p.nombre_paquete, d.nombre_destino, p.duracion_dias, p.precio_base, p.cupos_disponibles
FROM paquetes_turisticos p
JOIN destinos_turisticos d ON p.id_destino = d.id_destino
WHERE p.estado_paquete = 'activo' AND p.cupos_disponibles > 0
ORDER BY p.precio_base ASC;

-- 4. Top 5 de paquetes turisticos mas economicos disponibles en la agencia de viajes
SELECT p.codigo_referencia, p.nombre_paquete, d.nombre_destino, p.duracion_dias, p.precio_base, p.estado_paquete
FROM paquetes_turisticos p
JOIN destinos_turisticos d ON p.id_destino = d.id_destino
ORDER BY p.precio_base ASC
LIMIT 5;

-- 5. Analisis de rentabilidad potencial por paquete calculando el ingreso bruto maximo (precio base por cupos disponibles)
SELECT p.codigo_referencia, p.nombre_paquete, p.precio_base, p.cupos_disponibles, (p.precio_base * p.cupos_disponibles) AS ingreso_potencial_maximo
FROM paquetes_turisticos p
WHERE p.estado_paquete = 'activo' AND p.cupos_disponibles > 0
ORDER BY ingreso_potencial_maximo DESC;