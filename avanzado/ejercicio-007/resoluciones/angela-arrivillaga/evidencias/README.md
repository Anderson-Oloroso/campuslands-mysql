# Ejercicio 007 - Vistas avanzadas para liga de futbol

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

* Se utilizó la base de datos `liga_futbol`.
* Se implementó una restricción `CHECK` para asegurar que los goles no sean negativos.
* Se utilizó una `VIEW` (vista) para abstraer el cálculo de goles a favor, facilitando futuras consultas de rendimiento.
* Los datos incluyen 4 equipos y 8 partidos finalizados para probar cálculos de agregación.

## Salida y resultados esperados

* `vista_rendimiento`: Tabla virtual que mapea el nombre del equipo con su total de goles marcados.
* Consulta de partidos jugados: Lista de equipos y el conteo exacto de su participación.
* Ranking: Top 3 equipos ordenados descendentemente por su capacidad ofensiva.
* Promedio de liga: Valor decimal con el promedio de goles anotados.

## Evidencias

Para demostrar la correcta ejecución:

* **DDL:** Captura de pantalla de `DESCRIBE equipos;` y `DESCRIBE partidos;` en MySQL.
* **DML:** Ejecución de `SELECT COUNT(*) FROM partidos;` para verificar los 8 registros.
* **DQL:** Salida en consola de las 5 consultas solicitadas, verificando los cálculos de goles y conteos.