# Ejercicio 040 - Nivel Avanzado - Backup Lógico Carreras Urbanas

## 1. Temática

Carreras urbanas con sistema de backup simple usando tablas duplicadas.

## 2. Decisiones Técnicas

- **Diseño de Tablas (DDL):**
  - Tabla principal: `ejercicio-040-adv-corredores`.
  - Tabla backup: `ejercicio-040-adv-corredores_backup` (misma estructura).
  - Tabla historial: `ejercicio-040-adv-backups`.
  - Uso de comillas invertidas para nombres con guiones.

- **Método de backup (sin procedimientos):**
  - `INSERT INTO ... SELECT`: Copia todos los datos.
  - `INSERT INTO ... SELECT COUNT(*)`: Registra en historial.
  - Restauración con `INSERT SELECT` desde backup.

- **Ventajas:**
  - Sin procedimientos complicados.
  - Sin privilegios especiales.
  - Fácil de entender.
  - Copia exacta de datos.

- **Pasos:**
  1. Crear tabla backup con misma estructura.
  2. Copiar datos con INSERT SELECT.
  3. Restaurar cuando sea necesario.
