## Analisis

**Datos del Desarrollador**
*   **Nombre:** Edgar Sánchez
*   **SGBD:** MySQL

**Descripción del Módulo**
Este módulo resuelve la reestructuración y aplicación estricta de la **Primera Forma Normal (1FN)** en MySQL dentro del ámbito del Dibujo Digital. El diseño elimina la presencia de atributos multivaluados y grupos repetitivos (como listas de etiquetas o códigos de colores almacenados en cadenas separadas por comas), descomponiendo la estructura en tablas atómicas orientadas a una sola responsabilidad.

**Organización y Decisiones Técnicas**
*   **Cumplimiento de la Primera Forma Normal (1FN):**
    - Se extrajeron los datos no atómicos a dos tablas dependientes independientes: `ilustracion_etiquetas` e `ilustracion_paleta_colores`.
    - Cada fila almacena un único valor indivisible por columna (atomicidad de datos), estableciendo claves foráneas referenciadas a la tabla principal `ilustraciones`.
    - Se colocaron restricciones `UNIQUE` compuestas como `(ilustracion_id, nombre_etiqueta)` para prevenir duplicados a nivel de registro.
*   **Integridad Referencial y Dominio:**
    - `ON DELETE CASCADE` en las tablas de etiquetas y colores para limpiar automáticamente los atributos atómicos si la ilustración principal es eliminada.
    - Validaciones mediante `CHECK` para dimensiones en píxeles positivas, densidades de impresión válidas ($\ge 72$ DPI) y expresiones regulares (`REGEXP '^#[0-9A-Fa-f]{6}$'`) para validar el formato estándar de códigos de color HEX.
*   **Transformación y Reportabilidad (DQL):**
    - Uso de `GROUP_CONCAT()` en la consulta principal para reconstruir la vista consolidada de forma relacional y limpia sin violar la normalización en el almacenamiento.
*   **Ausencia de Comentarios Internos:** Todas las sentencias DDL, DML y DQL están totalmente libres de comentarios en línea, cumpliendo con las directrices técnicas fijadas.