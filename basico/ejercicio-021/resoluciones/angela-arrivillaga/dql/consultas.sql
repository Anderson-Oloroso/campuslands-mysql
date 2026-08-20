USE dibujo_digital_db;

-- 1. Filtrar obras que se encuentran en estado 'publicado' utilizando operadores de igualdad con WHERE
SELECT codigo_obra, titulo_obra, software_usado, tiempo_horas, calificacion_artista
FROM obras_dibujo
WHERE estado_obra = 'publicado'
ORDER BY calificacion_artista DESC;

-- 2. Filtrar obras que superen las 10 horas de trabajo utilizando operadores de comparación numérica en WHERE
SELECT codigo_obra, titulo_obra, software_usado, tiempo_horas, estado_obra
FROM obras_dibujo
WHERE tiempo_horas > 10
ORDER BY tiempo_horas DESC;

-- 3. Filtrar obras creadas con software específico mediante operadores de lista (IN)
SELECT codigo_obra, titulo_obra, software_usado, calificacion_artista, estado_obra
FROM obras_dibujo
WHERE software_usado IN ('Clip Studio Paint', 'Procreate')
ORDER BY calificacion_artista DESC;

-- 4. Filtrar obras con una calificación alta (mayor o igual a 4.80) que además estén publicadas usando operadores lógicos (AND)
SELECT codigo_obra, titulo_obra, software_usado, calificacion_artista, estado_obra
FROM obras_dibujo
WHERE calificacion_artista >= 4.80 AND estado_obra = 'publicado'
ORDER BY calificacion_artista DESC;

-- 5. Filtrar obras que contengan la palabra 'Estudio' en su título utilizando el operador de patrón LIKE
SELECT codigo_obra, titulo_obra, software_usado, tiempo_horas, calificacion_artista, estado_obra
FROM obras_dibujo
WHERE titulo_obra LIKE '%Estudio%'
ORDER BY tiempo_horas ASC;