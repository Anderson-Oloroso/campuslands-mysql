-- Consultas base. Completa o reemplaza segun el enunciado.
USE campuslands_mysql;

SELECT propetario FROM taller_motos;


SELECT nombre, propetario, placa, marca, estado 
FROM taller_motos
WHERE estado IN (
    SELECT estado 
    FROM taller_motos 
    WHERE DATE(fecha_revision) = '2026-07-23'
);

SELECT 
    nombre, 
    propetario, 
    marca, 
    estado,
    (SELECT COUNT(*) FROM taller_motos) AS total_servicios_taller
FROM taller_motos;