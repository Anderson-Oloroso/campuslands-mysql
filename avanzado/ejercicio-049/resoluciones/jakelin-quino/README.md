# Ejercicio 049 - Nivel Avanzado - Triggers Paracaidismo

## 1. Temática

Paracaidismo con procedimiento almacenado para insertar saltos y registrar en log.

## 2. Decisiones Técnicas

- **Diseño de Tablas (DDL):**
  - Tabla de saltos: `ejercicio-049-adv-saltos`.
  - Tabla de log: `ejercicio-049-adv-log`.
  - Uso de comillas invertidas para nombres con guiones.

- **Inserción de Datos (DML):**
  - 2 saltos iniciales.
  - Procedimiento `sp_insertar_salto` que inserta en ambas tablas.

- **Consultas (DQL):**
  - La consulta `1` muestra saltos actuales.
  - La consulta `2` inserta un nuevo salto usando el procedimiento.
  - La consulta `3` muestra el log con el registro automático.
