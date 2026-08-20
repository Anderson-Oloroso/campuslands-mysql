## Analisis

**Datos del Desarrollador**
*   **Nombre:** Edgar Sánchez
*   **SGBD:** MySQL

**Descripción del Módulo**
Este módulo ejercita el proceso de **Carga de Datos (DML - INSERT)** e inserción estructurada en MySQL aplicado a la gestión de inventario y configuración de setups para Creadores de Contenido y Equipo de Streaming. La solución garantiza la carga secuencial y coherente de datos respetando las restricciones de integridad y dependencias de clave foránea.

**Organización y Decisiones Técnicas**
*   **Estrategia de Carga e Inserción de Datos:**
    - Ordenamiento estricto de ejecuciones `INSERT INTO` en orden jerárquico: primero las tablas maestras o catálogos independientes (`categorias_equipo`, `marcas_hardware`, `creadores_contenido`), seguidas de las entidades operacionales (`inventario_equipos`) y finalmente las tablas de asociación transaccional (`asignaciones_setups`).
    - Inserción de volúmenes de datos mediante sintaxis multivalor por sentencia para optimizar la ejecución del script DML en el servidor.
*   **Integridad Referencial y Dominio:**
    - Claves foráneas configuradas con `ON DELETE RESTRICT` y `ON UPDATE CASCADE` en toda la topología relacional para evitar registros huérfanos y mantener la consistencia entre marcas, categorías y asignaciones.
    - Restricción `UNIQUE` compuesta en `(creador_id, equipo_id)` dentro de `asignaciones_setups` para evitar registros redundantes de un mismo modelo en la ficha del creador.
    - Restricciones `CHECK` para precios estrictamente positivos ($> 0.00$), stock no negativo ($\ge 0$), cantidades validas y dominios cerrados para plataformas y estados físicos del hardware.
*   **Ausencia de Comentarios Internos:** Todas las sentencias DDL, DML y DQL se presentan totalmente limpias de comentarios en línea para dar estricto cumplimiento a los estándares técnicos establecidos.