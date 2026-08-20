SELECT 
    b.biblioteca_id,
    v.titulo_juego,
    d.nombre_estudio AS desarrollador,
    p.nombre_plataforma,
    b.modalidad_adquisicion,
    b.precio_compra_usd,
    b.horas_jugadas,
    b.estado_juego,
    b.fecha_adquisicion
FROM biblioteca_gamer b
INNER JOIN videojuegos_gamer v ON b.videojuego_id = v.videojuego_id
INNER JOIN desarrolladores_gamer d ON v.desarrollador_id = d.desarrollador_id
INNER JOIN plataformas_gamer p ON b.plataforma_id = p.plataforma_id
ORDER BY b.fecha_adquisicion DESC;

SELECT 
    p.nombre_plataforma,
    COUNT(b.biblioteca_id) AS total_juegos_registrados,
    SUM(b.precio_compra_usd) AS inversion_total_usd,
    SUM(b.horas_jugadas) AS total_horas_jugadas,
    COALESCE(ROUND(SUM(b.precio_compra_usd) / NULLIF(SUM(b.horas_jugadas), 0), 2), 0.00) AS costo_por_hora_usd
FROM plataformas_gamer p
LEFT JOIN biblioteca_gamer b ON p.plataforma_id = b.plataforma_id
GROUP BY p.plataforma_id, p.nombre_plataforma
ORDER BY inversion_total_usd DESC;