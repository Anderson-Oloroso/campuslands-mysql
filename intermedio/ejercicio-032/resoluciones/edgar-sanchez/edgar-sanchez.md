## Analisis

**Datos del Desarrollador**
*   **Nombre:** Edgar Sánchez
*   **SGBD:** MySQL

**Descripción del Módulo**
Este módulo resuelve la inclusión de registros no vinculados y el análisis de cobertura mediante la cláusula **LEFT JOIN** en MySQL aplicada a un sistema de Ranking Battle Royale. La solución permite consolidar tanto la actividad de los usuarios activos con historial de combate como identificar a los jugadores recién registrados sin partidas jugadas.

**Organización y Decisiones Técnicas**
*   **Uso e Implementación de `LEFT JOIN`:**
    - El primer reporte utiliza `LEFT JOIN` desde la entidad principal `jugadores_br` hacia la tabla transaccional `resultados_jugador_partida`. Esto garantiza que los jugadores sin partidas previas no sean descartados y sus métricas de victorias, eliminaciones y daño sean presentadas correctamente como cero ($0$) utilizando funciones de agregación y `COALESCE`.
    - El segundo reporte emplea el patrón `LEFT JOIN ... WHERE rp.resultado_id IS NULL` (anti-join) para filtrar de forma eficiente a los usuarios inactivos o sin historial registrado, permitiendo identificar cuentas inactivas o pendientes de onboarding.
*   **Integridad Referencial y Dominio:**
    - Claves foráneas configuradas con `ON DELETE RESTRICT` y `ON UPDATE CASCADE` en catálogos y entidades primarias para salvaguardar la clasificación de rangos y usuarios.
    - `ON DELETE CASCADE` en `resultados_jugador_partida` para remover el historial si una sesión de partida es anulada del sistema.
    - Restricciones `CHECK` para validar posiciones finales ($1 \text{ a } 100$), duraciones, niveles de cuenta ($1 \text{ a } 500$) y rangos de puntos coherentes en la escala competitiva.
*   **Ausencia de Comentarios Internos:** Todas las sentencias DDL, DML y DQL se presentan totalmente libres de comentarios en línea para dar estricto cumplimiento a las directrices técnicas fijadas.