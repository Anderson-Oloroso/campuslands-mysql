USE academia_tech_json_db;

INSERT INTO detalles_estudiantes (nombre_completo, correo, carrera, metadata_json, estado) VALUES
('Carlos Ruiz', 'carlos.ruiz@email.com', 'Desarrollo Web', '{"nivel": "Intermedio", "horas_practica": 120, "tecnologias": ["HTML", "CSS", "JavaScript"]}', 'Activo'),
('Sofía Morales', 'sofia.morales@email.com', 'Ingeniería de Datos', '{"nivel": "Avanzado", "horas_practica": 250, "tecnologias": ["Python", "SQL", "Spark"]}', 'Activo'),
('Mateo Vargas', 'mateo.vargas@email.com', 'Desarrollo Web', '{"nivel": "Basico", "horas_practica": 45, "tecnologias": ["HTML", "Git"]}', 'Inactivo'),
('Lucía Gómez', 'lucia.gomez@email.com', 'Ciberseguridad', '{"nivel": "Avanzado", "horas_practica": 300, "tecnologias": ["Linux", "Redes", "Python"]}', 'Activo'),
('Diego Herrera', 'diego.herrera@email.com', 'Ingeniería de Datos', '{"nivel": "Intermedio", "horas_practica": 150, "tecnologias": ["SQL", "ETL", "Pandas"]}', 'Graduado'),
('Valeria Castro', 'valeria.castro@email.com', 'Desarrollo Web', '{"nivel": "Avanzado", "horas_practica": 280, "tecnologias": ["React", "Node.js", "MySQL"]}', 'Activo'),
('Andrés Paredes', 'andres.paredes@email.com', 'Ciberseguridad', '{"nivel": "Basico", "horas_practica": 60, "tecnologias": ["Bash", "Seguridad Web"]}', 'Inactivo'),
('Camila Torres', 'camila.torres@email.com', 'Ingeniería de Datos', '{"nivel": "Intermedio", "horas_practica": 180, "tecnologias": ["Python", "MySQL", "Docker"]}', 'Activo');
