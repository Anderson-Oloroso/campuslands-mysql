USE campuslands_mysql;

-- 1. Mostrar los dibujos finalizados.
SELECT
    titulo,
    artista,
    estilo,
    estado
FROM dibujos
WHERE estado = 'finalizado';


-- 2. Mostrar dibujos cuyo precio sea superior a 350.
SELECT
    titulo,
    artista,
    precio
FROM dibujos
WHERE precio > 350
ORDER BY precio DESC;


-- 3. Mostrar dibujos realizados con Photoshop.
SELECT
    titulo,
    artista,
    programa,
    resolucion
FROM dibujos
WHERE programa = 'Photoshop';


-- 4. Mostrar dibujos de estilo Fantasia.
SELECT
    titulo,
    artista,
    estilo,
    precio
FROM dibujos
WHERE estilo = 'Fantasia'
ORDER BY precio DESC;


-- 5. Mostrar dibujos que todavía no están finalizados.
SELECT
    titulo,
    artista,
    estado,
    horas_trabajo
FROM dibujos
WHERE estado <> 'finalizado';


-- 6. Mostrar dibujos con más de 15 horas de trabajo.
SELECT
    titulo,
    artista,
    horas_trabajo,
    precio
FROM dibujos
WHERE horas_trabajo > 15
ORDER BY horas_trabajo DESC;


-- 7. Mostrar dibujos creados durante febrero de 2026.
SELECT
    titulo,
    artista,
    fecha_creacion,
    estado
FROM dibujos
WHERE fecha_creacion BETWEEN '2026-02-01' AND '2026-02-28'
ORDER BY fecha_creacion;


-- 8. Mostrar dibujos de Cyberpunk o Fantasia con precio superior a 300.
SELECT
    titulo,
    artista,
    estilo,
    precio
FROM dibujos
WHERE estilo IN ('Cyberpunk', 'Fantasia')
  AND precio > 300
ORDER BY precio DESC;