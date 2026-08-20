# Ejercicio 019 - INSERT para paracaidismo

## Descripción y Objetivo

Este ejercicio implementa una solución de base de datos en MySQL relacionada con la temática de paracaidismo.

El objetivo principal es practicar la instrucción `INSERT`, creando registros coherentes dentro de una tabla diseñada para almacenar información sobre saltos de paracaidismo.

La solución utiliza una entidad principal llamada `saltos`.

Cada registro representa un salto y almacena información relacionada con:

- Paracaidista.
- Modalidad.
- Altura.
- Duración de la caída.
- Fecha.
- Estado.

La solución contiene 12 registros, superando el mínimo de 8 registros solicitado por el ejercicio.

También contiene 8 consultas, superando el mínimo de 5 consultas solicitado.

Las consultas permiten verificar que los datos insertados pueden utilizarse correctamente mediante filtros, ordenamientos, cálculos y agrupaciones.

---

# Modelo de Datos y Estructura

La solución utiliza una única tabla principal:

```text
saltos