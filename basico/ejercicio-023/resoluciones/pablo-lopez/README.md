# Ejercicio 023 - UPDATE para arquitectura 3D

## Descripcion y Objetivo

Este proyecto corresponde al Ejercicio 023 del nivel basico aplicado de Campuslands y utiliza como tematica la arquitectura 3D.

El objetivo principal es practicar la sentencia `UPDATE` en MySQL mediante una base de datos que representa proyectos de arquitectura desarrollados mediante herramientas de modelado y diseño 3D.

La solucion permite almacenar informacion sobre diferentes proyectos arquitectonicos, incluyendo el nombre del proyecto, arquitecto responsable, tipo de proyecto, software utilizado, area, presupuesto, fecha de entrega y estado.

La base de datos fue diseñada para ejecutarse desde cero mediante tres archivos separados:

- `ddl/schema.sql`: crea la estructura de la tabla.
- `dml/inserts.sql`: inserta los datos iniciales.
- `dql/consultas.sql`: realiza consultas y actualizaciones.

La solucion contiene:

- 1 tabla.
- 10 registros.
- 7 operaciones y consultas.
- Restricciones de validacion.
- Operaciones `UPDATE`.
- Consultas `SELECT` para comprobar los cambios.
- Filtros mediante `WHERE`.
- Ordenamientos mediante `ORDER BY`.

El objetivo es demostrar que las modificaciones realizadas mediante `UPDATE` pueden comprobarse posteriormente mediante consultas.

---

## Modelo de Datos y Estructura

La solucion utiliza una tabla principal denominada:

`proyectos_arquitectura_3d`

Esta tabla representa proyectos de arquitectura realizados mediante herramientas de diseño y modelado 3D.

No se crean tablas adicionales porque el README del ejercicio no exige relaciones entre varias entidades. Una sola tabla permite resolver el problema de manera sencilla y adecuada para el nivel basico aplicado.

### Tabla `proyectos_arquitectura_3d`

| Columna | Tipo | Descripcion |
|---|---|---|
| `id_proyecto` | `INT UNSIGNED` | Identificador unico del proyecto |
| `nombre_proyecto` | `VARCHAR(100)` | Nombre del proyecto arquitectonico |
| `arquitecto` | `VARCHAR(100)` | Arquitecto responsable |
| `tipo_proyecto` | `VARCHAR(50)` | Tipo de proyecto |
| `software` | `VARCHAR(50)` | Programa utilizado para el modelado |
| `area_m2` | `DECIMAL(10,2)` | Area del proyecto en metros cuadrados |
| `presupuesto` | `DECIMAL(12,2)` | Presupuesto estimado |
| `fecha_entrega` | `DATE` | Fecha prevista de entrega |
| `estado` | `VARCHAR(20)` | Estado actual del proyecto |

### Clave primaria

La columna `id_proyecto` funciona como clave primaria.

Se utiliza:

```sql
id_proyecto INT UNSIGNED AUTO_INCREMENT PRIMARY KEY