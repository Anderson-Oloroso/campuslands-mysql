## Analisis

**Datos del Desarrollador**
*   **Nombre:** Edgar Sánchez
*   **SGBD:** MySQL

**Descripción del Módulo**
Este módulo practica la creación, abstracción y consulta de **Vistas Simples (`CREATE VIEW`)** en MySQL aplicadas al universo de Sagas de Ciencia Ficción. La solución desacopla la complejidad de las consultas compuestas (`JOIN`, `GROUP BY`, agregares) mediante objetos de vista reutilizables que simplifican el acceso a los datos por parte de otros desarrolladores y reportes.

**Organización y Decisiones Técnicas**
*   **Implementación de Vistas (`vw_resumen_personajes_scifi` y `vw_indicadores_sagas_scifi`):**
    - `vw_resumen_personajes_scifi`: Encapsula la unión relacional entre personajes, sus planetas de origen y las sagas correspondientes, exponiendo una interfaz simplificada para consultas frecuentes de personajes.
    - `vw_indicadores_sagas_scifi`: Consolida métricas agregadas mediante `LEFT JOIN` y funciones de conteo diferenciado (`COUNT(DISTINCT ...)`), proyectando la cantidad de entidades registradas por universo narrativo.
*   **Estrategia de Integridad Referencial y Dominio:**
    - Claves foráneas configuradas con `ON DELETE RESTRICT` y `ON UPDATE CASCADE` en toda la jerarquía relacional.
    - Restricciones `CHECK` para rangos operacionales (año de inicio de saga, capacidad de tripulación y velocidades superiores a cero).
    - Restricción `UNIQUE` compuesta en `(saga_id, nombre_planeta)` para prevenir registros repetidos.
*   **Ausencia de Comentarios Internos:** Todas las sentencias DDL, DML y DQL se presentan totalmente limpias de comentarios en línea para dar estricto cumplimiento a los estándares fijados.