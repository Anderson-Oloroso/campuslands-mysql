-- 1. Ver todos los edificios
SELECT * FROM `ejercicio-023-adv-edificios`;

-- 2. Ver usuarios y roles
SELECT username, rol FROM `ejercicio-023-adv_usuarios`;

-- 3. Mostrar permisos según rol
SELECT u.username, u.rol,
       CASE 
           WHEN u.rol = 'administrador' THEN 'SELECT, INSERT, UPDATE, DELETE'
           WHEN u.rol = 'editor' THEN 'SELECT, INSERT, UPDATE'
           WHEN u.rol = 'lector' THEN 'SELECT'
       END AS permisos
FROM `ejercicio-023-adv_usuarios` u;