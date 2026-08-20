USE campuslands_dibujo_digital;

INSERT INTO obras (titulo, fecha_creacion, puntaje_calidad) VALUES
('Cyberpunk City', '2026-01-10', 95.00),
('Retro Forest', '2026-02-15', 88.50),
('Abstract Soul', '2026-03-01', 45.00),
('Dark Knight', '2026-04-12', 92.00),
('Neon Dreams', '2026-05-20', 78.00);

INSERT INTO tecnicas (nombre_tecnica) VALUES 
('Digital'), ('Pixel Art'), ('Vectorial'), ('Acuarela');

INSERT INTO obras_tecnicas (obra_id, tecnica_id) VALUES 
(1, 1), (1, 3), (2, 2), (3, 4), (4, 1), (5, 2);