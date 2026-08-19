# Ejercicio 022 - ORDER BY para animacion 3D

## Descripcion y Objetivo

Este proyecto corresponde al Ejercicio 022 del nivel basico aplicado de Campuslands y utiliza como tematica la animacion 3D.

El objetivo principal es practicar el uso de la clausula `ORDER BY` en MySQL para organizar resultados de consultas de acuerdo con diferentes criterios.

La solucion representa informacion relacionada con producciones de animacion 3D. Cada registro contiene datos sobre el titulo de la animacion, el animador responsable, la categoria, el software utilizado, la duracion, el costo, la fecha de produccion y el estado actual.

La base de datos fue diseñada para ejecutarse desde cero mediante tres archivos separados:

- `ddl/schema.sql`: crea la estructura.
- `dml/inserts.sql`: inserta los datos.
- `dql/consultas.sql`: ejecuta las consultas.

La solucion cumple los requisitos establecidos en el ejercicio:

- Utiliza exclusivamente MySQL.
- Utiliza nombres de tablas y columnas consistentes.
- Aplica validaciones mediante restricciones `CHECK`.
- Contiene 10 registros utiles.
- Contiene 7 consultas.
- Permite realizar filtros.
- Permite realizar ordenamientos.
- Permite realizar calculos.
- Utiliza alias claros en los resultados que funcionan como reportes.

---

## Modelo de Datos y Estructura

La solucion utiliza una tabla principal denominada:

`animaciones_3d`

La tabla representa producciones o proyectos de animacion 3D registrados en el sistema.

No se agregaron tablas adicionales porque el README del ejercicio no exige relaciones entre varias entidades. Mantener una sola tabla permite resolver el ejercicio de manera sencilla y apropiada para el nivel basico aplicado.

### Tabla `animaciones_3d`

| Columna | Tipo | Descripcion |
|---|---|---|
| `id_animacion` | `INT UNSIGNED` | Identificador unico de la animacion |
| `titulo` | `VARCHAR(100)` | Nombre de la produccion |
| `animador` | `VARCHAR(100)` | Nombre del animador responsable |
| `categoria` | `VARCHAR(50)` | Categoria o genero de la animacion |
| `software` | `VARCHAR(50)` | Software utilizado para realizar la animacion |
| `duracion_segundos` | `DECIMAL(8,2)` | Duracion de la animacion en segundos |
| `costo` | `DECIMAL(10,2)` | Costo estimado de la produccion |
| `fecha_produccion` | `DATE` | Fecha asociada a la produccion |
| `estado` | `VARCHAR(20)` | Estado actual del proyecto |

### Clave primaria

La columna `id_animacion` es la clave primaria.

Se utiliza:

`INT UNSIGNED AUTO_INCREMENT PRIMARY KEY`

Esto garantiza que cada animacion tenga un identificador unico generado automaticamente por MySQL.

### Campos obligatorios

Los campos principales utilizan `NOT NULL`.

Esto evita almacenar registros incompletos y mantiene la informacion necesaria para realizar los reportes.

### Validacion de duracion

Se utiliza:

`CHECK (duracion_segundos > 0)`

Esta restriccion evita registrar una animacion con una duracion negativa o igual a cero.

### Validacion del costo

Se utiliza:

`CHECK (costo >= 0)`

Esto permite proyectos gratuitos, pero evita registrar costos negativos.

### Validacion del estado

El estado solamente puede tomar los siguientes valores:

- `borrador`
- `produccion`
- `finalizada`

La restriccion utilizada es:

`CHECK (estado IN ('borrador', 'produccion', 'finalizada'))`

Esto mantiene consistencia en los estados registrados.

---

## Instrucciones de Ejecucion Paso a Paso

Los archivos deben ejecutarse en el siguiente orden:

`DDL -> DML -> DQL`

### Paso 1. Preparar la base de datos

La solucion utiliza la base de datos:

`campuslands_mysql`

El servidor MySQL debe estar iniciado antes de ejecutar los scripts.

### Paso 2. Ejecutar `ddl/schema.sql`

El archivo `ddl/schema.sql` crea la tabla `animaciones_3d`.

El script realiza las siguientes acciones:

1. Selecciona la base de datos `campuslands_mysql`.
2. Elimina la tabla si ya existe.
3. Crea la tabla.
4. Define la clave primaria.
5. Define los tipos de datos.
6. Define las restricciones.

Despues de ejecutar el DDL se puede comprobar la estructura mediante:

```sql
USE campuslands_mysql;

DESCRIBE animaciones_3d;