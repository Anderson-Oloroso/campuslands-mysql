## Analisis

**Datos del Desarrollador**
*   **Nombre:** Edgar Sánchez
*   **SGBD:** MySQL

**Descripción del Módulo**
Este módulo resuelve la reestructuración y aplicación de la **Tercera Forma Normal (3FN)** en MySQL para el contexto de Arquitectura 3D. El objetivo del modelo es eliminar las dependencias transitivas, asegurando que cada columna no clave dependa únicamente y de forma directa de la clave primaria de su respectiva tabla.

**Organización y Decisiones Técnicas**
*   **Cumplimiento de la Tercera Forma Normal (3FN):**
    - Se aisló la información de las firmas de arquitectura (`firmas_arquitectura`) separándola de los datos del arquitecto (`arquitectos_3d`). Esto elimina la dependencia transitiva donde el nombre o ubicación de la firma dependía del arquitecto y no directamente de la entidad clave.
    - Los datos del cliente (`clientes_arquitectura`) y las especificaciones del proyecto (`proyectos_3d`) se desacoplaron totalmente.
    - Se extrajeron los entregables visuales a la tabla `entregables_render` dependiente del proyecto, garantizando atomicidad y consistencia en los productos finales.
*   **Integridad Referencial y Dominio:**
    - Claves foráneas configuradas con `ON DELETE RESTRICT` y `ON UPDATE CASCADE` en el núcleo operacional, asegurando trazabilidad entre firmas, arquitectos, clientes y proyectos.
    - `ON DELETE CASCADE` en `entregables_render` para remover los productos visuales asociados si se elimina la ficha de un proyecto.
    - Restricciones `CHECK` para áreas de construcción y presupuestos positivos, así como valores válidos para especialidades y formatos de entregable.
*   **Ausencia de Comentarios Internos:** Todas las sentencias DDL, DML y DQL están totalmente libres de comentarios en línea para dar estricto cumplimiento a las directrices técnicas fijadas.