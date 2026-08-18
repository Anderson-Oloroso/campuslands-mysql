## Analisis

**Datos del Desarrollador**
*   **Nombre:** Edgar Sánchez
*   **SGBD:** MySQL

**Descripción del Módulo**
Este módulo se enfoca en el diagnóstico, análisis y optimización del rendimiento de consultas SQL mediante el comando **EXPLAIN** en MySQL para una plataforma de Dibujo Digital. La solución permite inspeccionar la ruta del optimizador de consultas, asegurando que las búsquedas por proyectos, artistas, capas y herramientas utilicen índices apropiados y minimicen la inspección de registros.

**Organización y Decisiones Técnicas**
*   **Control de Limpieza Previa DDL:**
    - Se incluyeron instrucciones `DROP TABLE IF EXISTS` ordenadas según las relaciones de clave foránea (`capas_proyecto` $\rightarrow$ `proyectos_dibujo` $\rightarrow$ `pinceles_herramientas` / `artistas_digitales`) para garantizar un entorno repetible.
*   **Estrategia de Optimización e Inspección con EXPLAIN:**
    - `EXPLAIN` en consulta de artista y estado: Demuestra el uso del índice compuesto `idx_proyectos_artista_estado`, permitiendo un acceso directo de tipo `ref` y reduciendo el costo de inspección.
    - `EXPLAIN` en consulta por rango de fechas: Verifica la utilización del índice `idx_proyectos_fecha` para la filtración de fechas y el ordenamiento sin incurrir en `Using filesort`.
    - `EXPLAIN` en capas por modo de fusión: Evalúa el comportamiento del índice compuesto `idx_capas_proyecto_fusion` para extraer de manera directa las capas activas de un lienzo especifico.
*   **Integridad Referencial y Dominio:**
    - Claves foráneas configuradas con `ON DELETE CASCADE` en las capas asociadas a un lienzo borrado y `ON DELETE SET NULL` para pinceles retirados del catálogo.
    - Validaciones `CHECK` para restringir dimensiones de lienzo a valores positivos ($> 0$), resolución mínima de trabajo ($\ge 72 \text{ DPI}$) y porcentajes de opacidad válidos ($0.00\% \text{ a } 100.00\%$).
*   **Ausencia de Comentarios Internos:** El script SQL presentado está completamente libre de comentarios dentro de los bloques ejecutables, cumpliendo con los estándares de entrega del ejercicio.