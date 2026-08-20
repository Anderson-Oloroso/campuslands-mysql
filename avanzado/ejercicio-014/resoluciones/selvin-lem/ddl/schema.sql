-- Ejercicio 014 (Intermedio) - vistas simples para saga de ciencia ficcion
-- Ejecutar primero. Orden: schema.sql -> inserts.sql -> consultas.sql

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

CREATE TABLE entregas_saga_cf (
  id_entrega INT AUTO_INCREMENT,
  titulo VARCHAR(150) NOT NULL,
  numero_entrega INT NOT NULL,
  fecha_estreno DATE NOT NULL,
  duracion_minutos INT NOT NULL,
  estado ENUM('estrenada','proxima','cancelada') NOT NULL DEFAULT 'proxima',
  CONSTRAINT pk_entrega_saga_cf PRIMARY KEY (id_entrega),
  CONSTRAINT chk_int014_numero_entrega_valido CHECK (numero_entrega > 0)
);

-- Vista simple: solo entregas ya estrenadas
CREATE VIEW vista_entregas_estrenadas AS
SELECT titulo, numero_entrega, fecha_estreno, duracion_minutos
FROM entregas_saga_cf
WHERE estado = 'estrenada';

-- Vista simple: resumen agregado por saga (agrupado por titulo base sin numero)
CREATE VIEW vistas_resumen_saga AS
SELECT SUBSTRING_INDEX(titulo, ' ', 1) AS saga,
       COUNT(*) AS total_entregas,
       ROUND(AVG(duracion_minutos), 1) AS duracion_promedio
FROM entregas_saga_cf
WHERE estado = 'estrenada'
GROUP BY SUBSTRING_INDEX(titulo, ' ', 1);

DROP TABLE entregas_saga_cf;