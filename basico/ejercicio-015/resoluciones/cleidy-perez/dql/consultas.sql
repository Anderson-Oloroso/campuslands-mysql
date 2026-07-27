-- Consultas base. Completa o reemplaza segun el enunciado.
USE biblioteca_gamer_db;
SELECT 
    b.nombre_usuario,
    j.titulo,
    j.genero,
    j.plataforma,
    b.horas_jugadas,
    b.estado
FROM biblioteca_usuario b
JOIN juegos j ON b.id_juego = j.id_juego
WHERE b.nombre_usuario = 'GamerPro_99'
ORDER BY b.horas_jugadas DESC;
