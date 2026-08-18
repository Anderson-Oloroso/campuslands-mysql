# Ejercicio 053 - UPDATE para arquitectura 3D

## Descripción

En este ejercicio de nivel básico se implementa y gestiona una base de datos en MySQL orientada a la temática de **arquitectura 3D**. La práctica se enfoca en el uso de **UPDATE**, asegurando la definición correcta de tipos de datos, restricciones, carga de datos consistentes y consultas útiles para la toma de decisiones.

---

## Objetivos de Aprendizaje

- Diseñar y crear tablas en MySQL aplicando buenas prácticas DDL.
- Poblar la tabla con datos representativos y realistas.
- Dominar el uso de **UPDATE** en consultas SQL.
- Realizar análisis agregados y filtros precisos sobre los registros.
- Documentar las decisiones técnicas y el flujo de ejecución.

---

## Estructura de la Tabla (`proyectos_bim`)

| Campo | Tipo de dato | Descripción |
| --- | --- | --- |
| `id_proyecto` | `INT AUTO_INCREMENT PRIMARY KEY` | Identificador del proyecto arquitectonico |
| `nombre_obra` | `VARCHAR(90) NOT NULL` | Nombre del edificio o residencia |
| `id_firma` | `INT NOT NULL` | Firma proyectista |
| `tipologia` | `ENUM('Residencial Lujo','Rascacielos Corporativo','Museo/Cultural','Hospitalario','Comercial') NOT NULL` | Tipo de inmueble |
| `area_m2` | `DECIMAL(10,2) NOT NULL` | Area construida en metros cuadrados |
| `presupuesto_millones` | `DECIMAL(8,2) NOT NULL` | Costo estimado de ejecucion en USD |
| `software_bim` | `ENUM('Revit BIM','Archicad','Rhino Grasshopper','SketchUp Pro') NOT NULL` | Plataforma de modelado |
| `estado_proyecto` | `ENUM('En Diseno','Aprobado','En Construccion','Finalizado') DEFAULT 'En Diseno'` | Campo estado_proyecto |

---

## Explicación de los Scripts

### 1. DDL (`ddl/schema.sql`)
Crea la base de datos `campuslands_mysql` si no existe, elimina versiones previas de la tabla para garantizar idempotencia y crea la tabla `proyectos_bim` con sus respectivas llaves primarias, tipos y restricciones.

### 2. DML (`dml/inserts.sql`)
Inserta registros de prueba cuidadosamente estructurados para representar diversos casos de negocio dentro de la temática de arquitectura 3D, permitiendo probar filtros, ordenamientos y cálculos.

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

---

## Conclusión

El desarrollo de este ejercicio consolida los fundamentos de bases de datos relacionales en MySQL, aplicando **UPDATE** en un entorno realista de **arquitectura 3D**. La separación modular de scripts y el uso de restricciones garantiza la integridad y claridad del modelo.
