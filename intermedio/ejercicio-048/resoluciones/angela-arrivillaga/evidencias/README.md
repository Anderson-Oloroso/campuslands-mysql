# ejercicio 048 - GROUP BY para viajes y turismo

## estructura del proyecto
angela-arrivillaga/
├── ddl/schema.sql
├── dml/inserts.sql
├── dql/consultas.sql
└── evidencias/README.md

## decisiones tecnicas
* Se implementó el uso intensivo de `GROUP BY` junto con funciones de agregación (`COUNT`, `AVG`, `SUM`, `MAX`, `MIN`) para extraer métricas analíticas clave del sector turístico.
* Se estructuró una relación relacional 1:N entre las tablas `destinos` y `paquetes_turisticos`.
* Se aplicaron restricciones `CHECK` para asegurar que tanto el precio como la duración de los paquetes sean estrictamente positivos.
* Se utilizaron alias claros en todas las consultas para garantizar la legibilidad y presentación formal de los reportes.

## evidencias de ejecucion
* Se comprobó la correcta ejecución de los scripts de esquema, carga de datos y consultas analíticas sin errores de sintaxis en MySQL.
* Se validó que las agrupaciones reflejan fielmente los indicadores financieros y de duración requeridos por el problema.