# Ejercicio 039 - Nivel Avanzado - Bloqueos Kickboxing

## 1. Temática

Kickboxing con bloqueos de filas y tablas para controlar accesos concurrentes y evitar inconsistencias.

## 2. Decisiones Técnicas

- **Diseño de Tablas (DDL):**
  - Tabla principal: `ejercicio-039-adv-luchadores`.
  - Tabla auditoría: `ejercicio-039-adv_bitacora`.
  - Columnas con `saldo` y `ultima_actualizacion` para seguimiento.
  - Uso de comillas invertidas para nombres con guiones.

- **Tipos de bloqueos:**
  - **FOR UPDATE:** Bloqueo de fila en transacción.
  - **LOCK TABLES READ:** Bloqueo de lectura (solo lectura).
  - **LOCK TABLES WRITE:** Bloqueo de escritura (lectura/escritura).

- **Procedimiento `sp_actualizar_saldo`:**
  - Inicia transacción.
  - Bloquea fila con `FOR UPDATE`.
  - Actualiza saldo.
  - Registra en bitácora.
  - Maneja errores con `ROLLBACK`.

- **Ventajas de bloqueos:**
  - Evita condiciones de carrera.
  - Garantiza consistencia en operaciones concurrentes.
  - Permite transacciones seguras.

- **Consultas (DQL):**
  - Ver estado antes y después.
  - Llamar procedimiento con bloqueo.
  - Pruebas de bloqueos de lectura/escritura.
