-- Carga de datos: primero aterrizan los datos crudos (con espacios,
-- mayusculas inconsistentes y duplicados, como llegarian de un CSV
-- real) y luego se limpian hacia la tabla final con INSERT ... SELECT.
--
-- Nota sobre LOAD DATA INFILE: la forma "clasica" de cargar un CSV
-- masivo seria
--   LOAD DATA INFILE '/var/lib/mysql-files/usuarios.csv'
--   INTO TABLE usuarios_staging_intermedio
--   FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n';
-- pero eso requiere el privilegio FILE, que el usuario 'campus' del
-- docker-compose de este repo NO tiene (solo tiene ALL PRIVILEGES
-- sobre el esquema, no privilegios globales). Lo confirme al probarlo:
--   ERROR 1045 (28000): Access denied for user 'campus'@'%'
-- Como root si funciona (root tiene el privilegio FILE), pero para
-- mantener esta resolucion ejecutable con el usuario normal del
-- proyecto, la carga masiva se hace con INSERT multi-fila + limpieza
-- via INSERT ... SELECT, que es igual de valido para practicar el
-- flujo de "carga de datos" (staging -> validacion -> tabla final).
USE campuslands_mysql;

INSERT INTO usuarios_staging_intermedio (nombre_usuario, plataforma, juegos_totales, pais) VALUES
(' NightOwlGamer ', 'PC', '48', 'Colombia'),
('pixelqueen', 'playstation', '32', 'Mexico'),
('NightOwlGamer', 'Pc', '48', 'Colombia'),
('  RetroArcadeFan', 'switch', '', 'Argentina'),
('CodeAndPlay', 'Xbox', '21', 'Peru'),
('pixelqueen ', 'PlayStation', '32', 'Mexico'),
('', 'pc', '9', 'Chile'),
('LunaGamerPro', 'movil', '15', 'Colombia'),
('CodeAndPlay', 'xbox', '21', 'Peru');

-- Limpieza y carga hacia la tabla final:
-- - TRIM quita espacios sueltos.
-- - LOWER normaliza la plataforma para que calce con el ENUM.
-- - CAST convierte el texto a numero.
-- - DISTINCT colapsa los duplicados que quedaron identicos tras limpiar.
-- - El WHERE descarta filas con nombre vacio o juegos_totales no numericos.
INSERT INTO usuarios_intermedio (nombre_usuario, plataforma, juegos_totales, pais)
SELECT DISTINCT
  TRIM(nombre_usuario),
  LOWER(TRIM(plataforma)),
  CAST(TRIM(juegos_totales) AS UNSIGNED),
  TRIM(pais)
FROM usuarios_staging_intermedio
WHERE TRIM(nombre_usuario) <> ''
  AND TRIM(juegos_totales) REGEXP '^[0-9]+$';
