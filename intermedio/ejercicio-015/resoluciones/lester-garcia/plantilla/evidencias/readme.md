# Biblioteca Gamer

## Nombre del alumno
**Lester Garcia**
_____________________________________

## Descripción general

Este proyecto implementa una base de datos relacional en MySQL para administrar una biblioteca especializada en videojuegos.

El sistema permite almacenar información sobre usuarios, plataformas, videojuegos y préstamos, manteniendo relaciones entre las diferentes entidades.

La solución está organizada mediante los archivos DDL, DML y DQL.

## Objetivo

Practicar la **carga de datos en MySQL**, aplicando una estructura organizada, datos coherentes y relaciones entre tablas.

El ejercicio busca demostrar que los datos pueden ser insertados correctamente y posteriormente utilizados para generar consultas y reportes.

## Estructura del proyecto

- `ddl.sql`: creación de la base de datos, tablas, relaciones y restricciones.
- `dml.sql`: carga de datos de prueba.
- `dql.sql`: consultas para verificar y analizar los datos.
- `README.md`: documentación del ejercicio.

## Explicación general de la solución

La base de datos está compuesta por cuatro entidades principales:

- Usuarios
- Plataformas
- Videojuegos
- Préstamos

La tabla `prestamos` relaciona a los usuarios con los videojuegos que solicitan.

La tabla `videojuegos` mantiene una relación con `plataformas`, permitiendo conocer en qué plataforma se encuentra disponible cada título.

## Carga de datos

Se cargaron:

- 6 usuarios.
- 6 plataformas.
- 10 videojuegos.
- 10 préstamos.

Los datos fueron diseñados de forma coherente para representar diferentes situaciones dentro de una biblioteca gamer.

Los préstamos utilizan tres estados:

- `Activo`
- `Devuelto`
- `Atrasado`

La restricción `CHECK` evita que se almacenen estados diferentes a los permitidos.


## Decisiones técnicas

Se utilizaron claves primarias para identificar de manera única los registros.

Las claves foráneas permiten mantener la integridad referencial entre usuarios, videojuegos, plataformas y préstamos.

Se utilizó una restricción `CHECK` en la tabla `prestamos` para controlar los estados válidos.

Los datos fueron cargados mediante sentencias `INSERT INTO`, procurando mantener valores coherentes y suficientes para comprobar posteriormente el funcionamiento de las consultas.


## Verificación de datos

Se utilizaron consultas `COUNT()` para comprobar que la carga de datos se realizó correctamente.

Los registros esperados son:

| Tabla | Registros |
|---|---:|
| usuarios | 6 |
| plataformas | 6 |
| videojuegos | 10 |
| prestamos | 10 |

## Ejecución

Los archivos deben ejecutarse en el siguiente orden:

1. `ddl.sql`
2. `dml.sql`
3. `dql.sql`

Primero se crea la estructura, después se cargan los datos y finalmente se ejecutan las consultas de verificación y análisis.