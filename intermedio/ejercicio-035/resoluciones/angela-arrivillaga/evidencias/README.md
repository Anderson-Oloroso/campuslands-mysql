# Ejercicio 035 - Subconsultas para Taller Mecánico de Motos

## Estructura del Proyecto

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

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones Técnicas

* Se estructuró la base de datos relacional `taller_mecanico_motos_db` con entidades para clientes, motocicletas y órdenes de reparación.
* Enfoque centrado en la implementación avanzada de **subconsultas** (subconsultas escalares en WHERE, subconsultas con operadores de conjunto `IN` / `NOT IN`, subconsultas correlacionadas en el SELECT y tablas derivadas en el FROM).
* Uso de restricciones de integridad estrictas (`CHECK` para costos positivos y años válidos, claves foráneas con cascadas controladas).

## Salida y Resultados Esperados

* Filtrado de órdenes de reparación costosas por encima de la media global del taller.
* Identificación precisa de clientes con motocicletas antiguas utilizando `IN`.
* Cálculo comparativo correlacionado frente al costo máximo del taller.
* Detección de clientes sin historial de órdenes mediante `NOT IN`.
* Reportes analíticos estructurados a partir de tablas derivadas en el `FROM`.

## Evidencias

Para demostrar la correcta ejecución:

* DDL: Esquema relacional optimizado para gestión de taller.
* DML: Inserción de 5 clientes, 8 motocicletas y 8 órdenes de reparación detalladas.
* DQL: Consultas con subconsultas variadas, eficientes y documentadas con alias claros.