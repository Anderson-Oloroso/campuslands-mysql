## Analisis

**Datos del Desarrollador**
*   **Nombre:** Edgar Sánchez
*   **SGBD:** MySQL

**Descripción del Módulo**
Este módulo resuelve la encapsulación de cálculos financieros repetitivos y reglas de tarificación mediante **Funciones Almacenadas Definidas por el Usuario (Stored Stored User-Defined Functions - UDF)** en MySQL para un sistema de Viajes y Turismo. La solución permite computar descuentos escalonados por volumen de viajeros y proyectar montos totales netos de forma centralizada tanto en consultas DQL directas como en simulaciones de cotización.

**Organización y Decisiones Técnicas**
*   **Control de Limpieza Previa DDL:**
    - Se incluyeron instrucciones `DROP TABLE IF EXISTS` ordenadas en secuencia estricta de dependencias inversas (`reservas_tours` $\rightarrow$ `tours_disponibles` $\rightarrow$ `guias_turismo` / `destinos_turisticos` / `turistas`) para asegurar la ejecución limpia e idempotente de las tablas.
    - Eliminación preventiva de funciones mediante `DROP FUNCTION IF EXISTS` antes de su declaración.
*   **Implementación de Funciones SQL (UDF):**
    - `fn_calcular_descuento_temporada`: Función escalar declarada con la cláusula `DETERMINISTIC` que calcula el margen de descuento aplicable en base a la cantidad de personas del grupo ($\ge 3 \implies 15\%$, $2 \implies 5\%$).
    - `fn_obtener_costo_total_reserva`: Función con la propiedad `READS SQL DATA` que consulta la tarifa base del tour especificado, efectúa el cálculo del subtotal acumulado y llama internamente a `fn_calcular_descuento_temporada` para retornar el monto final neto.
*   **Integridad Referencial y Dominio:**
    - Claves foráneas protegidas con `ON DELETE RESTRICT` y `ON UPDATE CASCADE` en el catálogo de tours, guías, destinos y turistas.
    - Restricciones `CHECK` para validar la coherencia temporal de fechas (`fecha_viaje >= fecha_reserva`), duración e incentivos de personas mayores a cero ($> 0$), así como tarifas y montos positivos ($> 0.00$).
*   **Ausencia de Comentarios Internos:** Código SQL completamente exento de comentarios en línea dentro de los bloques ejecutables de acuerdo con los estándares profesionales establecidos.