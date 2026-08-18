## Analisis

**Datos del Desarrollador**
*   **Nombre:** Edgar Sánchez
*   **SGBD:** MySQL

**Descripción del Módulo**
Este módulo ejercita el uso de la cláusula **LEFT JOIN** en MySQL dentro del contexto de una Tienda de Ropa. La solución combina la inclusión de entidades maestras (productos y clientes) con el historial transaccional de ventas, asegurando que los artículos sin ventas registradas o los clientes registrados que aún no han realizado compras permanezcan visibles en las métricas de inventario y conversión de clientes.

**Organización y Decisiones Técnicas**
*   **Uso de `LEFT JOIN` y Manejo de Nulos:**
    - La primera consulta utiliza `LEFT JOIN` con `ventas_ropa` para identificar artículos en catálogo con cero unidades vendidas (como el `Cinturón Cuero Clásico`), empleando `COALESCE()` para proyectar `0` y `0.00` en lugar de valores `NULL`.
    - La segunda consulta evalúa la conversión de clientes registrados vinculando la tabla `clientes_tienda` mediante `LEFT JOIN`, permitiendo detectar clientes inactivos (como `Mariano López`).
*   **Integridad Referencial y Dominio:**
    - Claves foráneas configuradas con `ON DELETE RESTRICT` y `ON UPDATE CASCADE` en los catálogos principales para proteger la trazabilidad de inventarios y transacciones.
    - Restricción `UNIQUE` compuesta sobre `(nombre_producto, talla, color)` para evitar registros duplicados de variantes del mismo artículo.
    - Validaciones `CHECK` para precios, montos e inventarios no negativos, así como listas cerradas para departamentos y tallas.
*   **Ausencia de Comentarios Internos:** Se omitieron comentarios dentro de los bloques SQL para entregar scripts totalmente limpios y listos para entornos profesionales.