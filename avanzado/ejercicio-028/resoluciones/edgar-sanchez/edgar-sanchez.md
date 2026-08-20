## Analisis

**Datos del Desarrollador**
*   **Nombre:** Edgar Sánchez
*   **SGBD:** MySQL

**Descripción del Módulo**
Este módulo implementa el uso del tipo de dato nativo **JSON en MySQL** para una Academia Técnica. Permite almacenar datos semiestructurados como temarios dinámicos de cursos, arreglos de habilidades de estudiantes, configuraciones de preferencias y entregas de proyectos en formato JSON, manteniendo la coherencia relacional mediante restricciones de integridad y consultas con funciones de extracción avanzadas (`JSON_EXTRACT`, `->>`, `JSON_CONTAINS`, `JSON_TABLE`).

**Organización y Decisiones Técnicas**
*   **Control de Limpieza Previa DDL:**
    - Se incorporaron instrucciones `DROP TABLE IF EXISTS` ordenadas según la jerarquía de dependencias (`entregas_proyectos` $\rightarrow$ `matriculas_cursos` $\rightarrow$ `perfiles_estudiantes` / `cursos_tecnicos` $\rightarrow$ `instructores`) para asegurar ejecuciones idempotentes sin conflictos de llaves foráneas.
*   **Uso Avanzado de Funciones y Operadores JSON:**
    - **Operador de extracción sin comillas (`->>`):** Se utilizó `p.preferencias_json->>'$.modalidad'` y `c.temario_json->>'$.proyecto_final'` para desglosar propiedades de objetos sin incluir comillas adicionales en las respuestas string.
    - **Búsqueda en colecciones JSON (`JSON_CONTAINS`):** Permite filtrar estudiantes que posean habilidades específicas dentro de arreglos JSON (ej. `JSON_CONTAINS(habilidades_json, '"SQL"')`).
    - **Proyección Relacional de Arreglos (`JSON_TABLE`):** Descompone la lista de módulos dentro de `temario_json` en filas tabulares relacionales estándar sin necesidad de código en la capa de aplicación.
*   **Integridad Referencial y Dominio:**
    - Claves foráneas configuradas con `ON DELETE CASCADE` para matrículas y entregas de proyectos, y `ON DELETE RESTRICT` para cursos e instructores.
    - Restricciones `CHECK` para restringir estados de matrícula y niveles de cursos.
*   **Ausencia de Comentarios Internos:** El código ejecutable en los bloques SQL se entrega completamente libre de comentarios internos en conformidad estricta con los parámetros del laboratorio.