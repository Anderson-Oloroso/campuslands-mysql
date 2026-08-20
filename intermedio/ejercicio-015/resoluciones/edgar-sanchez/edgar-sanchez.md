## Analisis

**Datos del Desarrollador**
*   **Nombre:** Edgar Sánchez
*   **SGBD:** MySQL

**Descripción del Módulo**
Este módulo practica la **Carga de Datos** e ingesta relacional en MySQL dentro del dominio de una Biblioteca Gamer personal. La solución asegura el aprovisionamiento ordenado de entidades catálogo (plataformas, desarrolladores y títulos) e inserta registros de catálogo/transacciones garantizando integridad de dominio y relaciones de clave foránea sin redundancias.

**Organización y Decisiones Técnicas**
*   **Carga e Inserción de Datos (`INSERT INTO`):**
    - Organización explícita de sentencias en orden jerárquico de dependencias: Entidades maestras (`plataformas_gamer`, `desarrolladores_gamer`), dependientes de nivel 1 (`videojuegos_gamer`) y la entidad transaccional/central (`biblioteca_gamer`).
    - Inserción en bloque masivo (`VALUES (...), (...)`) optimizada para reducir transacciones de red.
*   **Estrategia de Integridad Referencial y Dominio:**
    - Restricción `UNIQUE` compuesta en `(videojuego_id, plataforma_id)` dentro de `biblioteca_gamer` para evitar duplicar la misma plataforma sobre una misma copia registrada.
    - Claves foráneas configuradas con `ON DELETE RESTRICT` y `ON UPDATE CASCADE` para mantener trazabilidad histórica.
    - Validaciones `CHECK` para precios no negativos, rangos de años de lanzamiento (1970–2026) y estados discretos del backlog (`Pendiente`, `Jugando`, `Completado`, `Abandonado`).
*   **Consultas de Verificación (DQL):**
    - Inclusión de cálculo de rendimiento por inversión (`costo_por_hora_usd`) utilizando `NULLIF()` para evitar errores de división entre cero.
*   **Ausencia de Comentarios Internos:** Todas las sentencias DDL, DML y DQL se presentan totalmente limpias de comentarios en línea para dar cumplimiento estricto a las directrices técnicas.