## Analisis

**Datos del Desarrollador**
*   **Nombre:** Edgar Sánchez   
*   **SGBD:** MySQL

**Descripción del Módulo**
Este módulo optimiza la velocidad de respuesta de las consultas críticas en la base de datos de un **Estudio de Tatuajes** mediante la creación y evaluación estratégica de **Índices Secundarios B-Tree**. La estructura optimiza la agenda de citas, la disponibilidad del cronograma por artista y la búsqueda de diseños dentro del catálogo, reduciendo el escaneo de filas (*Full Table Scan*) a búsquedas de rango (*range scan*) y ref (*ref/eq_ref*).

**Organización y Decisiones Técnicas**
*   **Control de Limpieza Previa DDL:**
    - Inclusión de instrucciones `DROP TABLE IF EXISTS` siguiendo el orden estricto de dependencias inversas (`citas_tatuajes` $\rightarrow$ `disenos_catalogo` $\rightarrow$ `tatuadores` / `clientes_estudio`) para garantizar un entorno de prueba limpio y repetible.
*   **Estrategia e Implementación de Índices:**
    - `idx_citas_fecha_estado` `(fecha_cita, estado_cita)`: Optimiza la búsqueda de la agenda diaria/mensual filtrando por rangos de fecha y estado de las citas sin realizar escaneo completo.
    - `idx_citas_tatuador_fecha` `(tatuador_id, fecha_cita)`: Índice compuesto diseñado para acelerar la agenda individual de cada tatuador y resolver el ordenamiento `ORDER BY fecha_cita` mediante el árbol de índices.
    - `idx_citas_cliente` `(cliente_id)`: Facilita la consulta de historial de citas y frecuencia de visitas por cliente.
    - `idx_disenos_estilo_precio` `(estilo, precio_estimado)`: Permite búsquedas combinadas eficientes en el catálogo por categoría de estilo artístico y rango de presupuesto.
*   **Análisis del Plan de Ejecución (`EXPLAIN`):**
    - Se incorporaron consultas con la cláusula `EXPLAIN` para verificar que el optimizador de MySQL utilice las llaves secundarias (`key`) reduciendo las filas examinadas (`rows`).
*   **Integridad Referencial y Dominio:**
    - Relaciones `FOREIGN KEY` configuradas con `ON DELETE RESTRICT` en entidades primarias y `ON DELETE SET NULL` para diseños del catálogo en citas.
    - Restricciones `CHECK` para garantizar tarifas, duraciones, tamaños y costos estrictamente mayores a cero ($> 0$).
*   **Ausencia de Comentarios Internos:** Código SQL completamente exento de comentarios en línea dentro de los bloques ejecutables de acuerdo con los requerimientos técnicos establecidos.