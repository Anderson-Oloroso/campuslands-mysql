

## Descripción

En este ejercicio de nivel básico se implementa y gestiona una base de datos en MySQL orientada a la temática de **futbol sala**. La práctica se enfoca en el uso de **UPDATE**, asegurando la definición correcta de tipos de datos, restricciones, carga de datos consistentes y consultas útiles para la toma de decisiones.

---

## Objetivos de Aprendizaje

- Diseñar y crear tablas en MySQL aplicando buenas prácticas DDL.
- Poblar la tabla con datos representativos y realistas.
- Dominar el uso de **UPDATE** en consultas SQL.
- Realizar análisis agregados y filtros precisos sobre los registros.
- Documentar las decisiones técnicas y el flujo de ejecución.

---

## Estructura de la Tabla (`jugadores_futsal`)

| Campo | Tipo de dato | Descripción |
| --- | --- | --- |
| `id_jugador` | `INT AUTO_INCREMENT PRIMARY KEY` | Identificador del jugador |
| `nombre` | `VARCHAR(70) NOT NULL` | Nombre del jugador |
| `posicion` | `ENUM('Portero','Cierre','Ala','Pivot') NOT NULL` | Posicion en campo |
| `id_equipo` | `INT NOT NULL` | Equipo asignado |
| `goles` | `INT NOT NULL DEFAULT 0` | Goles en temporada |
| `tarjetas_amarillas` | `INT NOT NULL DEFAULT 0` | Amonestaciones |
| `tarjetas_rojas` | `INT NOT NULL DEFAULT 0` | Expulsiones |
| `valoracion` | `DECIMAL(4,2) NOT NULL DEFAULT 7.00` | Puntaje de rendimiento |

---

## Explicación de los Scripts

### 1. DDL (`ddl/schema.sql`)
Crea la base de datos `campuslands_mysql` si no existe, elimina versiones previas de la tabla para garantizar idempotencia y crea la tabla `jugadores_futsal` con sus respectivas llaves primarias, tipos y restricciones.

### 2. DML (`dml/inserts.sql`)
Inserta registros de prueba cuidadosamente estructurados para representar diversos casos de negocio dentro de la temática de futbol sala, permitiendo probar filtros, ordenamientos y cálculos.

### 3. DQL (`dql/consultas.sql`)
Contiene consultas diseñadas para responder preguntas clave del negocio, aplicando **UPDATE**, filtros con subconsultas y funciones de agregación (`COUNT`, `AVG`, `MIN`, `MAX`, `GROUP BY`).

---

## Conceptos Practicados

- `CREATE DATABASE` y `USE`
- `CREATE TABLE` y `DROP TABLE IF EXISTS`
- `PRIMARY KEY` y `AUTO_INCREMENT`
- `UPDATE`
- `SELECT`, `WHERE`, `ORDER BY`, `LIMIT`
- Funciones de agregación (`COUNT()`, `AVG()`, `MIN()`, `MAX()`)

---

## Orden de Ejecución

1. Ejecutar `ddl/schema.sql` para crear la estructura.
2. Ejecutar `dml/inserts.sql` para poblar la información.
3. Ejecutar `dql/consultas.sql` para validar los reportes y resultados.
=======
# Ejercicio 008 - UPDATE para Fútbol Sala

## Descripción

El objetivo de esta práctica es aprender el uso de la instrucción **UPDATE** en MySQL mediante un escenario basado en un torneo de fútbol sala. Se desarrolló una tabla con información de jugadores y posteriormente se realizaron diferentes actualizaciones sobre los registros existentes.

La solución fue desarrollada utilizando la base de datos **campuslands_mysql**.

---

## Estructura del proyecto

```text
resoluciones/nombre-apellido/

├── README.md
├── ddl/
│   └── schema.sql
├── dml/
│   └── inserts.sql
└── dql/
    └── consultas.sql
```

---

## Orden de ejecución

Ejecutar los archivos en el siguiente orden:

1. ddl/schema.sql
2. dml/inserts.sql
3. dql/consultas.sql

---

## Modelo de datos

Se creó la tabla **jugadores_futbol_sala**, la cual almacena:

- Nombre
- Equipo
- Posición
- Edad
- Goles
- Asistencias
- Salario
- Estado

Se aplicaron restricciones **NOT NULL**, **CHECK**, **DEFAULT** y **ENUM** para garantizar la integridad de los datos.

---

## Operaciones realizadas

Durante la práctica se realizaron varias actualizaciones utilizando **UPDATE**:

- Actualizar el salario de un jugador.
- Cambiar el estado de un jugador lesionado.
- Incrementar la cantidad de goles.
- Cambiar un jugador de equipo.
- Modificar las asistencias.
- Actualizar el salario de todos los jugadores activos.

Cada actualización fue verificada mediante una consulta **SELECT**.

---

## Validación

La solución es correcta cuando:

- schema.sql crea correctamente la tabla.
- inserts.sql registra los diez jugadores.
- consultas.sql ejecuta correctamente todas las instrucciones UPDATE.
- Los SELECT muestran la información actualizada.

