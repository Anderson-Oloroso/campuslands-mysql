# Ejercicio 020 - SELECT para estudio de tatuajes

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

* Se utilizó la base de datos `estudio_tatuajes_db`.
* Se implementaron consultas `SELECT` avanzadas aplicando filtros condicionales múltiples (`IN`), uniones relacionales (`JOIN` y `LEFT JOIN`), funciones de agregación estadística (`COUNT`, `AVG`, `SUM`, `ROUND`) y ordenamientos analíticos de alto rendimiento (`ORDER BY ... DESC/ASC` junto con `LIMIT`).
* Se aplicaron restricciones de validación estrictas (`CHECK`) para garantizar que los costos monetarios estimados sean mayores a cero y que las horas de duración de cada pieza de tatuaje sean lógicamente positivas.
* Se estructuraron exactamente 5 registros de estilos artísticos y 8 registros de citas de clientes diversas para permitir pruebas exhaustivas de reportes gerenciales y consultas orientadas al negocio del estudio.

## Salida y resultados esperados

* Agenda general de estudio: Listado detallado que relaciona las piezas y citas con sus respectivos clientes, artistas, estilos, costos y estados operativos.
* Consolidado por estilo artístico: Reporte financiero y cuantitativo que calcula la demanda de cada estilo, su costo medio y la facturación acumulada.
* Filtro de citas activas: Selección precisa de los trabajos pendientes o en ejecución dentro del estudio ordenados por valor comercial.
* Top 5 de piezas de alta gama: Ranking de las 5 citas más costosas programadas o ejecutadas en el estudio.
* Rendimiento por artista: Análisis de productividad que agrupa por tatuador las horas invertidas en el estudio y la facturación total generada.

## Evidencias

Para demostrar la correcta ejecución:

* **DDL:** Captura de consola ejecutando consultas estructurales de validación de tablas y claves foráneas.
* **DML:** Comprobación mediante `SELECT COUNT(*) FROM citas_tatuajes;` confirmando el cumplimiento del requisito mínimo de 8 registros.
* **DQL:** Salida en consola de las 5 consultas solicitadas evidenciando el uso profesional de alias, proyecciones calculadas y agrupaciones analíticas.