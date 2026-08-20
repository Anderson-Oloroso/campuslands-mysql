USE campuslands_mysql;

-- Consulta 1: Tatuajes cuyo precio es superior al precio promedio de todos los tatuajes
SELECT 
    nombre_cliente, 
    estilo, 
    precio
FROM tatuajes
WHERE precio > (SELECT AVG(precio) FROM tatuajes);

-- Consulta 2: Tatuadores que tienen registrados tatuajes con un precio mayor a 500
SELECT 
    nombre_tatuador, 
    especialidad
FROM tatuadores
WHERE id IN (
    SELECT tatuador_id 
    FROM tatuajes 
    WHERE precio > 500
);

-- Consulta 3: Obtener el tatuaje más costoso utilizando una subconsulta de máximo
SELECT 
    t.nombre_cliente, 
    t.estilo, 
    t.precio, 
    tu.nombre_tatuador
FROM tatuajes t
JOIN tatuadores tu ON t.tatuador_id = tu.id
WHERE t.precio = (SELECT MAX(precio) FROM tatuajes);

-- Consulta 4: Tatuadores cuya experiencia en años es mayor que el promedio de experiencia del estudio
SELECT 
    nombre_tatuador, 
    especialidad, 
    experiencia_anos
FROM tatuadores
WHERE experiencia_anos > (SELECT AVG(experiencia_anos) FROM tatuadores);

-- Consulta 5: Listar tatuajes asociados a tatuadores cuya especialidad contenga la palabra 'Traditional'
SELECT 
    t.nombre_cliente, 
    t.estilo, 
    t.precio, 
    tu.nombre_tatuador
FROM tatuajes t
JOIN tatuadores tu ON t.tatuador_id = tu.id
WHERE tu.tatuador_id IN (
    SELECT id 
    FROM tatuadores 
    WHERE especialidad LIKE '%Traditional%'
);