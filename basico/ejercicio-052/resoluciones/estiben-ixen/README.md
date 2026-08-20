# Ejercicio 052 - ORDER BY para animacion 3D

## Descripción

En este ejercicio de nivel básico se implementa y gestiona una base de datos en MySQL orientada a la temática de **animacion 3D**. La práctica se enfoca en el uso de **ORDER BY**, asegurando la definición correcta de tipos de datos, restricciones, carga de datos consistentes y consultas útiles para la toma de decisiones.

---

## Objetivos de Aprendizaje

- Diseñar y crear tablas en MySQL aplicando buenas prácticas DDL.
- Poblar la tabla con datos representativos y realistas.
- Dominar el uso de **ORDER BY** en consultas SQL.
- Realizar análisis agregados y filtros precisos sobre los registros.
- Documentar las decisiones técnicas y el flujo de ejecución.

---

## Estructura de la Tabla (`personajes_3d`)

| Campo | Tipo de dato | Descripción |
| --- | --- | --- |
| `id_personaje` | `INT AUTO_INCREMENT PRIMARY KEY` | Identificador del modelo 3D |
| `nombre_modelo` | `VARCHAR(70) NOT NULL` | Nombre del asset 3D |
| `id_estudio` | `INT NOT NULL` | Estudio creador |
| `software_modelado` | `ENUM('Maya','Blender','ZBrush','Houdini','Cinema 4D') NOT NULL` | Software base |
| `poligonos_count` | `INT NOT NULL` | Conteo total de poligonos |
| `tipo_rig` | `ENUM('Bipedo Humanoide','Facial Avanzado','Criatura Cuadrupeda','Mecanico/Robot') NOT NULL` | Estructura osea |
| `texturas_4k` | `ENUM('Si','No') DEFAULT 'Si'` | Texturizado en 4K UDIM |
| `costo_produccion` | `DECIMAL(8,2) NOT NULL` | Costo del modelado y rigging en USD |

---

## Explicación de los Scripts

### 1. DDL (`ddl/schema.sql`)
Crea la base de datos `campuslands_mysql` si no existe, elimina versiones previas de la tabla para garantizar idempotencia y crea la tabla `personajes_3d` con sus respectivas llaves primarias, tipos y restricciones.

### 2. DML (`dml/inserts.sql`)
Inserta registros de prueba cuidadosamente estructurados para representar diversos casos de negocio dentro de la temática de animacion 3D, permitiendo probar filtros, ordenamientos y cálculos.

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

El desarrollo de este ejercicio consolida los fundamentos de bases de datos relacionales en MySQL, aplicando **ORDER BY** en un entorno realista de **animacion 3D**. La separación modular de scripts y el uso de restricciones garantiza la integridad y claridad del modelo.
