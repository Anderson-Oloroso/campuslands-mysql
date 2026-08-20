## Analisis

**Datos del Desarrollador**
*   **Nombre:** Edgar Sánchez
*   **SGBD:** MySQL

**Descripción del Módulo**
Este módulo resuelve la creación y consulta de **Vistas Simples (VIEW)** en MySQL aplicadas al flujo operativo de un Marketplace de Accesorios. Las vistas abstraen la complejidad de joins multidimensionales y proporcionan capas de seguridad accesibles para consultas frecuentes del catálogo público e indicadores clave de ventas por tienda.

**Organización y Decisiones Técnicas**
*   **Implementación de Vistas Simples y Analíticas:**
    - `vw_catalogo_disponible`: Filtra y consolida los artículos cuyo stock es mayor a cero ($> 0$), simplificando la exposición del inventario hacia el frontend o aplicaciones cliente sin revelar las claves foráneas subyacentes.
    - `vw_resumen_ventas_vendedor`: Agrupa métricas de negocio por tienda, calculando el total de órdenes en estados efectivos (`Enviado`, `Entregado`), unidades vendidas e ingresos brutos generados.
*   **Integridad Referencial y Dominio:**
    - Claves foráneas estructuradas con `ON DELETE RESTRICT` y `ON UPDATE CASCADE` en el catálogo central para proteger la trazabilidad comercial de vendedores y categorías.
    - `ON DELETE CASCADE` en `detalle_orden` para eliminar los renglones si se cancela o remueve la cabecera de la orden.
    - Restricciones `CHECK` para precios y cantidades mayores a cero, stock no negativo ($\ge 0$) y estados de orden dentro de un dominio discreto.
*   **Ausencia de Comentarios Internos:** Todas las sentencias DDL, DML y DQL se presentan totalmente limpias de comentarios en línea para dar estricto cumplimiento a los estándares fijados.