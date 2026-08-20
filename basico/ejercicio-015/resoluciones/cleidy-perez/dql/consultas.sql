-- Consultas base. Completa o reemplaza segun el enunciado.
<<<<<<< HEAD
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
=======
USE campuslands_mysql;

SELECT 
    v.titulo,
    v.genero,
    v.horas_jugadas,
    p.nombre AS plataforma,
    p.desarrollador
FROM Videojuegos v
INNER JOIN Plataformas p ON v.plataforma_id = p.plataforma_id;

SELECT 
    p.nombre AS plataforma,
    p.desarrollador,
    COUNT(v.juego_id) AS total_juegos
FROM Plataformas p
LEFT JOIN Videojuegos v ON p.plataforma_id = v.plataforma_id
GROUP BY p.plataforma_id, p.nombre, p.desarrollador;
>>>>>>> upstream/dev
