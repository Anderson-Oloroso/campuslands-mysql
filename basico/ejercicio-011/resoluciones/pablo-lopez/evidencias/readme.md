# Ejercicio 011 - Validaciones simples para Pingpong

## Autor

Pablo López


## Descripción

Se creó una base de datos MySQL para almacenar información de jugadores de una academia de pingpong.

La solución permite registrar jugadores, consultar su estado, ordenar el ranking y obtener indicadores como cantidad y promedio de puntaje.

## Estructura

* `ddl/schema.sql`: creación de la base de datos y tabla.
* `dml/inserts.sql`: inserción de datos de prueba.
* `dql/consultas.sql`: consultas y reportes.

## Validaciones utilizadas

La tabla `jugadores` utiliza restricciones `NOT NULL` y `CHECK`.

Se valida que:

* La edad sea igual o mayor a 5 años.
* El puntaje no sea negativo.
* El estado solamente pueda ser `activo` o `inactivo`.

## Ejecución

Los scripts deben ejecutarse en este orden:

1. `ddl/schema.sql`
2. `dml/inserts.sql`
3. `dql/consultas.sql`

## Decisiones técnicas

Se utilizó `INT` para edad y puntaje, `VARCHAR` para los datos de texto y `DATE` para la fecha de registro.

Los datos de prueba incluyen diferentes categorías, puntajes, edades y estados para comprobar correctamente los filtros, ordenamientos y cálculos.
