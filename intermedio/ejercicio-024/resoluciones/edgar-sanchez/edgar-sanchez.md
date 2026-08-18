## Analisis

**Datos del Desarrollador**
*   **Nombre:** Edgar Sánchez
*   **SGBD:** MySQL

**Descripción del Módulo**
Este módulo ejercita la implementación de **Claves Foráneas (FOREIGN KEY)** e integridad referencial en MySQL aplicadas al control de calidad de procesos de soldadura industrial. La solución asegura la vinculación válida de transacciones de inspección con catálogos de tipos de soldadura, personal certificado y proyectos estructurales.

**Organización y Decisiones Técnicas**
*   **Modelado de Claves Foráneas (`FOREIGN KEY`):**
    - Se definieron tres reglas referenciales explícitas en la tabla transaccional `inspecciones_soldadura`: hacia `proyectos_estrucutras`, `soldadores` y `tipos_soldadura`.
    - Se utilizó la regla `ON DELETE RESTRICT` para evitar la eliminación accidental de soldadores, procesos o proyectos que cuenten con historial de inspección registrado.
    - Se aplicó `ON UPDATE CASCADE` para garantizar que cualquier actualización en las claves primarias de las tablas maestras se propague automáticamente a las inspecciones asociadas.
*   **Integridad de Dominio:**
    - Restricciones `CHECK` para validar longitudes de junta estrictamente positivas ($> 0.00$), costos no negativos ($\ge 0.00$) y estados de control de calidad acotados (`Aprobado`, `Rechazado`, `Requiere Reproceso`).
    - Claves únicas (`UNIQUE`) en códigos de certificación de soldadores y siglas de procesos técnicos.
*   **Ausencia de Comentarios Internos:** Todas las sentencias DDL, DML y DQL están presentadas totalmente libres de comentarios en línea para dar cumplimiento estricto a las directrices fijadas.