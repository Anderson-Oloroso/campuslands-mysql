## Analisis

**Datos del Desarrollador**
*   **Nombre:** Edgar Sánchez
*   **SGBD:** MySQL

**Descripción del Módulo**
Este módulo aplica restricciones `CHECK` a nivel de columna y de tabla en MySQL dentro del ámbito del Tenis de Mesa (Ping-Pong). La solución impone reglas de negocio estrictas en el motor de base de datos para garantizar la integridad lógica de puntuaciones, estados, límites de rango y coherencia temporal sin depender de validaciones externas.

**Organización y Decisiones Técnicas**
*   **Implementación de Restricciones `CHECK`:**
    - `chk_capacidad_mesas` y `chk_duracion_minutos`: Garantizan valores estrictamente mayores a cero.
    - `chk_mano_dominante`, `chk_categoria_torneo` y `chk_fase_torneo`: Restringen entradas a conjuntos discretos válidos mediante `IN (...)`.
    - `chk_fechas_torneo`: Asegura la coherencia temporal obligando a que la fecha de finalización sea mayor o igual a la de inicio.
    - `chk_jugadores_distintos`: Impide que un jugador enfrente a sí mismo en un partido (`jugador1_id <> jugador2_id`).
    - `chk_resultado_valido`: Modela el reglamento oficial de victorias al mejor de 5 sets (un jugador debe alcanzar exactamente 3 sets ganados mientras el oponente tiene entre 0 y 2).
*   **Integridad Referencial y Mantenimiento:**
    - Claves foráneas configuradas con `ON DELETE RESTRICT` para evitar el borrado no planificado de entidades activas.
*   **Ausencia de Comentarios Internos:** Las sentencias DDL, DML y DQL se presentan totalmente limpias de comentarios en línea para acatar los estándares fijados.