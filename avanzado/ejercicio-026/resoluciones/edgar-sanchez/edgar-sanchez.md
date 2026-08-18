## Analisis

**Datos del Desarrollador**
*   **Nombre:** Edgar Sánchez
*   **SGBD:** MySQL

**Descripción del Módulo**
Este módulo implementa expresiones de tabla comunes (**CTE - Common Table Expressions**), incluyendo recursividad para estructuras jerárquicas y CTEs múltiples para agregación de indicadores en un Videojuego RPG. La solución permite modelar la progresión de misiones encadenadas, calcular el patrimonio global de cada usuario (oro en bolsa + valor de inventario) y evaluar métricas de participación de jugadores.

**Organización y Decisiones Técnicas**
*   **Control de Limpieza Previa DDL:**
    - Se agregaron sentencias `DROP TABLE IF EXISTS` siguiendo en estricto orden inverso la jerarquía de dependencias relacionales (`inventario_jugadores` / `misiones_completadas` $\rightarrow$ `items_juego` / `misiones_rpg` / `jugadores_rpg`) para garantizar reejecución limpia.
*   **Implementación de CTEs y CTEs Recursivos:**
    - **CTE Recursivo (`CadenaMisiones CTE`):** Recorre la jerarquía de misiones donde una misión desbloquea la siguiente (`mision_padre_id`). Permite reconstruir la ruta completa del árbol de misiones y calcular la profundidad o paso dentro de la cadena.
    - **CTEs Múltiples Compuestos (`ValorInventario CTE` y `MisionesJugador CTE`):** Modularizan y aíslan los cálculos complejos de patrimonio acumulado por inventario e historial de recompensas obtenidas, integrándolos en una consulta final mediante `LEFT JOIN`.
*   **Integridad Referencial y Dominio:**
    - Claves foráneas configuradas con `ON DELETE CASCADE` para datos propios del jugador e historial de misiones completadas, y `ON DELETE SET NULL` en la autorreferencia de misiones para conservar árboles parciales.
    - Restricciones `CHECK` para restringir clases válidas de personajes, límites de nivel ($1 \text{ a } 100$), valores positivos de experiencia, cantidad de objetos ($> 0$) y precios en oro non-negativos.
*   **Ausencia de Comentarios Internos:** El código ejecutable entregado está completamente libre de comentarios internos en cumplimiento directo de las reglas fijadas.