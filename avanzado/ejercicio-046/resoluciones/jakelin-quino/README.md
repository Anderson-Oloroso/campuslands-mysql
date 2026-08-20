# Ejercicio 046 - Nivel Avanzado - Transacciones Restaurante Comida Urbana

## 1. Temática

Restaurante de comida urbana con transacciones para gestionar ventas e inventario.

## 2. Decisiones Técnicas

- **Diseño de Tablas (DDL):**
  - Tabla de inventario: `ejercicio-046-adv-inventario`.
  - Tabla de ventas: `ejercicio-046-adv-ventas`.
  - Uso de comillas invertidas para nombres con guiones.

- **Inserción de Datos (DML):**
  - 3 productos con cantidades iniciales.
  - Procedimiento `sp_vender` con transacción.

- **Consultas (DQL):**
  - La consulta `1` muestra inventario antes de vender.
  - La consulta `2` ejecuta las ventas con el procedimiento.
  - La consulta `3` muestra inventario actualizado.
  - La consulta `4` muestra historial de ventas.
