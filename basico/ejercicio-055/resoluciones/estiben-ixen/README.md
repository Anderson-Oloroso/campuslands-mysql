# Ejercicio 055 - COUNT y SUM para laboratorio de formulas quimicas

## Descripción

En este ejercicio de nivel básico se implementa y gestiona una base de datos en MySQL orientada a la temática de **laboratorio de formulas quimicas**. La práctica se enfoca en el uso de **COUNT y SUM**, asegurando la definición correcta de tipos de datos, restricciones, carga de datos consistentes y consultas útiles para la toma de decisiones.

---

## Objetivos de Aprendizaje

- Diseñar y crear tablas en MySQL aplicando buenas prácticas DDL.
- Poblar la tabla con datos representativos y realistas.
- Dominar el uso de **COUNT y SUM** en consultas SQL.
- Realizar análisis agregados y filtros precisos sobre los registros.
- Documentar las decisiones técnicas y el flujo de ejecución.

---

## Estructura de la Tabla (`reactivos_quimicos`)

| Campo | Tipo de dato | Descripción |
| --- | --- | --- |
| `id_reactivo` | `INT AUTO_INCREMENT PRIMARY KEY` | Identificador del compuesto |
| `nombre_quimico` | `VARCHAR(80) NOT NULL` | Nombre IUPAC o comercial |
| `formula_molecular` | `VARCHAR(40) NOT NULL` | Formula empirica/quimica |
| `id_laboratorio` | `INT NOT NULL` | Laboratorio depositario |
| `pureza_porcentaje` | `DECIMAL(5,2) NOT NULL` | Grado de pureza (%) |
| `clasificacion_peligro` | `ENUM('Inflamable','Corrosivo','Toxico','Explosivo','Comburente','Inerte') NOT NULL` | Rombo de seguridad NFPA |
| `stock_gramos` | `DECIMAL(10,2) NOT NULL` | Cantidad disponible en gramos |
| `temperatura_almacenamiento_c` | `INT NOT NULL DEFAULT 20` | Temperatura requerida en Celsius |

---

## Explicación de los Scripts

### 1. DDL (`ddl/schema.sql`)
Crea la base de datos `campuslands_mysql` si no existe, elimina versiones previas de la tabla para garantizar idempotencia y crea la tabla `reactivos_quimicos` con sus respectivas llaves primarias, tipos y restricciones.

### 2. DML (`dml/inserts.sql`)
Inserta registros de prueba cuidadosamente estructurados para representar diversos casos de negocio dentro de la temática de laboratorio de formulas quimicas, permitiendo probar filtros, ordenamientos y cálculos.

### 3. DQL (`dql/consultas.sql`)
Contiene consultas diseñadas para responder preguntas clave del negocio, aplicando **COUNT y SUM**, filtros con subconsultas y funciones de agregación (`COUNT`, `AVG`, `MIN`, `MAX`, `GROUP BY`).

---

## Conceptos Practicados

- `CREATE DATABASE` y `USE`
- `CREATE TABLE` y `DROP TABLE IF EXISTS`
- `PRIMARY KEY` y `AUTO_INCREMENT`
- `COUNT y SUM`
- `SELECT`, `WHERE`, `ORDER BY`, `LIMIT`
- Funciones de agregación (`COUNT()`, `AVG()`, `MIN()`, `MAX()`)

---

## Orden de Ejecución

1. Ejecutar `ddl/schema.sql` para crear la estructura.
2. Ejecutar `dml/inserts.sql` para poblar la información.
3. Ejecutar `dql/consultas.sql` para validar los reportes y resultados.

---

## Conclusión

El desarrollo de este ejercicio consolida los fundamentos de bases de datos relacionales en MySQL, aplicando **COUNT y SUM** en un entorno realista de **laboratorio de formulas quimicas**. La separación modular de scripts y el uso de restricciones garantiza la integridad y claridad del modelo.
