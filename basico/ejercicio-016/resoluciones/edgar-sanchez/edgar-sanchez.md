## Analisis

**Datos del Desarrollador**
*   **Nombre:** Edgar Sánchez
*   **Fecha de ejecución:** 18/08/2026
*   **SGBD:** MySQL

**Descripción del Módulo**
Este módulo resuelve la estructura y creación de tablas (`CREATE TABLE`) para la gestión operativa de un Restaurante de Comida Urbana. Permite almacenar el menú por categorías, datos de clientes, cabeceras de órdenes y sus respectivos detalles, asegurando la trazabilidad de consumo y la correcta definición de los tipos de datos desde el nivel base.

**Organización y Decisiones Técnicas**
*   **Definición Estructurada DDL:** Se aplicaron restricciones DDL explícitas (`NOT NULL`, `UNIQUE`, `PRIMARY KEY`, `AUTO_INCREMENT` y `CHECK`) para garantizar la calidad de los datos de menú y pedidos desde la creación del esquema.
*   **Estrategia Relacional y Normalización:** Se separaron las cabeceras de pedido (`ordenes_pedidos`) de sus líneas operativas (`detalles_orden`), implementando una clave única compuesta lógica `uq_orden_platillo` para evitar productos duplicados en una misma orden.
*   **Acciones Referenciales Integrales:**
    - `ON DELETE RESTRICT` en entidades primarias (categorías, platillos, clientes) para evitar eliminaciones accidentales que rompan el historial transaccional.
    - `ON DELETE CASCADE` en `detalles_orden` asociadas a `ordenes_pedidos` para mantener la consistencia de borrado en caso de anulación de cabecera.
*   **Ausencia de Comentarios Internos:** Todas las sentencias del script SQL fueron generadas sin comentarios en línea, acatando los requerimientos técnicos del proyecto.