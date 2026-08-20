## Analisis

**Datos del Desarrollador**
*   **Nombre:** Edgar Sánchez
*   **SGBD:** MySQL

**Descripción del Módulo**
Este módulo modela y resuelve relaciones de muchos a muchos (M:N) mediante la implementación de **Tablas Puente (Junction Tables)** en MySQL dentro del entorno de una Academia Tech. La solución permite conectar a estudiantes e instructores con sus respectivos cursos, almacenando atributos propios de la relación como la fecha de inscripción, el estado del estudiante y el rol docente.

**Organización y Decisiones Técnicas**
*   **Implementación de Tablas Puente (Relaciones M:N):**
    - Se crearon las tablas asociativas `matriculas_cursos` y `asignaciones_instructores`.
    - Ambas tablas puente utilizan claves primarias compuestas (`PRIMARY KEY (estudiante_id, curso_id)` e `PRIMARY KEY (instructor_id, curso_id)`), garantizando que un estudiante o instructor no pueda ser vinculado más de una vez al mismo curso.
    - Se añadieron atributos propios de la interacción en la tabla intermedia (`fecha_matricula`, `estado_matricula`, `monto_pagado_usd`, `rol`), evitando redundancias en los catálogos principales.
*   **Integridad Referencial y Dominio:**
    - Claves foráneas configuradas con `ON DELETE RESTRICT` y `ON UPDATE CASCADE` hacia las entidades primarias (`estudiantes`, `cursos`, `instructores`) para preservar el historial académico y la trazabilidad financiera.
    - Restricciones `CHECK` para costos e importes pagados no negativos ($\ge 0.00$) y enumeraciones cerradas para niveles de curso, estados de matrícula (`Activo`, `Completado`, `Retirado`) y roles de instrucción.
*   **Ausencia de Comentarios Internos:** Todas las sentencias DDL, DML y DQL se presentan totalmente limpias de comentarios en línea para dar estricto cumplimiento a los estándares técnicos del proyecto.