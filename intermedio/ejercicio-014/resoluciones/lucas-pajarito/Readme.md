# Ejercicio 014 - Vistas simples para saga de ciencia ficción

## Dificultad

Intermedio inicial

## Temática

Saga de ciencia ficción

## Descripción

Este ejercicio practica la creación y utilización de **vistas simples en MySQL**. Se utiliza una tabla dedicada al almacenamiento de diferentes elementos de una saga de ciencia ficción, incluyendo nombre, categoría, puntaje, estado y fecha de creación.

## Objetivo

Crear una estructura de datos ejecutable desde cero, insertar información coherente y construir vistas que permitan consultar subconjuntos específicos de los registros sin modificar la tabla original.

## Estructura

La tabla utilizada es:

`intermedio_ejercicio_014`

Campos principales:

* `id`: identificador único.
* `nombre`: nombre del elemento de la saga.
* `categoria`: clasificación.
* `puntaje`: valoración numérica.
* `estado`: activo, revisión o inactivo.
* `creado_en`: fecha y hora de creación.

## Vistas creadas

### `vista_saga_activas`

Muestra únicamente los registros cuyo estado es `activo`.

### `vista_saga_destacadas`

Muestra los registros con un puntaje igual o superior a 90.

### `vista_saga_revision`

Muestra los registros que se encuentran pendientes de revisión.

## Consultas de verificación

Se incluyen consultas con `SELECT`, `ORDER BY`, `SHOW FULL TABLES` y `DESCRIBE` para comprobar que las vistas fueron creadas y funcionan correctamente.

## Resultado esperado

El ejercicio permite consultar información filtrada mediante vistas reutilizables, manteniendo separada la lógica de consulta de la tabla principal y facilitando la lectura y mantenimiento del código SQL.
