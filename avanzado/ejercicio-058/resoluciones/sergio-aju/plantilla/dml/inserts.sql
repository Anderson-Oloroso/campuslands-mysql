USE campuslands_mysql;

-- Inserción de Estudiantes (5 registros con documentos JSON)
INSERT INTO estudiantes (nombre, email, detalles_perfil) VALUES
('Sergio Ajú', 'sergio@tech.com', '{
    "ingles": "B2",
    "habilidades": ["Python", "SQL", "Git", "Linux"],
    "redes": {"github": "sergio-aju", "linkedin": "in/sergioaju"},
    "pais": "Guatemala"
}'),
('Carlos Mendoza', 'carlos@tech.com', '{
    "ingles": "A2",
    "habilidades": ["JavaScript", "React", "CSS"],
    "redes": {"github": "cmendoza"},
    "pais": "Colombia"
}'),
('Ana Lucía Gómez', 'ana@tech.com', '{
    "ingles": "C1",
    "habilidades": ["Python", "FastAPI", "Docker", "SQL"],
    "redes": {"github": "anagomez_dev", "linkedin": "in/anagomez"},
    "pais": "México"
}'),
('David López', 'david@tech.com', '{
    "ingles": "B1",
    "habilidades": ["Java", "Spring Boot", "MySQL"],
    "redes": {"github": "dlopez_backend"},
    "pais": "Guatemala"
}'),
('Elena Torres', 'elena@tech.com', '{
    "ingles": "B2",
    "habilidades": ["Node.js", "Express", "MongoDB", "SQL"],
    "redes": {"github": "elenatorres"},
    "pais": "Chile"
}');

-- Inserción de Bootcamps (3 registros)
INSERT INTO bootcamps (titulo, tecnologia_principal, malla_curricular, duracion_semanas) VALUES
('Backend Software Engineering', 'Python', '{
    "modulos": ["Fundamentos", "Bases de Datos Relacionales", "APIs REST", "Despliegue"],
    "requisito_minimo_asistencia": 85
}', 16),
('Desarrollo Web Fullstack', 'JavaScript', '{
    "modulos": ["HTML/CSS", "JavaScript Moderno", "React", "Node.js"],
    "requisito_minimo_asistencia": 80
}', 20),
('Base de Datos Avanzada', 'SQL', '{
    "modulos": ["Normalización", "Optimización e Índices", "CTEs y Window Functions", "JSON en MySQL"],
    "requisito_minimo_asistencia": 90
}', 8);

-- Inserción de Entregas de Proyectos (8 registros)
INSERT INTO entregas_proyectos (estudiante_id, bootcamp_id, nombre_proyecto, metadatos_evaluacion) VALUES
(1, 1, 'Sistema Distribuidora del Valle', '{"calificacion_final": 95, "aprobado": true, "criterios": {"codigo": 100, "db_design": 90, "doc": 95}}'),
(1, 3, 'Módulo RPG con CTE y JSON', '{"calificacion_final": 98, "aprobado": true, "criterios": {"codigo": 100, "db_design": 95, "doc": 100}}'),
(2, 2, 'E-commerce CampusShop', '{"calificacion_final": 75, "aprobado": true, "criterios": {"codigo": 70, "db_design": 80, "doc": 75}}'),
(3, 1, 'HealthTech API REST', '{"calificacion_final": 100, "aprobado": true, "criterios": {"codigo": 100, "db_design": 100, "doc": 100}}'),
(3, 3, 'Optimización de Consultas SQL', '{"calificacion_final": 92, "aprobado": true, "criterios": {"codigo": 90, "db_design": 95, "doc": 90}}'),
(4, 1, 'Sistema de Asistencia Telegram', '{"calificacion_final": 60, "aprobado": false, "criterios": {"codigo": 60, "db_design": 65, "doc": 55}}'),
(5, 2, 'Dashboard de Monitoreo', '{"calificacion_final": 88, "aprobado": true, "criterios": {"codigo": 90, "db_design": 85, "doc": 90}}'),
(5, 3, 'Consultas Complejas MySQL', '{"calificacion_final": 84, "aprobado": true, "criterios": {"codigo": 85, "db_design": 80, "doc": 88}}');