# Ejercicio 044 - Nivel Avanzado - Event Scheduler Saga Ciencia Ficción (Alternativo)

## 1. Temática

Saga de ciencia ficción con procedimientos almacenados como alternativa al event scheduler.

## 2. Decisiones Técnicas

- **Diseño de Tablas (DDL):**
  - Tabla principal: `ejercicio-044-adv-peliculas`.
  - Tabla log: `ejercicio-044-adv_log` para auditoría.
  - Uso de comillas invertidas para nombres con guiones.

- **Alternativa al event scheduler:**
  - No requiere permisos especiales.
  - Usa procedimientos almacenados.
  - Se ejecuta manualmente cuando se necesita.

- **Procedimientos creados:**
  - `sp_actualizar_vistas`: Actualiza vistas y registra en log.
  - `sp_peliculas_antiguas`: Registra películas antiguas.

- **Ventajas de esta alternativa:**
  - No necesita permisos SUPER.
  - Más control sobre cuándo ejecutar.
  - Igual funcionalidad que eventos.
  - Fácil de probar y depurar.

- **Consultas (DQL):**
  - Ver datos antes y después.
  - Ejecutar procedimientos manualmente.
  - Ver log de operaciones.
  - Simular múltiples ejecuciones.
