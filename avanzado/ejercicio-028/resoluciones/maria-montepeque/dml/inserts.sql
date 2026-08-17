-- Datos de practica: perfiles de estudiantes de una academia tech,
-- guardados como JSON (habilidades, proyectos y datos de contacto).
USE campuslands_mysql;

INSERT INTO estudiantes_avanzado (nombre, programa, perfil) VALUES
('Laura Gomez', 'desarrollo_web', JSON_OBJECT(
  'habilidades', JSON_ARRAY('HTML', 'CSS', 'JavaScript', 'React'),
  'proyectos', JSON_ARRAY(
    JSON_OBJECT('nombre', 'Portafolio Personal', 'tecnologia', 'React'),
    JSON_OBJECT('nombre', 'Tienda Online', 'tecnologia', 'Node.js')
  ),
  'contacto', JSON_OBJECT('github', 'lauragomez', 'linkedin', 'laura-gomez')
)),
('Carlos Ruiz', 'ciencia_datos', JSON_OBJECT(
  'habilidades', JSON_ARRAY('Python', 'SQL', 'Pandas'),
  'proyectos', JSON_ARRAY(
    JSON_OBJECT('nombre', 'Analisis de Ventas', 'tecnologia', 'Python')
  ),
  'contacto', JSON_OBJECT('github', 'carlosruiz', 'linkedin', 'carlos-ruiz')
)),
('Ana Torres', 'ciberseguridad', JSON_OBJECT(
  'habilidades', JSON_ARRAY('Python', 'Linux', 'Nmap', 'Wireshark'),
  'proyectos', JSON_ARRAY(
    JSON_OBJECT('nombre', 'Pentest Interno', 'tecnologia', 'Kali Linux'),
    JSON_OBJECT('nombre', 'Auditoria Web', 'tecnologia', 'Burp Suite')
  ),
  'contacto', JSON_OBJECT('github', 'anatorres', 'linkedin', 'ana-torres')
)),
('Diego Perez', 'devops', JSON_OBJECT(
  'habilidades', JSON_ARRAY('Docker', 'Kubernetes', 'AWS'),
  'proyectos', JSON_ARRAY(
    JSON_OBJECT('nombre', 'Pipeline CI/CD', 'tecnologia', 'GitHub Actions')
  ),
  'contacto', JSON_OBJECT('github', 'diegoperez', 'linkedin', 'diego-perez')
)),
('Maria Lopez', 'diseno_ux', JSON_OBJECT(
  'habilidades', JSON_ARRAY('Figma', 'Adobe XD', 'Investigacion de Usuarios'),
  'proyectos', JSON_ARRAY(
    JSON_OBJECT('nombre', 'Rediseno App Bancaria', 'tecnologia', 'Figma')
  ),
  'contacto', JSON_OBJECT('github', 'marialopez', 'linkedin', 'maria-lopez')
)),
('Jorge Silva', 'desarrollo_web', JSON_OBJECT(
  'habilidades', JSON_ARRAY('JavaScript', 'Vue', 'SQL'),
  'proyectos', JSON_ARRAY(
    JSON_OBJECT('nombre', 'Dashboard Admin', 'tecnologia', 'Vue'),
    JSON_OBJECT('nombre', 'API REST', 'tecnologia', 'Express')
  ),
  'contacto', JSON_OBJECT('github', 'jorgesilva', 'linkedin', 'jorge-silva')
)),
('Paula Ramirez', 'ciencia_datos', JSON_OBJECT(
  'habilidades', JSON_ARRAY('Python', 'R', 'Machine Learning'),
  'proyectos', JSON_ARRAY(
    JSON_OBJECT('nombre', 'Prediccion de Churn', 'tecnologia', 'scikit-learn')
  ),
  'contacto', JSON_OBJECT('github', 'paularamirez', 'linkedin', 'paula-ramirez')
)),
('Andres Castro', 'ciberseguridad', JSON_OBJECT(
  'habilidades', JSON_ARRAY('Python', 'Linux'),
  'proyectos', JSON_ARRAY(),
  'contacto', JSON_OBJECT('github', 'andrescastro', 'linkedin', 'andres-castro')
));

-- Andres Castro todavia no tenia ningun proyecto registrado.
-- JSON_ARRAY_APPEND agrega un elemento al final del arreglo "proyectos"
-- sin tener que reescribir todo el documento JSON.
UPDATE estudiantes_avanzado
SET perfil = JSON_ARRAY_APPEND(
  perfil,
  '$.proyectos',
  JSON_OBJECT('nombre', 'Escaner de Puertos Basico', 'tecnologia', 'Python')
)
WHERE nombre = 'Andres Castro';
