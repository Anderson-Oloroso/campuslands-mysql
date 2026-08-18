# Ejercicio 048 - PRIMARY KEY para viajes y turismo

## Descripción

En este ejercicio de nivel básico se implementa y gestiona una base de datos en MySQL orientada a la temática de **viajes y turismo**. La práctica se enfoca en el uso de **PRIMARY KEY**, asegurando la definición correcta de tipos de datos, restricciones, carga de datos consistentes y consultas útiles para la toma de decisiones.

---

## Objetivos de Aprendizaje

- Diseñar y crear tablas en MySQL aplicando buenas prácticas DDL.
- Poblar la tabla con datos representativos y realistas.
- Dominar el uso de **PRIMARY KEY** en consultas SQL.
- Realizar análisis agregados y filtros precisos sobre los registros.
- Documentar las decisiones técnicas y el flujo de ejecución.

---

## Estructura de la Tabla (`paquetes_turisticos`)

| Campo | Tipo de dato | Descripción |
| --- | --- | --- |
| `id_paquete` | `INT AUTO_INCREMENT PRIMARY KEY` | Identificador del paquete |
| `nombre_paquete` | `VARCHAR(90) NOT NULL` | Nombre del tour |
| `id_destino` | `INT NOT NULL` | Destino principal |
| `duracion_dias` | `INT NOT NULL` | Cantidad de noches y dias |
| `precio_por_persona` | `DECIMAL(8,2) NOT NULL` | Precio en USD |
| `cupos_maximos` | `INT NOT NULL` | Capacidad por grupo |
| `nivel_dificultad` | `ENUM('Facil','Moderado','Exigente') DEFAULT 'Facil'` | Exigencia fisica |
| `incluye_vuelo` | `ENUM('Si','No') DEFAULT 'Si'` | Campo incluye_vuelo |

---

## Explicación de los Scripts

### 1. DDL (`ddl/schema.sql`)
Crea la base de datos `campuslands_mysql` si no existe, elimina versiones previas de la tabla para garantizar idempotencia y crea la tabla `paquetes_turisticos` con sus respectivas llaves primarias, tipos y restricciones.

### 2. DML (`dml/inserts.sql`)
Inserta registros de prueba cuidadosamente estructurados para representar diversos casos de negocio dentro de la temática de viajes y turismo, permitiendo probar filtros, ordenamientos y cálculos.

### 3. DQL (`dql/consultas.sql`)
Contiene consultas diseñadas para responder preguntas clave del negocio, aplicando **PRIMARY KEY**, filtros con subconsultas y funciones de agregación (`COUNT`, `AVG`, `MIN`, `MAX`, `GROUP BY`).

---

## Conceptos Practicados

- `CREATE DATABASE` y `USE`
- `CREATE TABLE` y `DROP TABLE IF EXISTS`
- `PRIMARY KEY` y `AUTO_INCREMENT`
- `PRIMARY KEY`
- `SELECT`, `WHERE`, `ORDER BY`, `LIMIT`
- Funciones de agregación (`COUNT()`, `AVG()`, `MIN()`, `MAX()`)

---

## Orden de Ejecución

1. Ejecutar `ddl/schema.sql` para crear la estructura.
2. Ejecutar `dml/inserts.sql` para poblar la información.
3. Ejecutar `dql/consultas.sql` para validar los reportes y resultados.

---

## Conclusión

El desarrollo de este ejercicio consolida los fundamentos de bases de datos relacionales en MySQL, aplicando **PRIMARY KEY** en un entorno realista de **viajes y turismo**. La separación modular de scripts y el uso de restricciones garantiza la integridad y claridad del modelo.
