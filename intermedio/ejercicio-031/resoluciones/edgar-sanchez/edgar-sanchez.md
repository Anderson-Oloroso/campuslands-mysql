## Analisis

**Datos del Desarrollador**
*   **Nombre:** Edgar Sánchez
*   **SGBD:** MySQL

**Descripción del Módulo**
Este módulo ejerce el uso estricto de **INNER JOIN** en MySQL dentro del contexto de Torneos de eSports MOBA. La solución combina los datos transaccionales de partidas y estadísticas individuales con los catálogos de equipos, jugadores y torneos, cruzando registros coincidentes para calcular el rendimiento competitivo y los resultados del campeonato.

**Organización y Decisiones Técnicas**
*   **Combinación Interna de Tablas (`INNER JOIN`):**
    - En el reporte de partidas, se realizaron múltiples `INNER JOIN` cruzados sobre la misma entidad origen (`equipos_esports`) utilizando alias distintos (`eq_azul`, `eq_rojo`, `eq_ganador`) para resolver los tres roles de equipo participantes en un solo registro.
    - En el reporte de rendimiento individual, se vincularon cinco tablas en cadena (`estadisticas_jugador_partida`, `jugadores_moba`, `equipos_esports`, `partidas_torneo`, `torneos_moba`), asegurando que solo los jugadores con partidas efectivamente registradas formen parte del indicador KDA y de oro acumulado.
*   **Integridad Referencial y Dominio:**
    - Claves foráneas configuradas con `ON DELETE RESTRICT` y `ON UPDATE CASCADE` entre las entidades principales para preservar la validez del historial competitivo.
    - `ON DELETE CASCADE` en `estadisticas_jugador_partida` para eliminar automáticamente los registros de rendimiento si una partida es anulada.
    - Restricciones `CHECK` para duraciones estrictamente positivas ($> 0$), estadísticas de KDA no negativas ($\ge 0$) y condicional `CHECK (equipo_azul_id <> equipo_rojo_id)` para impedir que un equipo juegue contra sí mismo.
*   **Ausencia de Comentarios Internos:** Todas las sentencias DDL, DML y DQL se presentan totalmente limpias de comentarios en línea para dar cumplimiento estricto a los estándares técnicos establecidos.