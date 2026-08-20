# Ejercicio 018 - PRIMARY KEY para viajes y turismo

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

* Se utilizó la base de datos `agencia_viajes_db`.
* Se implementó el concepto fundamental de llaves primarias (`PRIMARY KEY` con `AUTO_INCREMENT`) en las tablas independientes y dependientes (`destinos_turisticos` y `paquetes_turisticos`), asegurando la unicidad absoluta de cada registro y estableciendo una relación relacional robusta mediante llaves foráneas (`FOREIGN KEY`).
* Se aplicaron restricciones de validación estrictas (`CHECK`) para garantizar la integridad de los datos de negocio: precios base positivos, duración en días mayor a cero y cupos disponibles no negativos.
* Se estructuraron exactamente 5 registros de destinos y 8 registros de paquetes turísticos diversos para permitir pruebas exhaustivas de filtros por disponibilidad, funciones de agregación y cálculos aritméticos de proyecciones comerciales.

## Salida y resultados esperados

* Catálogo relacional de viajes: Listado detallado que cruza cada paquete turístico con su respectivo destino internacional y país de origen.
* Agrupación por destino: Reporte estadístico que calcula el volumen de ofertas, el costo promedio y la sumatoria de cupos vigentes por cada región geográfica.
* Filtro comercial activo: Selección de paquetes operativos listos para la reserva que combinan estado `activo` y cupos físicos mayores a cero.
* Top 5 económico: Ranking de los 5 paquetes turísticos con menor costo base dentro de la oferta global de la agencia.
* Proyección de ingresos potenciales: Consulta analítica que calcula el valor monetario bruto máximo que la agencia puede percibir según los cupos disponibles y el precio de cada paquete.

## Evidencias

Para demostrar la correcta ejecución:

* **DDL:** Captura de consola ejecutando `SHOW KEYS FROM paquetes_turisticos;` para comprobar el establecimiento correcto de la llave primaria y la llave foránea.
* **DML:** Comprobación mediante `SELECT COUNT(*) FROM paquetes_turisticos;` confirmando el cumplimiento del requisito mínimo de 8 registros.
* **DQL:** Salida en consola de las 5 consultas solicitadas evidenciando cruces relacionales eficientes, filtrado avanzado y funciones de agregación.