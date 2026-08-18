-- Insercion de datos para academia tech (ejercicio-058)
USE campuslands_mysql;

-- 1. Insercion en tabla principal (rutas_aprendizaje)
INSERT INTO rutas_aprendizaje (nombre_ruta, duracion_meses, tecnologia_principal) VALUES
('Desarrollo Backend Avanzado con Java y Spring Boot', 8, 'Java & MySQL'),
('Fullstack JavaScript Moderno (Node & React)', 6, 'TypeScript & MongoDB'),
('Ciencia de Datos e Inteligencia Artificial', 7, 'Python & BigQuery'),
('Cloud Computing y DevOps con AWS', 6, 'Docker & Kubernetes'),
('Desarrollo Mobile Multiplataforma Flutter', 5, 'Dart & Firebase');

-- 2. Insercion en tabla secundaria (campers_estudiantes)
INSERT INTO campers_estudiantes (nombre, email, id_ruta, promedio_acumulado, proyectos_aprobados, estado, fecha_ingreso) VALUES
('Estiben Ixen', 'estiben.ixen@campuslands.com', 1, 94.50, 5, 'En Proceso', '2025-01-15'),
('Maria Montepeque', 'maria.montepeque@campuslands.com', 1, 96.00, 5, 'En Proceso', '2025-01-15'),
('Carlos Velasco', 'carlos.velasco@campuslands.com', 2, 88.50, 4, 'En Proceso', '2025-01-15'),
('Angela Arrivillaga', 'angela.arrivillaga@campuslands.com', 2, 91.00, 4, 'En Proceso', '2025-01-15'),
('Edgar Sanchez', 'edgar.sanchez@campuslands.com', 3, 95.20, 5, 'En Proceso', '2025-01-15'),
('Cleidy Perez', 'cleidy.perez@campuslands.com', 3, 89.40, 4, 'En Proceso', '2025-01-15'),
('Sergio Aju', 'sergio.aju@campuslands.com', 4, 76.50, 2, 'En Riesgo', '2025-01-15'),
('Allison Vargas', 'allison.vargas@campuslands.com', 4, 93.00, 5, 'En Proceso', '2025-01-15'),
('Lester Garcia', 'lester.garcia@campuslands.com', 5, 87.00, 3, 'En Proceso', '2025-01-15'),
('Selvin Lem', 'selvin.lem@campuslands.com', 1, 90.50, 4, 'En Proceso', '2025-01-15'),
('Stefani Sanchez', 'stefani.sanchez@campuslands.com', 2, 97.50, 5, 'Graduado', '2024-06-10'),
('Antonio Canux', 'antonio.canux@campuslands.com', 5, 82.00, 3, 'En Proceso', '2025-01-15');
