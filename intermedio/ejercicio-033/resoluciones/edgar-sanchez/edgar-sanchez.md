## Analisis

**Datos del Desarrollador**
*   **Nombre:** Edgar Sánchez
*   **SGBD:** MySQL

**Descripción del Módulo**
Este módulo ejercita el agrupamiento de datos mediante la cláusula **GROUP BY** y funciones de agregación (`COUNT`, `SUM`, `AVG`, `MIN`, `MAX`) en MySQL aplicado al control e indicadores de valor de un inventario de skins para un videojuego shooter. La solución permite resumir la distribución de cosméticos por categoría de arma y evaluar la penetración de colecciones según su nivel de rareza.

**Organización y Decisiones Técnicas**
*   **Agrupamiento y Métricas de Negocio (`GROUP BY`):**
    - El primer reporte agrupa el catálogo y las instancias por `a.tipo_arma`, calculando precios mínimos, máximos y promedios mediante agregaciones numéricas, combinadas con conteos de variantes únicas.
    - El segundo reporte aplica un agrupamiento multidimensional por `c.nombre_coleccion` y `r.nombre_rareza`, evaluando la presencia de ítems especiales (tecnología *StatTrak*) mediante sumas condicionales, el desgaste promedio (*float wear*) y la valorización estimada del mercado según el multiplicador de rareza.
*   **Integridad Referencial y Dominio:**
    - Claves foráneas configuradas con `ON DELETE RESTRICT` y `ON UPDATE CASCADE` en toda la topología relacional para garantizar consistencia entre armas, rarezas, colecciones e inventarios.
    - Restricciones `CHECK` para validar que el desgaste (*float*) se encuentre estrictamente en el intervalo $0.0000 \text{ a } 1.0000$, precios base estrictamente positivos ($> 0.00$) y tipos de arma dentro de un dominio cerrado.
*   **Ausencia de Comentarios Internos:** Todas las sentencias DDL, DML y DQL se presentan totalmente limpias de comentarios en línea para dar cumplimiento estricto a las directivas técnicas establecidas.