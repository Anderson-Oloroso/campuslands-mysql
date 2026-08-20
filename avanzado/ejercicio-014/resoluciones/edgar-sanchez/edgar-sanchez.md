## Analisis

**Datos del Desarrollador**
*   **Nombre:** Edgar Sánchez
*   **SGBD:** MySQL

**Descripción del Módulo**
Este módulo implementa la automatización periódica de tareas mediante el **Event Scheduler** en MySQL para un sistema de gestión en una Saga de Ciencia Ficción. La solución automatiza el paso de naves a mantenimiento tras cumplir sus misiones, la reducción programada de reservas críticas de la estación espacial y el registro transparente de auditoría en bitácora.

**Organización y Decisiones Técnicas**
*   **Control de Limpieza Previa DDL:**
    - Se incluyeron instrucciones `DROP TABLE IF EXISTS` en orden inverso a la jerarquía de dependencias (`bitacora_eventos_saga` $\rightarrow$ `recursos_estacion` $\rightarrow$ `misiones_espaciales` $\rightarrow$ `naves_espaciales` $\rightarrow$ `facciones_saga`), así como `DROP EVENT IF EXISTS` para garantizar la ejecución repetible del script desde cero.
*   **Implementación de Event Scheduler:**
    - Habilitación del motor con `SET GLOBAL event_scheduler = ON;`.
    - `evt_mantenimiento_diario_saga`: Evento diario con programación `EVERY 1 DAY` que evalúa misiones finalizadas y actualiza el estado operativo de las naves involucradas, registrando la cantidad de filas afectadas mediante `ROW_COUNT()`.
    - `evt_actualizar_recursos_saga`: Evento recurrentemente programado `EVERY 12 HOUR` que descuenta el consumo proporcional de insumos energéticos utilizando `GREATEST(0.00, ...)` para evitar balances negativos.
*   **Integridad Referencial y Dominio:**
    - Claves foráneas configuradas con `ON DELETE RESTRICT` y `ON UPDATE CASCADE` en el catálogo de naves y facciones para preservar la trazabilidad de la flota.
    - Restricciones `CHECK` para capacitar rangos de tecnología ($1 \text{ a } 10$), niveles de stock/carga no negativos ($\ge 0.00$) y dominios cerrados en estados de nave, misiones y prioridades.
*   **Ausencia de Comentarios Internos:** Código SQL limpio de comentarios dentro de los bloques ejecutables de acuerdo con la especificación técnica requerida.