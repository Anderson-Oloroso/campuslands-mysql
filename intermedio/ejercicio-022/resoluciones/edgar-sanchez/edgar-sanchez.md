## Analisis

**Datos del Desarrollador**
*   **Nombre:** Edgar Sánchez
*   **SGBD:** MySQL

**Descripción del Módulo**
Este módulo resuelve la estructuración y aplicación formal de la **Segunda Forma Normal (2FN)** en MySQL dentro del ámbito de Animación 3D. El diseño asegura previamente el cumplimiento de la 1FN y elimina dependencias parciales en claves compuestas, garantizando que todos los atributos no clave dependan de la totalidad de la clave primaria.

**Organización y Decisiones Técnicas**
*   **Cumplimiento de la Segunda Forma Normal (2FN):**
    - En la tabla de relación M:N `asignaciones_proyecto`, la clave primaria es compuesta: `PRIMARY KEY (proyecto_id, artista_id)`.
    - Los atributos `rol_en_proyecto` y `horas_asignadas` dependen completamente de la combinación de ambos identificadores (la asignación específica de ese artista a ese proyecto).
    - Atributos propios del artista (`nombre_artista`, `especialidad`, `correo`) o del proyecto (`titulo_proyecto`, `presupuesto_usd`) fueron desacoplados a sus respectivas tablas independientes (`artistas_3d` y `proyectos_3d`), eliminando redundancias y dependencias funcionales parciales.
*   **Integridad Referencial y Dominio:**
    - `ON DELETE CASCADE` configurado exclusivamente en `asignaciones_proyecto` para desvincular automáticamente los roles si se remueve un proyecto.
    - `ON DELETE RESTRICT` y `ON UPDATE CASCADE` en catálogos y entidades primarias para resguardar la trazabilidad de los proyectos y profesionales de animación.
    - Validaciones `CHECK` para presupuestos no negativos, duraciones en segundos positivas y restricciones discretas en roles y especialidades.
*   **Ausencia de Comentarios Internos:** Todas las sentencias DDL, DML y DQL se presentan totalmente limpias de comentarios en línea para dar estricto cumplimiento a los estándares fijados.