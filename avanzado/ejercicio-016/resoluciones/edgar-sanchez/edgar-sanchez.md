## Analisis

**Datos del Desarrollador**
*   **Nombre:** Edgar Sánchez
*   **SGBD:** MySQL

**Descripción del Módulo**
Este módulo demuestra el control de **Transacciones ACID** en MySQL para un Restaurante de Comida Urbana. La solución asegura consistencia multitabla al procesar órdenes de compra de alimentos, deduciendo simultáneamente las existencias en inventario (`stock_disponible`) y descontando el costo total del monedero del cliente (`saldo_monedero`) dentro de bloques atómicos no fragmentables.

**Organización y Decisiones Técnicas**
*   **Control de Limpieza Previa DDL:**
    - Inclusión de instrucciones `DROP TABLE IF EXISTS` siguiendo el orden estricto de dependencias inversas (`detalles_orden` $\rightarrow$ `ordenes` $\rightarrow$ `productos_menu` / `clientes`) para asegurar la creación limpia y repetible de toda la arquitectura de la base de datos.
*   **Garantía de Atomicidad e Integridad en Transacciones:**
    - Bloques delimitados explícitamente mediante `START TRANSACTION` y `COMMIT`.
    - Captura dinámica de ID generado mediante `LAST_INSERT_ID()` para la inserción de registros en la tabla hija `detalles_orden`.
    - Actualización coordinada del inventario y del saldo de monedero de clientes. En caso de que alguna regla de integridad falle (como violar el `CHECK` de saldo o stock no negativo), la transacción detiene la ejecución permitiendo realizar `ROLLBACK` sin dejar datos en estados inconsistentes.
*   **Integridad Referencial y Dominio:**
    - Claves foráneas con restricción `ON DELETE RESTRICT` para evitar borrar productos o clientes activos, y `ON DELETE CASCADE` en los detalles asociados a una orden.
    - Validaciones mediante `CHECK` para impedir saldos o existencias negativas, asegurar precios estrictamente mayores a cero ($> 0.00$) y restringir los estados permitidos de la orden.
*   **Ausencia de Comentarios Internos:** Código SQL completamente libre de comentarios dentro de los bloques ejecutables de acuerdo con los lineamientos técnicos fijados.