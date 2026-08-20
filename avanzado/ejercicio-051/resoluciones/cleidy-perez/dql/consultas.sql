-- Consultas base. Completa o reemplaza segun el enunciado.
-- Consulta sin índice en software_nombre
USE dibujo_digital;
EXPLAIN SELECT p.titulo, ps.software_nombre
FROM Proyectos p
JOIN Proyecto_Software ps ON p.proyecto_id = ps.proyecto_id
WHERE ps.software_nombre = 'Clip Studio Paint';

-- Creamos índices para optimizar las búsquedas por valores textuales
CREATE INDEX idx_software_nombre ON Proyecto_Software(software_nombre);
CREATE INDEX idx_etiqueta ON Proyecto_Etiquetas(etiqueta);