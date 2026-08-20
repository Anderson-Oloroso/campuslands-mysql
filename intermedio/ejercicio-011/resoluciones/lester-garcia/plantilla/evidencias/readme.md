# Sistema de Torneo de Pingpong

## Nombre del alumno
**Lster Garcia
_____________________________________

## Descripción general

Este proyecto implementa una base de datos relacional en MySQL para administrar información relacionada con jugadores, torneos y partidos de un sistema competitivo de pingpong.

La solución fue diseñada aplicando criterios de integridad de datos y separación de responsabilidades mediante archivos DDL, DML y DQL.

## Objetivo

Practicar el uso de la restricción `CHECK` en MySQL para establecer reglas que permitan controlar la información almacenada en las tablas.

## Estructura del proyecto

- `ddl.sql`: creación de la base de datos, tablas, relaciones y restricciones.
- `dml.sql`: inserción de datos de prueba.
- `dql.sql`: consultas para analizar la información.
- `README.md`: documentación y explicación del ejercicio.

## Explicación general de la solución

La base de datos está compuesta por tres entidades principales:

- Jugadores
- Torneos
- Partidos

La tabla `jugadores` almacena información de los participantes y utiliza restricciones `CHECK` para garantizar que la edad y el ranking tengan valores válidos.

La tabla `torneos` utiliza una restricción `CHECK` para evitar que se registren premios iguales o inferiores a cero.

La tabla `partidos` contiene diferentes restricciones `CHECK` para evitar enfrentamientos de un jugador contra sí mismo, puntos negativos y estados que no pertenecen a los valores permitidos.

## Reglas implementadas

### Jugadores

- La edad debe ser igual o superior a 16 años.
- El ranking debe ser mayor que cero.

### Torneos

- El premio debe ser mayor que cero.

### Partidos

- Un jugador no puede enfrentarse contra sí mismo.
- Los puntos de ambos jugadores no pueden ser negativos.
- El estado debe ser `Programado`, `Finalizado` o `Cancelado`.

## Consultas realizadas

Se desarrollaron cuatro consultas principales:

1. Jugadores con ranking inferior a 150.
2. Torneos con premios superiores a Q10,000.
3. Partidos finalizados con una diferencia mínima de 3 puntos.
4. Partidos que actualmente se encuentran programados.

## Evidencia

La evidencia del ejercicio debe incluir capturas de pantalla de:

1. La creación correcta de las tablas.
2. La inserción de los registros.
3. La ejecución de cada una de las cuatro consultas.
4. Los resultados obtenidos.
5. Las pruebas de inserción de datos inválidos.
6. El mensaje de error generado al intentar incumplir una restricción `CHECK`.

## Decisiones técnicas

Se utilizaron claves primarias para identificar cada registro y claves foráneas para mantener la relación entre jugadores, torneos y partidos.

Las restricciones `CHECK` se definieron directamente en la estructura de las tablas para que las reglas de negocio básicas sean controladas por el motor de base de datos y no dependan únicamente de la aplicación.

La solución puede ejecutarse desde cero siguiendo este orden:

1. Ejecutar `ddl.sql`.
2. Ejecutar `dml.sql`.
3. Ejecutar `dql.sql`.
4. Ejecutar las pruebas de restricciones `CHECK`.