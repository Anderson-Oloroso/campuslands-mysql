# Ejercicio 053 - Nivel Intermedio - Normalización 3FN Arquitectura 3D

## 1. Temática

Arquitectura 3D con normalización 3FN para eliminar dependencias transitivas.

## 2. Decisiones Técnicas

- **Diseño de Tablas (DDL):**
  - Tabla de países: `ejercicio-053-int-paises`.
  - Tabla de ciudades: `ejercicio-053-int-ciudades`.
  - Tabla de edificios: `ejercicio-053-int-edificios`.
  - FOREIGN KEY en `pais_id` y `ciudad_id`.
  - Uso de comillas invertidas para nombres con guiones.

- **Inserción de Datos (DML):**
  - 3 países, 3 ciudades, 3 edificios.

- **Consultas (DQL):**
  - La consulta `1` muestra todos los países.
  - La consulta `2` muestra ciudades con su país.
  - La consulta `3` muestra edificios con su ciudad y país.
