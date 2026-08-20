## Analisis

**Datos del Desarrollador**
*   **Nombre:** Edgar Sánchez
*   **SGBD:** MySQL

**Descripción del Módulo**
Este módulo resuelve el filtrado de datos agregados utilizando la cláusula **HAVING** en MySQL aplicado a la gestión operativa y financiera de un Garaje de Motos. La solución permite segmentar a los clientes preferenciales con alto volumen de servicios e inversión, así como evaluar qué marcas de motocicletas superan los umbrales de atenciones y costos promedios de mantenimiento.

**Organización y Decisiones Técnicas**
*   **Filtrado Post-Agregación (`HAVING`):**
    - El primer reporte agrupa el historial por cliente y aplica la restricción `HAVING COUNT(s.servicio_id) >= 2 AND gasto_total_servicios_usd > 300.00` para aislar clientes recurrentes y de alto valor de facturación, evaluando las expresiones directamente sobre las funciones de agregación.
    - El segundo reporte consolida la información por marca de fabricante y filtra resultados mediantes la cláusula `HAVING total_motos_atendidas >= 2 AND costo_promedio_servicio_usd >= 100.00`, excluyendo marcas con volumen o gasto promedio inferior a las métricas clave del taller.
*   **Integridad Referencial y Dominio:**
    - Claves foráneas estructuradas con `ON DELETE RESTRICT` y `ON UPDATE CASCADE` en toda la jerarquía de tablas (`marcas_moto` $\rightarrow$ `modelos_moto` $\rightarrow$ `motocicletas_cliente` $\rightarrow$ `servicios_mantenimiento`) para proteger la consistencia operativa.
    - Restricciones `CHECK` para cilindrada positiva ($> 0$), costos no negativos ($\ge 0.00$), año de fabricación dentro de un rango válido ($1990 \text{ a } 2026$) y un dominio cerrado para los tipos de motocicleta y estados de servicio.
*   **Ausencia de Comentarios Internos:** Todas las sentencias DDL, DML y DQL se presentan totalmente libres de comentarios en línea para dar cumplimiento estricto a los requerimientos técnicos fijados.