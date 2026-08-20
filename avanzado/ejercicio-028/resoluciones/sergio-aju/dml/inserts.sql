USE campuslands_mysql;

INSERT INTO estudiantes_academia_avanzado (nombre_completo, correo, programa_principal, metadatos_academicos, estado, fecha_registro) VALUES
(
  'Sergio Ajú', 
  'sergio.aju@campus.com', 
  'Backend', 
  '{"habilidades": ["Python", "MySQL", "Git"], "proyectos_completados": 5, "puntaje_tecnico": 95.50, "certificaciones": ["Auxiliar de Enfermeria", "Backend Developer"]}', 
  'activo', 
  '2026-02-15'
),
(
  'María Rodríguez', 
  'maria.rodriguez@campus.com', 
  'FullStack', 
  '{"habilidades": ["JavaScript", "React", "Node.js"], "proyectos_completados": 4, "puntaje_tecnico": 88.00, "certificaciones": ["Frontend Specialist"]}', 
  'activo', 
  '2026-02-15'
),
(
  'Carlos Pérez', 
  'carlos.perez@campus.com', 
  'DataScience', 
  '{"habilidades": ["Python", "Pandas", "SQL"], "proyectos_completados": 6, "puntaje_tecnico": 91.25, "certificaciones": ["Data Analyst"]}', 
  'graduado', 
  '2025-06-10'
),
(
  'Ana Gómez', 
  'ana.gomez@campus.com', 
  'Frontend', 
  '{"habilidades": ["HTML", "CSS", "JavaScript"], "proyectos_completados": 2, "puntaje_tecnico": 76.50, "certificaciones": []}', 
  'pausado', 
  '2026-03-01'
),
(
  'Luis Martínez', 
  'luis.martinez@campus.com', 
  'CloudDevOps', 
  '{"habilidades": ["Docker", "Linux", "AWS"], "proyectos_completados": 3, "puntaje_tecnico": 84.00, "certificaciones": ["Cloud Practitioner"]}', 
  'activo', 
  '2026-01-20'
),
(
  'Sofía Torres', 
  'sofia.torres@campus.com', 
  'Backend', 
  '{"habilidades": ["Java", "Spring Boot", "MySQL"], "proyectos_completados": 7, "puntaje_tecnico": 93.75, "certificaciones": ["Java Developer"]}', 
  'graduado', 
  '2025-06-10'
),
(
  'Jorge Castillo', 
  'jorge.castillo@campus.com', 
  'Frontend', 
  '{"habilidades": ["HTML", "CSS"], "proyectos_completados": 1, "puntaje_tecnico": 65.00, "certificaciones": []}', 
  'retirado', 
  '2026-02-01'
),
(
  'Lucía Méndez', 
  'lucia.mendez@campus.com', 
  'FullStack', 
  '{"habilidades": ["JavaScript", "Python", "MySQL"], "proyectos_completados": 5, "puntaje_tecnico": 89.90, "certificaciones": ["FullStack Junior"]}', 
  'activo', 
  '2026-03-12'
);