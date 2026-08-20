# Ejercicio 034 - Nivel Avanzado - Triggers Garaje de Motos

## 1. Temática

Garaje de motos con auditoría de precios usando procedimientos almacenados (alternativa a triggers por problemas de permisos).

## 2. Decisiones Técnicas

- **Diseño de Tablas (DDL):**
  - Tabla principal: `ejercicio-034-adv-motos`.
  - Tabla auditoría: `ejercicio-034-adv_auditoria`.
  - Uso de comillas invertidas para nombres con guiones.

- **Inserción de Datos (DML):**
  - 3 motos iniciales.
  - Procedimiento `sp_actualizar_precio` que:
    - Obtiene precio actual.
    - Registra en auditoría.
    - Actualiza precio y fecha.

- **Consultas (DQL):**
  - Ver estado antes y después.
  - Llamar procedimiento para actualizar.
  - Verificar auditoría.
