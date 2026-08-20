## Analisis

**Datos del Desarrollador**
*   **Nombre:** Edgar Sánchez
*   **SGBD:** MySQL

**Descripción del Módulo**
Este módulo aborda la concurrencia y el control de coherencia mediante **Mecanismos de Bloqueo (Table Locking & Row Locking)** en MySQL para un Taller de Soldadura Industrial. La solución previene condiciones de carrera (*Race Conditions*) y lecturas sucias durante el cambio de estado de máquinas de soldar y proyectos críticos expuestos a revisiones de calidad simultáneas.

**Organización y Decisiones Técnicas**
*   **Control de Limpieza Previa DDL:**
    - Se agregaron instrucciones `DROP TABLE IF EXISTS` ordenadas en secuencia inversa a la jerarquía de dependencias relacionales (`inspecciones_soldadura` $\rightarrow$ `proyectos_soldadura` $\rightarrow$ `equipos_soldar` / `soldadores`) para garantizar ejecuciones idempotentes.
*   **Estrategia e Implementación de Bloqueos:**
    - **Bloqueo Explícito de Tabla (`LOCK TABLES ... WRITE`):** Utilizado para realizar operaciones masivas o cambios de estado globales exclusivos en `equipos_soldar` y `proyectos_soldadura`, previniendo modificaciones concurrentes de otras sesiones hasta ejecutar `UNLOCK TABLES`.
    - **Bloqueo de Filas Pesimista Extrahido (`FOR UPDATE`):** Implementado dentro de bloques `START TRANSACTION` para la actualización de proyectos. Bloquea de forma exclusiva las filas consultadas para evitar modificaciones paralelas antes de la confirmación (`COMMIT`).
    - **Bloqueo Compartido de Lectura (`FOR SHARE`):** Aplicado en consultas de verificación para permitir que múltiples usuarios lean el estado del equipo sin permitir modificaciones concurrentes.
*   **Integridad Referencial y Dominio:**
    - Claves foráneas configuradas con `ON DELETE RESTRICT` y `ON UPDATE CASCADE` en soldadores y equipos, y `ON DELETE CASCADE` en inspecciones.
    - Restricciones `CHECK` para limitar procesos de soldadura válidos (SMAW, GMAW, GTAW, FCAW), amperajes positivos y tipos de ensayos no destructivos.
*   **Ausencia de Comentarios Internos:** Código SQL ejecutable completamente exento de comentarios internos en cumplimiento directo con las reglas fijadas.