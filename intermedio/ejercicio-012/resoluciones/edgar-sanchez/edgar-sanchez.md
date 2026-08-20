## Analisis

**Datos del Desarrollador**
*   **Nombre:** Edgar Sánchez

*   **SGBD:** MySQL

**Descripción del Módulo**
Este módulo aborda la generación de **Consultas de Reportes** en MySQL aplicadas al ecosistema de una plataforma de Playlists Musicales. La solución consolida métricas clave agregando datos entre usuarios, listas de reproducción, detalles de contenido y artistas, ofreciendo visión técnica sobre la estructura del catálogo y hábitos de consumo.

**Organización y Decisiones Técnicas**
*   **Estructura y Reportabilidad (DQL):**
    - Uso de funciones de agregación (`COUNT`, `SUM`) combinadas con agregación condicional (`SUM(CASE WHEN ...)` ) para clasificar contenido explícito en un solo barrido de tabla.
    - Operaciones aritméticas y redondeo (`ROUND`, `/ 60.0`) para transformar unidades base (segundos) en indicadores legibles de negocio (minutos).
    - Empleo de `COUNT(DISTINCT ...)` para métricas precisas sin duplicados derivados de uniones interactivas.
*   **Integridad Referencial y Dominio:**
    - Claves foráneas configuradas con `ON DELETE CASCADE` en la relación usuario-playlist y `ON DELETE RESTRICT` en el catálogo de canciones/artistas.
    - Restricción `UNIQUE` en `(playlist_id, cancion_id)` para evitar canciones duplicadas por lista y `(playlist_id, orden_reproduccion)` para garantizar secuencia lineal.
*   **Ausencia de Comentarios Internos:** Todas las sentencias DDL, DML y DQL se presentan totalmente limpias de comentarios en línea para dar estricto cumplimiento a las directrices técnicas.