## Analisis

**Datos del Desarrollador**
*   **Nombre:** Edgar Sánchez
*   **SGBD:** MySQL

**Descripción del Módulo**
Este módulo aborda el almacenamiento y la manipulación de datos semiestructurados mediante el tipo de dato nativo **JSON** en MySQL para un Catálogo de Películas de Miedo. La solución combina estructuras relacionales estricta para entidades principales con atributos JSON dinámicos (subgéneros, presupuestos, elementos de terror y reseñas desglosadas).

**Organización y Decisiones Técnicas**
*   **Control de Limpieza Previa DDL:**
    - Se incluyeron instrucciones `DROP TABLE IF EXISTS` siguiendo el orden inverso de las referencias cruzadas (`calificaciones_peliculas` $\rightarrow$ `peliculas_miedo` $\rightarrow$ `directores_cine` / `estudios_cinematograficos`) para permitir la ejecución repetible del script completo.
*   **Manipulación de Tipos y Funciones JSON:**
    - `JSON_EXTRACT()` / `->` y operando de extracción limpia `->>`: Empleados para extraer valores escalares como `subgenero`, `clasificacion` y métricas financieras directamente desde las columnas `JSON`.
    - `JSON_CONTAINS()`: Utilizado en la cláusula `WHERE` para filtrar películas que incluyan elementos de terror específicos (p. ej., "Cultos") dentro de un arreglo JSON sin requerir tablas puente M:N adicionales.
    - `JSON_OBJECT()` y `JSON_ARRAYAGG()`: Aplicados en la consulta analítica para agregar dinámicamente registros de calificaciones e integrarlos en un arreglo de objetos JSON condensado por película.
*   **Integridad Referencial y Dominio:**
    - Claves foráneas configuradas con `ON DELETE RESTRICT` y `ON UPDATE CASCADE` en directores y estudios, y `ON DELETE CASCADE` en las calificaciones relacionales.
    - Restricciones `CHECK` para garantizar duraciones positivas ($> 0$), años de estreno coherentes ($1900 \text{ a } 2026$) y puntuaciones continuas dentro de la escala $0.0 \text{ a } 10.0$.
*   **Ausencia de Comentarios Internos:** Código SQL totalmente desprovisto de comentarios dentro de los bloques ejecutables de acuerdo con la especificación técnica requerida.