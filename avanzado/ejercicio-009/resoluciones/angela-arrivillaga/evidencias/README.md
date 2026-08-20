# Ejercicio 009 - Bloqueos para kickboxing

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

* Se utilizó la base de datos `kickboxing_bloqueos`.
* Se diseñaron tablas para clasificar tipos de bloqueos por zona y nivel de dificultad, estructurando además un sistema de registro de ejecuciones por combate (`registro_bloqueos`).
* Se incluyó una consulta de control de concurrencia mediante `START TRANSACTION` y la cláusula `FOR UPDATE` para cumplir con la práctica de bloqueos (locking) a nivel de filas en MySQL.
* Se incorporaron 8 registros de prueba tanto en tablas maestras como transaccionales para validar funciones de agregación y filtros.

## Salida y resultados esperados

* Bloqueo de fila (`FOR UPDATE`): Bloqueo exclusivo de una fila de combate dentro de una transacción para evitar condiciones de carrera.
* Conteo de ejecuciones: Reporte agrupado de los tipos de bloqueo más utilizados.
* Efectividad por luchador: Cálculo porcentual de éxito en la defensa basado en los registros históricos.
* Filtro técnico: Listado de técnicas de alta complejidad (intermedio/avanzado) efectivamente aplicadas.
* Detección de fallos: Identificación de combates con registros de bloqueos fallidos mediante cláusula `HAVING`.

## Evidencias

Para demostrar la correcta ejecución:

* **DDL:** Captura de consola ejecutando `SHOW TABLES;` y validando las restricciones de clave foránea.
* **DML:** Comprobación mediante `SELECT COUNT(*) FROM registro_bloqueos;` arrojando los 8 registros mínimos solicitados.
* **DQL:** Salida estructurada de las 5 consultas DQL incluyendo el comportamiento transaccional del bloqueo de filas.