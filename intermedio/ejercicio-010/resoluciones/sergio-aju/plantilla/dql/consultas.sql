USE carreras_urbanas;

-- 1. Top 3 de pilotos activos con más victorias
SELECT alias, vehiculo, victorias FROM pilotos WHERE estado = 'activo' ORDER BY victorias DESC LIMIT 3;

-- 2. Conteo de pilotos por categoría
SELECT categoria, COUNT(id_piloto) AS total_pilotos FROM pilotos GROUP BY categoria;

-- 3. Promedio de victorias de los pilotos categoría 'Pro'
SELECT AVG(victorias) AS prom_victorias_pro FROM pilotos WHERE categoria = 'Pro';

-- 4. Lista de vehículos de los pilotos retirados o accidentados
SELECT alias, vehiculo, estado FROM pilotos WHERE estado != 'activo';

-- 5. Pilotos intermedios con más de 8 victorias para posible ascenso a Pro
SELECT alias, victorias FROM pilotos WHERE categoria = 'Intermedio' AND victorias > 8;