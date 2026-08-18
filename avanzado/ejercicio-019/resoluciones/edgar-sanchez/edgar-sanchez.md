## Analisis

**Datos del Desarrollador**
*   **Nombre:** Edgar Sánchez
*   **SGBD:** MySQL

**Descripción del Módulo**
Este módulo implementa automatizaciones basadas en eventos mediante **Triggers (Disparadores)** en MySQL para un Centro de Paracaidismo. La solución garantiza la sincronización automática del histórico de saltos acumulados por paracaidista y el desgaste operativo de cada equipo de paracaidismo, además de alimentar una bitácora de auditoría detallada en operaciones `INSERT` y `DELETE`.

**Organización y Decisiones Técnicas**
*   **Control de Limpieza Previa DDL:**
    - Se incluyeron instrucciones `DROP TABLE IF EXISTS` ordenadas en secuencia estricta de dependencias inversas (`bitacora_auditoria_saltos` $\rightarrow$ `saltos_realizados` $\rightarrow$ `equipos_paracaidismo` / `paracaidistas` / `zonas_salto`) para permitir reejecuciones limpias e idempotentes.
    - Eliminación previa de disparadores con `DROP TRIGGER IF EXISTS` antes de su declaración.
*   **Implementación de Triggers Automatizados:**
    - `trg_after_insert_salto`: Disparador de tipo `AFTER INSERT` que incrementa en $+1$ la cantidad total de saltos del paracaidista y los saltos acumulados del equipo, registrando simultáneamente los detalles del salto en la tabla `bitacora_auditoria_saltos`.
    - `trg_after_delete_salto`: Disparador de tipo `AFTER DELETE` que revierte la acumulación aplicando `GREATEST(0, ...)` para prevenir saltos negativos si se anula o elimina un registro, dejando constancia del evento en auditoría.
*   **Integridad Referencial y Dominio:**
    - Claves foráneas configuradas con `ON DELETE RESTRICT` y `ON UPDATE CASCADE` en el registro de saltos para mantener la trazabilidad de los paracaidistas, equipos y zonas activas.
    - Restricciones `CHECK` para validar altitudes mayores a cero ($> 0$), tiempos de caída libre no negativos ($\ge 0$) y niveles de experiencia con categorías de licencia estándar.
*   **Ausencia de Comentarios Internos:** Código SQL completamente limpio de comentarios en línea dentro de los bloques ejecutables para cumplir de forma estricta los requerimientos técnicos establecidos.