## Analisis

**Datos del Desarrollador**
*   **Nombre:** Edgar Sánchez
*   **SGBD:** MySQL

**Descripción del Módulo**
Este módulo ejercita el uso de la cláusula **INNER JOIN** en MySQL aplicada a un Restaurante de Comida Urbana. La solución conecta las entidades de catálogo (categorías, productos, mesas) con la capa transaccional de ventas (órdenes y detalles de orden) para extraer relaciones precisas entre consumo, meseros, zonas de servicio y productos más vendidos.

**Organización y Decisiones Técnicas**
*   **Uso Extensivo de `INNER JOIN`:**
    - La primera consulta vincula 5 tablas relacionales (`ordenes_restaurante`, `mesas_restaurante`, `detalles_orden_comida`, `productos_comida`, `categorias_menu`) para obtener una vista detallada de la comandas.
    - La segunda consulta combina las tablas de detalles, productos y categorías filtrando únicamente las órdenes finalizadas (`Atendida`) mediante agregaciones `SUM()`.
*   **Integridad Referencial y Dominio:**
    - Claves foráneas configuradas con `ON DELETE RESTRICT` para catálogos y `ON DELETE CASCADE` para las líneas de detalle asociadas a cada orden.
    - Restricción `UNIQUE` en `(orden_id, producto_id)` dentro de `detalles_orden_comida` para evitar registros duplicados del mismo producto en una misma comanda.
    - Validaciones `CHECK` para precios, cantidades y capacidades positivas, así como dominios para estados de orden y zonas del restaurante.
*   **Ausencia de Comentarios Internos:** Todas las sentencias DDL, DML y DQL se presentan totalmente limpias de comentarios en línea para dar estricto cumplimiento a las directrices fijadas.