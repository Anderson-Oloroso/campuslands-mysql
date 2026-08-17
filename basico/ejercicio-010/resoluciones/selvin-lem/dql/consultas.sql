USE campuslands_mysql;

-- 1. Cantidad total de pilotos registrados
SELECT COUNT(*) AS total_pilotos FROM carreras_urbanas_pilotos;

-- 2. Cantidad de pilotos activos (COUNT condicional con WHERE)
SELECT COUNT(*) AS pilotos_activos
FROM carreras_urbanas_pilotos
WHERE estado = 'activo';

-- 3. Premio total acumulado por categoria de auto
SELECT categoria_auto, SUM(premio_acumulado) AS premio_total, COUNT(*) AS total_pilotos
FROM carreras_urbanas_pilotos
GROUP BY categoria_auto
ORDER BY premio_total DESC;

-- 4. Suma total de carreras ganadas entre todos los pilotos
SELECT SUM(carreras_ganadas) AS total_carreras_ganadas FROM carreras_urbanas_pilotos;

-- 5. Pilotos sin ninguna victoria registrada (caso limite)
SELECT nombre_piloto, categoria_auto, carreras_ganadas
FROM carreras_urbanas_pilotos
WHERE carreras_ganadas = 0;