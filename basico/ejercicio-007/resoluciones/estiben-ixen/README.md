# Ejercicio 007 - ORDER BY para liga de futbol

## Descripción

En este ejercicio de nivel básico se implementa y gestiona una base de datos en MySQL orientada a la temática de **liga de futbol**. La práctica se enfoca en el uso de **ORDER BY**, asegurando la definición correcta de tipos de datos, restricciones, carga de datos consistentes y consultas útiles para la toma de decisiones.

---

## Objetivos de Aprendizaje

- Diseñar y crear tablas en MySQL aplicando buenas prácticas DDL.
- Poblar la tabla con datos representativos y realistas.
- Dominar el uso de **ORDER BY** en consultas SQL.
- Realizar análisis agregados y filtros precisos sobre los registros.
- Documentar las decisiones técnicas y el flujo de ejecución.

---

## Estructura de la Tabla (`futbolistas`)

| Campo | Tipo de dato | Descripción |
| --- | --- | --- |
| `id_jugador` | `INT AUTO_INCREMENT PRIMARY KEY` | Identificador del futbolista |
| `nombre` | `VARCHAR(80) NOT NULL` | Nombre completo |
| `posicion` | `ENUM('Portero','Defensa','Centrocampista','Delantero') NOT NULL` | Demarcacion tactica |
| `numero_camiseta` | `INT NOT NULL` | Dorsal oficial |
| `id_club` | `INT NOT NULL` | Club al que pertenece |
| `goles` | `INT NOT NULL DEFAULT 0` | Goles anotados en la temporada |
| `asistencias` | `INT NOT NULL DEFAULT 0` | Pases de gol |
| `salario_mensual` | `DECIMAL(10,2) NOT NULL` | Sueldo mensual en USD |
| `estado` | `ENUM('Titular','Suplente','Lesionado') DEFAULT 'Titular'` | Campo estado |

---

## Explicación de los Scripts

### 1. DDL (`ddl/schema.sql`)
Crea la base de datos `campuslands_mysql` si no existe, elimina versiones previas de la tabla para garantizar idempotencia y crea la tabla `futbolistas` con sus respectivas llaves primarias, tipos y restricciones.

### 2. DML (`dml/inserts.sql`)
Inserta registros de prueba cuidadosamente estructurados para representar diversos casos de negocio dentro de la temática de liga de futbol, permitiendo probar filtros, ordenamientos y cálculos.

### 3. DQL (`dql/consultas.sql`)
Contiene consultas diseñadas para responder preguntas clave del negocio, aplicando **ORDER BY**, filtros con subconsultas y funciones de agregación (`COUNT`, `AVG`, `MIN`, `MAX`, `GROUP BY`).

---

## Conceptos Practicados

- `CREATE DATABASE` y `USE`
- `CREATE TABLE` y `DROP TABLE IF EXISTS`
- `PRIMARY KEY` y `AUTO_INCREMENT`
- `ORDER BY`
- `SELECT`, `WHERE`, `ORDER BY`, `LIMIT`
- Funciones de agregación (`COUNT()`, `AVG()`, `MIN()`, `MAX()`)

---

## Orden de Ejecución

1. Ejecutar `ddl/schema.sql` para crear la estructura.
2. Ejecutar `dml/inserts.sql` para poblar la información.
3. Ejecutar `dql/consultas.sql` para validar los reportes y resultados.

---

## Conclusión

El desarrollo de este ejercicio consolida los fundamentos de bases de datos relacionales en MySQL, aplicando **ORDER BY** en un entorno realista de **liga de futbol**. La separación modular de scripts y el uso de restricciones garantiza la integridad y claridad del modelo.
=======
# Ejercicio 007 - ORDER BY para Liga de Fútbol

## Descripción

Este proyecto tiene como objetivo practicar el uso de la cláusula **ORDER BY** en MySQL mediante el desarrollo de una base de datos inspirada en una liga de fútbol. La solución organiza información sobre equipos, permitiendo generar reportes ordenados según diferentes criterios.

La base de datos utilizada es **campuslands_mysql**.

---

# Estructura del proyecto

```
resoluciones/estiben-ixen/

├── README.md
├── ddl/
│   └── schema.sql
├── dml/
│   └── inserts.sql
└── dql/
    └── consultas.sql
```

---

# Orden de ejecución

Ejecutar los archivos en el siguiente orden:

1. `ddl/schema.sql`
2. `dml/inserts.sql`
3. `dql/consultas.sql`

Todos los scripts utilizan:

```sql
USE campuslands_mysql;
```

---

# Modelo de datos

La tabla **equipos** almacena la siguiente información:

- Nombre del equipo.
- Ciudad.
- Entrenador.
- Partidos jugados.
- Puntos obtenidos.
- Goles a favor.
- Goles en contra.
- Estado del equipo.

Se implementaron restricciones **NOT NULL**, **CHECK** y **ENUM** para garantizar la integridad de los datos.

---

# Consultas desarrolladas

Las consultas utilizan la cláusula **ORDER BY** para organizar la información según distintos criterios:

- Equipos con mayor cantidad de puntos.
- Equipos ordenados alfabéticamente.
- Equipos con más goles a favor.
- Equipos con menos goles en contra.
- Entrenadores ordenados por nombre.
- Equipos ordenados por ciudad.
- Equipos según partidos jugados.
- Equipos ordenados por estado y puntos.

Cada reporte utiliza alias descriptivos para mejorar la presentación de los resultados.

---

# Validación

La solución cumple correctamente cuando:

- `schema.sql` crea la tabla sin errores.
- `inserts.sql` registra todos los equipos.
- `consultas.sql` devuelve los resultados ordenados correctamente mediante **ORDER BY**.

---

# Conclusión

Este ejercicio permitió comprender cómo la cláusula **ORDER BY** facilita la organización de la información en MySQL. Gracias a esta instrucción es posible generar reportes claros y ordenados, mejorando la lectura y el análisis de los datos almacenados.
