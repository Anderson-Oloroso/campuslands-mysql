# Ejercicio 025 - UNIQUE para laboratorio de formulas quimicas

## Descripción

En este ejercicio de nivel intermedio se diseña e implementa un modelo relacional en MySQL para la temática de **laboratorio de formulas quimicas**, aplicando conceptos avanzados de integridad referencial, normalización de datos y consultas multi-tabla enfocadas en **UNIQUE**.

---

## Objetivos de Aprendizaje

- Diseñar esquemas relacionales normalizados con claves primarias y foráneas (`FOREIGN KEY`).
- Implementar restricciones de integridad y comportamiento en cascada (`ON DELETE CASCADE`).
- Dominar el uso de **UNIQUE** en escenarios de negocio reales.
- Construir consultas complejas utilizando `INNER JOIN`, `LEFT JOIN`, `GROUP BY`, `HAVING` y subconsultas.
- Documentar las entidades y su relación de cardinalidad (1:N).

---

## Estructura de las Tablas

### Tabla Principal: `laboratorios_quimicos`
Almacena instituciones y plantas de analisis fisico-quimico y farmaceutico.

| Campo | Tipo de dato | Descripción |
| --- | --- | --- |
| `id_laboratorio` | `INT AUTO_INCREMENT PRIMARY KEY` | Identificador del laboratorio |
| `nombre_laboratorio` | `VARCHAR(70) NOT NULL UNIQUE` | Nombre del centro de investigacion |
| `nivel_bioseguridad` | `ENUM('BSL-1','BSL-2','BSL-3','BSL-4') NOT NULL` | Nivel de contencion |
| `responsable_sanitario` | `VARCHAR(70) NOT NULL` | Quimico Farmaceutico titular |

### Tabla Secundaria: `reactivos_quimicos`
Almacena reactivos, compuestos quimicos, grados de pureza y almacenamiento.

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
Crea la base de datos `campuslands_mysql`, elimina en orden correcto las tablas existentes para evitar conflictos de integridad referencial y crea las tablas `laboratorios_quimicos` y `reactivos_quimicos` con sus restricciones de clave foránea.

### 2. DML (`dml/inserts.sql`)
Inserta registros consistentes en `laboratorios_quimicos` y posteriormente en `reactivos_quimicos`, garantizando que las claves foráneas correspondan a registros existentes y permitiendo evaluar casos normales y casos límite.

### 3. DQL (`dql/consultas.sql`)
Presenta un conjunto de consultas analíticas aplicando **UNIQUE**, uniones relacionales (`JOIN`), filtros agrupados (`HAVING`), subconsultas y reportes ordenados.

---

## Conceptos Practicados

- Integridad Referencial (`FOREIGN KEY`, `REFERENCES`)
- Normalización relacional (1FN, 2FN, 3FN)
- `UNIQUE`
- `INNER JOIN` y `LEFT JOIN`
- `GROUP BY` y cláusula `HAVING`
- Subconsultas escalares y correlacionadas

---

## Orden de Ejecución

1. Ejecutar `ddl/schema.sql` (creación de base de datos, tablas y restricciones).
2. Ejecutar `dml/inserts.sql` (poblado de tablas respetando la jerarquía relacional).
3. Ejecutar `dql/consultas.sql` (validación de reportes y consultas intermedias).

---

## Conclusión

El diseño implementado asegura la integridad referencial y elimina la redundancia mediante normalización. El dominio de **UNIQUE** permite explotar los datos relacionales de manera eficiente para generar valor analítico en el contexto de **laboratorio de formulas quimicas**.
