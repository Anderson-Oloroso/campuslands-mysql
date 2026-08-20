USE avanzado_paracaidismo;

-- Carga de Instructores
INSERT INTO instructores_019 (nombre, licencia_faa, saltos_acumulados) VALUES
('Carlos Mendoza', 'D-38912', 1500),
('Andrea López', 'D-41205', 2300),
('Fernando Gómez', 'C-19820', 850);

-- Carga de Paracaidistas
INSERT INTO paracaidistas_019 (nombre, correo, total_saltos, nivel_experiencia) VALUES
('Lucas Pajarito', 'lucas.pajarito@email.com', 0, 'Licenciado A'),
('Mariana Estrada', 'mariana.estrada@email.com', 0, 'Tándem'),
('Mateo Morales', 'mateo.morales@email.com', 0, 'Estudiante');