# Ejercicio 018 - PRIMARY KEY para viajes y turismo

## Descripción y Objetivo

Este ejercicio implementa una solución de base de datos en MySQL relacionada con viajes y turismo.

El objetivo principal es practicar el uso de `PRIMARY KEY` mediante una tabla que almacena información de diferentes destinos turísticos.

La entidad principal de la solución es `destinos`.

Cada destino cuenta con un identificador único llamado `id_destino`, que funciona como clave primaria de la tabla.

La solución también permite realizar consultas para obtener información útil sobre los destinos, incluyendo filtros, ordenamientos, rankings, agrupaciones y cálculos.

El ejercicio pertenece al nivel `Basico inicial`, por lo que se mantiene un diseño sencillo y se evita agregar complejidad que no sea necesaria.

La solución cumple con los requisitos mínimos establecidos:

- Uso exclusivo de MySQL.
- Uso de una `PRIMARY KEY`.
- Mínimo 8 registros.
- Mínimo 5 consultas.
- Restricciones de validación.
- Datos adecuados para filtros.
- Datos adecuados para ordenamientos.
- Datos adecuados para cálculos.
- Consultas con alias claros.
- Separación de DDL, DML y DQL.

---

# Modelo de Datos y Estructura

La solución utiliza una única tabla principal:

```text
destinos