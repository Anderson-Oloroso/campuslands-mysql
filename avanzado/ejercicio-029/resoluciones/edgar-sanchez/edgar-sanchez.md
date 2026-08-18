## Analisis

**Datos del Desarrollador**
*   **Nombre:** Edgar Sánchez
*   **SGBD:** MySQL

**Descripción del Módulo**
Este módulo implementa la automatización de tareas en segundo plano mediante **Event Scheduler en MySQL** para un Marketplace de Accesorios. Permite programar mantenimientos periódicos sobre la base de datos, como la desactivación automática de cupones de descuento vencidos y la cancelación de pedidos pendientes que exceden el tiempo límite de pago, registrando cada ejecución en una tabla de auditoría dedicada.

**Organización y Decisiones Técnicas**
*   **Control de Limpieza Previa DDL:**
    - Inclusión de sentencias `DROP TABLE IF EXISTS` y `DROP EVENT IF EXISTS` ordenadas según dependencias (`auditoria_eventos_tienda` / `cupones_descuento` / `pedidos_detalles` $\rightarrow$ `pedidos_cabecera` $\rightarrow$ `productos_accesorios` / `usuarios_clientes`) para garantizar despliegues limpios y repetibles.
*   **Configuración y Automatización de Eventos:**
    - **Activación Global:** Habilitación explícita del motor de eventos mediante `SET GLOBAL event_scheduler = ON;`.
    - **Procesamiento de Cupones Vencidos (`evt_expirar_cupones_vencidos`):** Evento programado con frecuencia diaria (`EVERY 1 DAY`) que actualiza a `'Expirado'` aquellos cupones cuya fecha límite sea inferior al instante actual (`NOW()`).
    - **Cancelación de Pedidos Expirados (`evt_cancelar_pedidos_inactivos`):** Evento ejecutado cada hora (`EVERY 1 HOUR`) que evalúa los pedidos en estado `'Pendiente'` con más de 24 horas de antigüedad (`NOW() - INTERVAL 24 HOUR`) y los marca como `'Cancelado_Expirado'`.
    - **Trazabilidad de Ejecución:** Cada evento calcula las filas modificadas mediante `ROW_COUNT()` e inserta una bitácora en `auditoria_eventos_tienda`.
*   **Integridad Referencial y Dominio:**
    - Claves foráneas configuradas con `ON DELETE CASCADE` en la relación maestro-detalle de pedidos y `ON DELETE RESTRICT` en la relación de clientes y productos.
    - Restricciones `CHECK` para validar rangos de porcentaje de descuento ($1\% \text{ a } 100\%$), precios unitarios positivos y estados permitidos.
*   **Ausencia de Comentarios Internos:** El código ejecutable entregado en los bloques SQL se presenta totalmente libre de comentarios internos, cumpliendo en su totalidad los requerimientos fijados.