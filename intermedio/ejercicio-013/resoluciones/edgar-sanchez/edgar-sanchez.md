## Analisis

**Datos del Desarrollador**
*   **Nombre:** Edgar Sánchez
*   **SGBD:** MySQL

**Descripción del Módulo**
Este módulo resuelve la modelación y consulta de relaciones M:N (Muchos a Muchos) mediante la implementación de una **Tabla Puente** (`peliculas_subgeneros`) dentro de un Catálogo de Películas de Miedo. La solución estructura adecuadamente entidades independientes y secundarias, permitiendo clasificar obras cinematográficas en múltiples subgéneros con atributos contextuales adicionales.

**Organización y Decisiones Técnicas**
*   **Diseño de la Tabla Puente (`peliculas_subgeneros`):**
    - Se estableció una clave primaria compuesta `PRIMARY KEY (pelicula_id, subgenero_id)` para garantizar que una película no duplique la asignación del mismo subgénero.
    - Se incluyó la columna discriminante `nivel_relevancia` (`Principal`, `Secundario`) como atributo propio de la relación.
*   **Estrategia de Integridad Referencial:**
    - `pelicula_id` posee `ON DELETE CASCADE` para limpiar de forma automática la tabla puente cuando se elimina una película del catálogo.
    - `subgenero_id` posee `ON DELETE RESTRICT` para evitar la eliminación accidental de un subgénero clasificador que esté siendo utilizado por películas registradas.
*   **Agregación y Transformación DQL:**
    - Uso de `GROUP_CONCAT()` para aplanar la relación M:N en un solo campo legible por cada película en los reportes.
    - Empleo de `LEFT JOIN` junto con `COALESCE()` para incluir estadísticas completas de todos los subgéneros registrados sin perder registros con recuento en cero.
*   **Ausencia de Comentarios Internos:** Todas las sentencias DDL, DML y DQL se presentan totalmente limpias de comentarios en línea cumpliendo estrictamente con las directrices fijadas.