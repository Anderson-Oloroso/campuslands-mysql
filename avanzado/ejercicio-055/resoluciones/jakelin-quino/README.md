# Ejercicio 055 - Nivel Avanzado - Backup Lógico Laboratorio Fórmulas Químicas

## 1. Temática

Laboratorio de fórmulas químicas con backup lógico usando tablas duplicadas.

## 2. Decisiones Técnicas

- **Diseño de Tablas (DDL):**
  - Tabla principal: `ejercicio-055-adv-compuestos`.
  - Tabla de backup: `ejercicio-055-adv-backup` para historial.
  - Uso de comillas invertidas para nombres con guiones.

- **Método de backup:**
  - `CREATE TABLE ... SELECT`: Copia exacta de datos.
  - Registro en tabla de historial.

- **Inserción de Datos (DML):**
  - 3 compuestos iniciales.
  - Backup creado y registrado.

- **Consultas (DQL):**
  - La consulta `1` muestra datos originales.
  - La consulta `2` muestra el backup creado.
  - La consulta `3` muestra el historial de backups.
