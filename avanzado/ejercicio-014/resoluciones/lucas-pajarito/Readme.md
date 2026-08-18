# Ejercicio 014 - Event Scheduler para saga de ciencia ficción

## Dificultad

Avanzado inicial

## Temática

Saga de ciencia ficción

## Descripción

Este ejercicio practica el uso de **Event Scheduler en MySQL**, permitiendo ejecutar automáticamente una tarea programada sobre una base de datos.

## Objetivo

Crear una solución que almacene información de una saga de ciencia ficción y ejecute automáticamente un proceso periódico mediante un evento programado.

## Estructura

La tabla principal es `intermedio_ejercicio_014` y contiene:

* `id`: identificador único.
* `nombre`: nombre del elemento.
* `categoria`: clasificación.
* `puntaje`: valoración.
* `estado`: activo, revisión o inactivo.
* `creado_en`: fecha de creación.

También se utiliza `historial_eventos_014` para registrar las ejecuciones realizadas por el evento.

## Event Scheduler

El evento `evento_revision_saga_014` está configurado para ejecutarse diariamente. En cada ejecución consulta la cantidad de registros activos y almacena el resultado junto con la fecha de ejecución.

## Consultas

Todas las consultas se encuentran en un único script e incluyen:

* Consulta de registros.
* Filtrado por estado.
* Conteo por estado.
* Promedio de puntajes.
* Verificación de eventos.
* Consulta del evento mediante `information_schema`.
* Consulta del historial generado.

## Resultado esperado

El proyecto demuestra cómo automatizar tareas periódicas en MySQL utilizando Event Scheduler y conservar evidencia de sus ejecuciones mediante una tabla de historial.
