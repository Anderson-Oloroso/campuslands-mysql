-- Consultas base. Completa o reemplaza segun el enunciado.
USE campuslands_mysql;

SELECT 
    titulo,
    artista,
    estilo,
    horas_trabajo,
    precio
FROM ilustraciones_digitales
WHERE es_encargo = TRUE AND precio > 200.00;

SELECT 
    titulo,
    artista,
    software,
    horas_trabajo
FROM ilustraciones_digitales
WHERE software = 'Procreate' OR software = 'Clip Studio Paint';
