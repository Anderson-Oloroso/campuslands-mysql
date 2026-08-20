## Analisis

**Datos del Desarrollador**
*   **Nombre:** Edgar Sánchez
*   **SGBD:** MySQL

**Descripción del Módulo**
Este módulo resuelve la evaluación de indicadores operacionales y financieros mediante el uso de **Subconsultas (Subqueries)** en MySQL aplicadas a un Estudio de Tatuajes. La solución aplica subconsultas escalares, correlacionadas y de lista (`IN`) para filtrar servicios por encima del promedio del negocio y calcular métricas acumuladas directamente sobre cada artista registrado.

**Organización y Decisiones Técnicas**
*   **Uso de Subconsultas Operacionales:**
    - La primera consulta utiliza una **Subconsulta Escalar** en la cláusula `WHERE` para determinar dinámicamente el costo promedio global de las citas completadas, comparando y aislando aquellos trabajos que superan la media de facturación del estudio.
    - La segunda consulta combina una **Subconsulta Correlacionada** en la proyección `SELECT` para calcular citas e ingresos totales por artista, junto con una **Subconsulta en `WHERE` (`IN`)** para filtrar únicamente a los tatuadores que poseen al menos un trabajo finalizado.
*   **Integridad Referencial y Dominio:**
    - Claves foráneas configuradas con `ON DELETE RESTRICT` y `ON UPDATE CASCADE` en toda la estructura relacional para resguardar la trazabilidad de citas y pagos.
    - Validaciones `CHECK` para tarifas por hora, duraciones estimadas y montos strictly positivos, así como dominios cerrados para estados de cita (`Programada`, `Completada`, `Cancelada`) y métodos de pago (`Efectivo`, `Tarjeta`, `Transferencia`).
*   **Ausencia de Comentarios Internos:** Todas las sentencias DDL, DML y DQL se presentan totalmente limpias de comentarios en línea para dar estricto cumplimiento a los estándares técnicos del proyecto.