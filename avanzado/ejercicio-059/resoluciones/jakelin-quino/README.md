# Ejercicio 059 - Nivel Avanzado - Event Scheduler Marketplace Accesorios

## 1. Temática

Marketplace de accesorios con procedimiento alternativo al event scheduler.

## 2. Decisiones Técnicas

- **Diseño de Tablas (DDL):**
  - Tabla de productos: `ejercicio-059-adv-productos`.
  - Tabla de log: `ejercicio-059-adv_log`.
  - Uso de comillas invertidas para nombres con guiones.

- **Inserción de Datos (DML):**
  - 3 productos con stock inicial.
  - Procedimiento `sp_actualizar_stock` para actualizar stock y registrar.

- **Consultas (DQL):**
  - La consulta `1` muestra productos iniciales.
  - La consulta `2` ejecuta el procedimiento.
  - La consulta `3` muestra productos actualizados y log.
