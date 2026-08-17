-- Consultas base. Completa o reemplaza segun el enunciado.
USE dibujo_digital;

SELECT 
    p.proyecto_id,
    p.titulo,
    a.nombre AS artista,
    a.email,
    ps.software_nombre,
    pe.etiqueta
FROM Proyectos p
JOIN Artistas a ON p.artista_id = a.artista_id
LEFT JOIN Proyecto_Software ps ON p.proyecto_id = ps.proyecto_id
LEFT JOIN Proyecto_Etiquetas pe ON p.proyecto_id = pe.proyecto_id
ORDER BY p.proyecto_id;