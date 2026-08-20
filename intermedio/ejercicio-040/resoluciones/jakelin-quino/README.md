# Ejercicio 040 - Nivel Intermedio - UNIQUE Carreras Urbanas

## 1. Temática

Carreras urbanas con restricciones UNIQUE para evitar duplicados en emails, nombres compuestos y eventos.

## 2. Decisiones Técnicas

- **Diseño de Tablas (DDL):**
  - Tabla de corredores: `ejercicio-040-int-corredores`.
  - Tabla de carreras: `ejercicio-040-int_carreras`.
  - Uso de comillas invertidas para nombres con guiones.

- **Restricciones UNIQUE aplicadas:**
  - `email` UNIQUE: Cada corredor tiene email único.
  - `UNIQUE KEY idx_nombre_apellido`: Combinación nombre+apellido única.
  - `UNIQUE KEY idx_carrera_fecha`: Combinación nombre_carrera+fecha única.

- **Ventajas de UNIQUE:**
  - Evita datos duplicados.
  - Mantiene integridad de datos.
  - Funciona como índice para mejorar velocidad.
  - Permite UNIQUE compuesto (múltiples columnas).

- **Inserción de Datos (DML):**
  - 8 corredores con emails únicos.
  - 4 carreras con combinaciones únicas.
  - Comentarios con ejemplos de errores por duplicados.

- **Consultas (DQL):**
  - SHOW INDEX para ver restricciones.
  - Verificación de integridad con GROUP BY.
