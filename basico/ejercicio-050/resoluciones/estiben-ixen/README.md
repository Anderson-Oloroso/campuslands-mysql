# Ejercicio 050 - SELECT para estudio de tatuajes

## Descripción

En este ejercicio de nivel básico se implementa y gestiona una base de datos en MySQL orientada a la temática de **estudio de tatuajes**. La práctica se enfoca en el uso de **SELECT**, asegurando la definición correcta de tipos de datos, restricciones, carga de datos consistentes y consultas útiles para la toma de decisiones.

---

## Objetivos de Aprendizaje

- Diseñar y crear tablas en MySQL aplicando buenas prácticas DDL.
- Poblar la tabla con datos representativos y realistas.
- Dominar el uso de **SELECT** en consultas SQL.
- Realizar análisis agregados y filtros precisos sobre los registros.
- Documentar las decisiones técnicas y el flujo de ejecución.

---

## Estructura de la Tabla (`citas_tatuajes`)

| Campo | Tipo de dato | Descripción |
| --- | --- | --- |
| `id_cita` | `INT AUTO_INCREMENT PRIMARY KEY` | Identificador de la sesion |
| `cliente` | `VARCHAR(80) NOT NULL` | Nombre del cliente |
| `id_artista` | `INT NOT NULL` | Tatuador elegido |
| `zona_cuerpo` | `ENUM('Brazo','Espalda','Pecho','Pierna','Costillas','Cuello','Mano') NOT NULL` | Ubicacion corporal |
| `horas_sesion` | `DECIMAL(4,2) NOT NULL` | Duracion en horas |
| `costo_total` | `DECIMAL(8,2) NOT NULL` | Valor total pagado |
| `estado` | `ENUM('Confirmada','Completada','Cancelada') DEFAULT 'Completada'` | Estado |
| `fecha_cita` | `DATE NOT NULL` | Fecha de realizacion |

---

## Explicación de los Scripts

### 1. DDL (`ddl/schema.sql`)
Crea la base de datos `campuslands_mysql` si no existe, elimina versiones previas de la tabla para garantizar idempotencia y crea la tabla `citas_tatuajes` con sus respectivas llaves primarias, tipos y restricciones.

### 2. DML (`dml/inserts.sql`)
Inserta registros de prueba cuidadosamente estructurados para representar diversos casos de negocio dentro de la temática de estudio de tatuajes, permitiendo probar filtros, ordenamientos y cálculos.

### 3. DQL (`dql/consultas.sql`)
Contiene consultas diseñadas para responder preguntas clave del negocio, aplicando **SELECT**, filtros con subconsultas y funciones de agregación (`COUNT`, `AVG`, `MIN`, `MAX`, `GROUP BY`).

---

## Conceptos Practicados

- `CREATE DATABASE` y `USE`
- `CREATE TABLE` y `DROP TABLE IF EXISTS`
- `PRIMARY KEY` y `AUTO_INCREMENT`
- `SELECT`
- `SELECT`, `WHERE`, `ORDER BY`, `LIMIT`
- Funciones de agregación (`COUNT()`, `AVG()`, `MIN()`, `MAX()`)

---

## Orden de Ejecución

1. Ejecutar `ddl/schema.sql` para crear la estructura.
2. Ejecutar `dml/inserts.sql` para poblar la información.
3. Ejecutar `dql/consultas.sql` para validar los reportes y resultados.

---

## Conclusión

El desarrollo de este ejercicio consolida los fundamentos de bases de datos relacionales en MySQL, aplicando **SELECT** en un entorno realista de **estudio de tatuajes**. La separación modular de scripts y el uso de restricciones garantiza la integridad y claridad del modelo.
