# Ejercicio 006 - WHERE para autos hiperdeportivos

## Descripción

En este ejercicio de nivel básico se implementa y gestiona una base de datos en MySQL orientada a la temática de **autos hiperdeportivos**. La práctica se enfoca en el uso de **WHERE**, asegurando la definición correcta de tipos de datos, restricciones, carga de datos consistentes y consultas útiles para la toma de decisiones.

---

## Objetivos de Aprendizaje

- Diseñar y crear tablas en MySQL aplicando buenas prácticas DDL.
- Poblar la tabla con datos representativos y realistas.
- Dominar el uso de **WHERE** en consultas SQL.
- Realizar análisis agregados y filtros precisos sobre los registros.
- Documentar las decisiones técnicas y el flujo de ejecución.

---

## Estructura de la Tabla (`autos_hiperdeportivos`)

| Campo | Tipo de dato | Descripción |
| --- | --- | --- |
| `id_auto` | `INT AUTO_INCREMENT PRIMARY KEY` | Identificador unico del vehiculo |
| `modelo` | `VARCHAR(70) NOT NULL` | Modelo del superauto |
| `id_fabricante` | `INT NOT NULL` | Llave foranea al fabricante |
| `caballos_fuerza` | `INT NOT NULL` | Potencia en CV/HP |
| `velocidad_max` | `DECIMAL(6,2) NOT NULL` | Velocidad punta en km/h |
| `precio_millones` | `DECIMAL(6,2) NOT NULL` | Precio en millones de USD |
| `tipo_motor` | `ENUM('V8 Twin-Turbo','V12 Atmosferico','W16 Quad-Turbo','Electrico Puro','Hibrido') NOT NULL` | Tipo de propulsor |
| `fecha_lanzamiento` | `DATE NOT NULL` | Fecha oficial de presentacion |

---

## Explicación de los Scripts

### 1. DDL (`ddl/schema.sql`)
Crea la base de datos `campuslands_mysql` si no existe, elimina versiones previas de la tabla para garantizar idempotencia y crea la tabla `autos_hiperdeportivos` con sus respectivas llaves primarias, tipos y restricciones.

### 2. DML (`dml/inserts.sql`)
Inserta registros de prueba cuidadosamente estructurados para representar diversos casos de negocio dentro de la temática de autos hiperdeportivos, permitiendo probar filtros, ordenamientos y cálculos.

### 3. DQL (`dql/consultas.sql`)
Contiene consultas diseñadas para responder preguntas clave del negocio, aplicando **WHERE**, filtros con subconsultas y funciones de agregación (`COUNT`, `AVG`, `MIN`, `MAX`, `GROUP BY`).

---

## Conceptos Practicados

- `CREATE DATABASE` y `USE`
- `CREATE TABLE` y `DROP TABLE IF EXISTS`
- `PRIMARY KEY` y `AUTO_INCREMENT`
- `WHERE`
- `SELECT`, `WHERE`, `ORDER BY`, `LIMIT`
- Funciones de agregación (`COUNT()`, `AVG()`, `MIN()`, `MAX()`)

---

## Orden de Ejecución

1. Ejecutar `ddl/schema.sql` para crear la estructura.
2. Ejecutar `dml/inserts.sql` para poblar la información.
3. Ejecutar `dql/consultas.sql` para validar los reportes y resultados.

---

## Conclusión

El desarrollo de este ejercicio consolida los fundamentos de bases de datos relacionales en MySQL, aplicando **WHERE** en un entorno realista de **autos hiperdeportivos**. La separación modular de scripts y el uso de restricciones garantiza la integridad y claridad del modelo.
