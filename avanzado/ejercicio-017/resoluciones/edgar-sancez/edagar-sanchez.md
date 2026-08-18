## Analisis

**Datos del Desarrollador**
*   **Nombre:** Edgar Sánchez
*   **Fecha de ejecución:** 18/08/2026
*   **SGBD:** MySQL

**Descripción del Módulo**
Este módulo implementa lógica de negocio encapsulada mediante **Procedimientos Almacenados (Stored Procedures)** en MySQL para una Tienda de Ropa. La solución automatiza el flujo completo de venta (validación de existencias, deducción de stock, generación de comprobantes y asignación de puntos de fidelidad) y la reposición de inventario de manera transaccional y segura.

**Organización y Decisiones Técnicas**
*   **Control de Limpieza Previa DDL:**
    - Inclusión de instrucciones `DROP TABLE IF EXISTS` en orden estrictamente inverso a las relaciones de clave foránea (`ventas_detalle` $\rightarrow$ `ventas` $\rightarrow$ `prendas_inventario` $\rightarrow$ `categorias_ropa` / `clientes_tienda`), asegurando ejecuciones repetibles e idempotentes.
    - Eliminación preventiva de procedimientos con `DROP PROCEDURE IF EXISTS` antes de su creación.
*   **Encapsulación de Lógica de Negocio en Stored Procedures:**
    - `sp_registrar_venta_ropa`: Valida stock y parámetros con etiquetas `LEAVE`. En caso de ser válido, inicia un bloque `START TRANSACTION` / `COMMIT` para insertar la venta, registrar el detalle, descontar las prendas e incrementar los puntos del programa de fidelización ($\lfloor \text{Subtotal} / 10 \rfloor$).
    - `sp_reponer_stock_prenda`: Facilita la reposición controlada de existencias garantizando atomicidad y devolviendo el stock actualizado a través de un parámetro `OUT`.
*   **Integridad Referencial y Dominio:**
    - Claves foráneas configuradas con `ON DELETE RESTRICT` para catálogos críticos y `ON DELETE CASCADE` en los detalles de venta.
    - Restricciones `CHECK` para evitar precios cero o negativos ($> 0.00$), asegurar inventario no negativo ($\ge 0$) y acotar los puntos acumulados.
*   **Ausencia de Comentarios Internos:** Código SQL completamente limpio de comentarios en línea dentro de los bloques ejecutables de acuerdo con el estándar técnico especificado.