## Analisis

**Datos del Desarrollador**
*   **Nombre:** Edgar Sánchez
*   **Fecha de ejecución:** 18/08/2026
*   **SGBD:** MySQL

**Descripción del Módulo**
Este módulo resuelve la consolidación estadística de enfrentamientos deportivos utilizando **Common Table Expressions (CTE)** en MySQL para una academia de Pingpong. Permite modularizar la lógica de normalización de partidos (donde un participante actúa como jugador 1 o jugador 2) en bloques CTE legibles para evaluar la efectividad técnica individual y por club.

**Organización y Decisiones Técnicas**
*   **Control de Limpieza Previa DDL:**
    - Se incluyeron instrucciones `DROP TABLE IF EXISTS` ordenadas según la jerarquía de dependencias (`partidos_pingpong` $\rightarrow$ `torneos_pingpong` / `jugadores_pingpong` $\rightarrow$ `clubes_pingpong`) para asegurar la reejecución limpia e idempotente de todo el script DDL desde cero.
*   **Implementación de CTEs:**
    - `partidos_procesados`: CTE con `UNION ALL` que unifica los registros de partidos duplicando las filas desde la perspectiva de cada jugador participante, simplificando los cálculos agregados posteriores.
    - `rendimiento_jugador`: CTE de agregación secundaria que toma el bloque anterior para determinar partidos jugados, ganados, perdidos y porcentaje de efectividad individual.
    - `rendimiento_club`: CTE orientada a nivel institucional que evalúa el rendimiento global agrupado por club deportivo.
*   **Integridad Referencial y Dominio:**
    - Claves foráneas protegidas con `ON DELETE RESTRICT` y `ON UPDATE CASCADE` en todas las tablas para garantizar la coherencia de datos.
    - Restricciones `CHECK` para validar la diferencia estricta entre competidores (`jugador1_id <> jugador2_id`), ranking positivo ($> 0$), duración de juego y dominio de mano.
*   **Ausencia de Comentarios Internos:** Sentencias totalmente limpias de comentarios según los estándares técnicos establecidos.