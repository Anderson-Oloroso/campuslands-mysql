# Ejercicio 047 - Nivel Avanzado - Procedimientos Tienda de Ropa

## 1. Temática

Tienda de ropa con transacciones para gestionar ventas sin procedimientos.

## 2. Decisiones Técnicas

- **Diseño de Tablas (DDL):**
  - Tabla de productos: `ejercicio-047-adv-productos`.
  - Tabla de ventas: `ejercicio-047-adv-ventas`.
  - FOREIGN KEY en `producto_id` → `productos(id)`.
  - Uso de comillas invertidas para nombres con guiones.

- **Inserción de Datos (DML):**
  - 3 productos con stock inicial.

- **Consultas (DQL):**
  - La consulta `1` muestra productos iniciales.
  - La consulta `2` realiza ventas con transacciones START TRANSACTION/COMMIT.
  - La consulta `3` muestra productos y ventas actualizados.
