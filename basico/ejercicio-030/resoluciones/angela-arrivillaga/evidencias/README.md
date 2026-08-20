# Ejercicio 030 - Relaciones simples para equipo de streaming

## Estructura del proyecto

angela-arrivillaga/
├── ddl/
│   └── schema.sql
├── dml/
│   └── inserts.sql
├── dql/
│   └── consultas.sql
└── evidencias/
    └── README.md

## Ejecución

1. Ejecutar ddl/schema.sql.
2. Ejecutar dml/inserts.sql.
3. Ejecutar dql/consultas.sql.

## Decisiones técnicas

* Se utilizó la base de datos `equipo_streaming_db`.
* Se implementó un modelado relacional con dos entidades normalizadas: `marcas_streaming` (tabla padre) y `equipo_streaming` (tabla hija), conectadas mediante una clave foránea (`id_marca`) con restricciones de integridad referencial (`RESTRICT` en eliminación y `CASCADE` en actualización).
* Se aplicaron restricciones de validación estrictas (`CHECK`) para asegurar que el precio en USD del equipo sea estrictamente mayor a cero.
* Se diseñaron 5 consultas DQL orientadas a la gestión relacional avanzada, haciendo uso de uniones multitabla (`JOIN`, `LEFT JOIN`), filtros condicionales exactos y de rango, exclusiones por estado y reportes financieros agregados (`COUNT`, `SUM`, `AVG`, `FORMAT`, `CONCAT`).

## Salida y resultados esperados

* Consulta relacional completa: Listado de hardware de streaming vinculado directamente con los datos de sus fabricantes.
* Filtrado por fabricante y estado: Extracción de dispositivos activos específicos de marcas líderes del mercado.
* Análisis de inversión unitaria: Segmentación de equipos de alta gama valorados en $200.00 USD o más.
* Filtrado operativo eficiente (`NOT IN`): Aislamiento de recursos listos para producción excluyendo equipos en mantenimiento o baja.
* Reporte consolidado por marca: Estadísticas de inventario que muestran volúmenes de dispositivos, costos acumulados e inversión promedio por fabricante mediante uniones externas (`LEFT JOIN`).

## Evidencias

Para demostrar la correcta ejecución:

* **DDL:** Captura de consola ejecutando comandos descriptivos de esquema para validar la correcta configuración de claves primarias, foráneas y restricciones `CHECK`.
* **DML:** Comprobación mediante `SELECT COUNT(*) FROM equipo_streaming;` confirmando la inserción exacta de los registros de prueba.
* **DQL:** Salida en consola de las 5 consultas relacionales demostrando el dominio de uniones de tablas y agregación en MySQL.