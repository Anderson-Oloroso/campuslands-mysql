INSERT INTO instructores (nombre_completo, especialidad, contacto_json, fecha_ingreso) VALUES
('Ing. Carlos Mendoza', 'Desarrollo Backend', '{"telefono": "+502 5555-0101", "linkedin": "carlos-mendoza-tech", "ciudad": "Ciudad de Guatemala"}', '2024-01-15'),
('Dra. Sofia Alarcón', 'Ciencia de Datos', '{"telefono": "+502 5555-0202", "github": "salarcon-data", "ciudad": "Quetzaltenango"}', '2024-03-20');

INSERT INTO cursos_tecnicos (instructor_id, nombre_curso, nivel, temario_json) VALUES
(1, 'MySQL y Diseño de Bases de Datos Relacionales', 'Avanzado', '{
    "modulos": [
        {"id": 1, "titulo": "Diseño Relacional y Normalización", "duracion_horas": 12},
        {"id": 2, "titulo": "Funciones de Ventana y CTEs", "duracion_horas": 16},
        {"id": 3, "titulo": "Manejo de Tipo de Dato JSON nativo", "duracion_horas": 12}
    ],
    "requisitos": ["SQL Básico", "Lógica de Programación"],
    "proyecto_final": "Módulo de Datos para Academia"
}'),
(2, 'Python para Análisis de Datos', 'Intermedio', '{
    "modulos": [
        {"id": 1, "titulo": "Numpy y Pandas Fundamental", "duracion_horas": 20},
        {"id": 2, "titulo": "Visualización con Seaborn", "duracion_horas": 10}
    ],
    "requisitos": ["Python Básico"],
    "proyecto_final": "Dashboard de Métricas"
}');

INSERT INTO perfiles_estudiantes (nombre_estudiante, correo, habilidades_json, preferencias_json) VALUES
('Edgar Polanco', 'edgar.polanco@campuslands.edu.gt', '["SQL", "Python", "JavaScript", "Flutter", "Git"]', '{"modalidad": "Virtual", "horario_preferido": "Noche", "notificaciones_email": true}'),
('Mariana Gómez', 'mariana.gomez@tech.edu.gt', '["HTML", "CSS", "Tailwind", "JavaScript"]', '{"modalidad": "Presencial", "horario_preferido": "Mañana", "notificaciones_email": false}'),
('Luis Fernando Paredes', 'luis.paredes@tech.edu.gt', '["Python", "SQL", "Docker"]', '{"modalidad": "Virtual", "horario_preferido": "Noche", "notificaciones_email": true}');

INSERT INTO matriculas_cursos (estudiante_id, curso_id, estado, metadatos_evaluacion_json, fecha_matricula) VALUES
(1, 1, 'Completado', '{"calificacion_final": 95.5, "asistencia_porcentaje": 98.0, "certificable": true, "notas_modulos": [90, 98, 98.5]}', '2026-07-01'),
(2, 1, 'Activo', '{"calificacion_final": null, "asistencia_porcentaje": 85.0, "certificable": false, "notas_modulos": [80]}', '2026-07-05'),
(3, 2, 'Completado', '{"calificacion_final": 88.0, "asistencia_porcentaje": 92.0, "certificable": true, "notas_modulos": [85, 91]}', '2026-07-10');

INSERT INTO entregas_proyectos (matricula_id, titulo_proyecto, detalles_entrega_json, fecha_entrega) VALUES
(1, 'Módulo SQL con Respaldos y JSON', '{"repositorio_url": "https://github.com/edgar/mysql-tech", "commit_hash": "a1b2c3d4", "tecnologias_usadas": ["MySQL 8.0", "Docker", "Git"], "archivos_adjuntos": 5}', '2026-08-15 18:30:00'),
(3, 'Dashboard Analítico de Ventas', '{"repositorio_url": "https://github.com/luis/python-data", "commit_hash": "f9e8d7c6", "tecnologias_usadas": ["Pandas", "Matplotlib"], "archivos_adjuntos": 2}', '2026-08-16 10:15:00');