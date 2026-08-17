-- Consultas base e indicadores aplicando FOREIGN KEY mediante JOIN.
USE campuslands_mysql;

SELECT p.nombre AS peleador, p.categoria_peso, g.nombre AS gimnasio 
    FROM intermedio_ejercicio_009_peleadores p 
    JOIN intermedio_ejercicio_009_gimnasios g ON p.gimnasio_id = g.id;

SELECT g.nombre AS gimnasio, COUNT(p.id) AS total_peleadores 
    FROM intermedio_ejercicio_009_gimnasios g 
    JOIN intermedio_ejercicio_009_peleadores p ON g.id = p.gimnasio_id 
    GROUP BY g.id, g.nombre 
    ORDER BY total_peleadores DESC;

SELECT p.nombre, p.categoria_peso, g.nombre AS gimnasio 
    FROM intermedio_ejercicio_009_peleadores p 
    JOIN intermedio_ejercicio_009_gimnasios g ON p.gimnasio_id = g.id 
    WHERE g.ubicacion = 'Amsterdam';

SELECT g.nombre, g.ubicacion 
    FROM intermedio_ejercicio_009_gimnasios g 
    LEFT JOIN intermedio_ejercicio_009_peleadores p ON g.id = p.gimnasio_id 
    WHERE p.id IS NULL;

SELECT p.nombre, g.nombre AS campamento, g.ubicacion 
    FROM intermedio_ejercicio_009_peleadores p 
    JOIN intermedio_ejercicio_009_gimnasios g ON p.gimnasio_id = g.id 
    WHERE p.categoria_peso = 'Peso Pesado';