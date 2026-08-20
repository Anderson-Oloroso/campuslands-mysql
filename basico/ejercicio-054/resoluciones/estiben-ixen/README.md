# Ejercicio 054 - DELETE controlado para soldadura

## Descripción

En este ejercicio de nivel básico se implementa y gestiona una base de datos en MySQL orientada a la temática de **soldadura**. La práctica se enfoca en el uso de **DELETE controlado**, asegurando la definición correcta de tipos de datos, restricciones, carga de datos consistentes y consultas útiles para la toma de decisiones.

---

## Objetivos de Aprendizaje

- Diseñar y crear tablas en MySQL aplicando buenas prácticas DDL.
- Poblar la tabla con datos representativos y realistas.
- Dominar el uso de **DELETE controlado** en consultas SQL.
- Realizar análisis agregados y filtros precisos sobre los registros.
- Documentar las decisiones técnicas y el flujo de ejecución.

---

## Estructura de la Tabla (`proyectos_soldadura`)

| Campo | Tipo de dato | Descripción |
| --- | --- | --- |
| `id_proyecto` | `INT AUTO_INCREMENT PRIMARY KEY` | Identificador de la estructura soldada |
| `nombre_estructura` | `VARCHAR(80) NOT NULL` | Pieza o proyecto industrial |
| `id_taller` | `INT NOT NULL` | Taller que ejecuta la obra |
| `proceso_soldadura` | `ENUM('SMAW (Electrodo)','GMAW (MIG/MAG)','GTAW (TIG)','FCAW (Tubular)','SAW (Arco Sumergido)') NOT NULL` | Metodo de soldeo |
| `tipo_material` | `ENUM('Acero al Carbono ASTM A36','Acero Inoxidable 316L','Aluminio 6061','Titanio Grado 5') NOT NULL` | Metal base |
| `peso_toneladas` | `DECIMAL(8,2) NOT NULL` | Tonelaje de la estructura |
| `inspeccion_radiografica` | `ENUM('Aprobado','Con Defectos','Pendiente') DEFAULT 'Aprobado'` | Prueba NDT rayos X |
| `costo_total` | `DECIMAL(9,2) NOT NULL` | Costo en USD |

---

## Explicación de los Scripts

### 1. DDL (`ddl/schema.sql`)
Crea la base de datos `campuslands_mysql` si no existe, elimina versiones previas de la tabla para garantizar idempotencia y crea la tabla `proyectos_soldadura` con sus respectivas llaves primarias, tipos y restricciones.

### 2. DML (`dml/inserts.sql`)
Inserta registros de prueba cuidadosamente estructurados para representar diversos casos de negocio dentro de la temática de soldadura, permitiendo probar filtros, ordenamientos y cálculos.

### 3. DQL (`dql/consultas.sql`)
Contiene consultas diseñadas para responder preguntas clave del negocio, aplicando **DELETE controlado**, filtros con subconsultas y funciones de agregación (`COUNT`, `AVG`, `MIN`, `MAX`, `GROUP BY`).

---

## Conceptos Practicados

- `CREATE DATABASE` y `USE`
- `CREATE TABLE` y `DROP TABLE IF EXISTS`
- `PRIMARY KEY` y `AUTO_INCREMENT`
- `DELETE controlado`
- `SELECT`, `WHERE`, `ORDER BY`, `LIMIT`
- Funciones de agregación (`COUNT()`, `AVG()`, `MIN()`, `MAX()`)

---

## Orden de Ejecución

1. Ejecutar `ddl/schema.sql` para crear la estructura.
2. Ejecutar `dml/inserts.sql` para poblar la información.
3. Ejecutar `dql/consultas.sql` para validar los reportes y resultados.

---

## Conclusión

El desarrollo de este ejercicio consolida los fundamentos de bases de datos relacionales en MySQL, aplicando **DELETE controlado** en un entorno realista de **soldadura**. La separación modular de scripts y el uso de restricciones garantiza la integridad y claridad del modelo.
