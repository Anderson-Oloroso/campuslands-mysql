# Ejercicio 027 - Modelado de entidad para videojuego de acción y aventura

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

* Se utilizó la base de datos `juego_accion_aventura_db`.
* Se aplicaron restricciones de validación estrictas (`CHECK`) en el esquema DDL para asegurar que el nivel de poder del artefacto se encuentre entre 1 y 1000 y que el valor en monedas sea mayor o igual a cero.
* Se estructuró la entidad `artefactos_aventura` con atributos detallados (código único, nombre, tipo, nivel de poder, valor financiero en formato `DECIMAL` y estado operativo mediante `ENUM`).
* Se diseñaron 5 consultas DQL orientadas a la toma de decisiones de inventario, filtrado por disponibilidad, clasificación por operadores lógicos (`IN`, `NOT IN`) y reportes financieros avanzados con funciones de agregación (`COUNT`, `MAX`, `SUM`, `FORMAT`, `CONCAT`).

## Salida y resultados esperados

* Consulta de disponibilidad: Extracción de artefactos listos para su uso ordenados por potencia táctica.
* Análisis de valor económico: Filtrado de objetos de alta gama y valor comercial superior.
* Agrupación por categorías clave (`IN`): Listado enfocado en elementos ofensivos y reliquias de gran valor.
* Filtrado de operatividad (`NOT IN`): Aislamiento de recursos funcionales excluyendo piezas destruidas o extraviadas.
* Reporte consolidado de inventario: Estadísticas por tipo de artefacto que muestran conteos, picos de poder y valorización total acumulada.

## Evidencias

Para demostrar la correcta ejecución:

* **DDL:** Captura de consola ejecutando comandos descriptivos de esquema para validar la correcta configuración de claves primarias y restricciones `CHECK`.
* **DML:** Comprobación mediante `SELECT COUNT(*) FROM artefactos_aventura;` confirmando la inserción exacta de los 8 registros de prueba.
* **DQL:** Salida en consola de las 5 consultas analíticas demostrando el dominio del modelado y la consulta de entidades en MySQL.