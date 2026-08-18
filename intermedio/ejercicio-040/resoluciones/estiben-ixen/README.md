# Ejercicio 040 - UNIQUE para carreras urbanas

## Descripción

En este ejercicio de nivel intermedio se diseña e implementa un modelo relacional en MySQL para la temática de **carreras urbanas**, aplicando conceptos avanzados de integridad referencial, normalización de datos y consultas multi-tabla enfocadas en **UNIQUE**.

---

## Objetivos de Aprendizaje

- Diseñar esquemas relacionales normalizados con claves primarias y foráneas (`FOREIGN KEY`).
- Implementar restricciones de integridad y comportamiento en cascada (`ON DELETE CASCADE`).
- Dominar el uso de **UNIQUE** en escenarios de negocio reales.
- Construir consultas complejas utilizando `INNER JOIN`, `LEFT JOIN`, `GROUP BY`, `HAVING` y subconsultas.
- Documentar las entidades y su relación de cardinalidad (1:N).

---

## Estructura de las Tablas

### Tabla Principal: `pilotos_urbanos`
Almacena pilotos de carreras nocturnas callejeras.

| Campo | Tipo de dato | Descripción |
| --- | --- | --- |
| `id_piloto` | `INT AUTO_INCREMENT PRIMARY KEY` | Identificador del corredor |
| `apodo` | `VARCHAR(40) NOT NULL UNIQUE` | Alias en el circuito callejero |
| `nombre_real` | `VARCHAR(70) NOT NULL` | Nombre real |
| `reputacion` | `INT NOT NULL DEFAULT 100` | Puntos de respeto callejero |
| `estado` | `ENUM('Activo','Buscado','Retirado') DEFAULT 'Activo'` | Campo estado |

### Tabla Secundaria: `vehiculos_tuning`
Almacena vehiculos modificados con mejoras de rendimiento y nitro.

| Campo | Tipo de dato | Descripción |
| --- | --- | --- |
| `id_vehiculo` | `INT AUTO_INCREMENT PRIMARY KEY` | Identificador del coche |
| `modelo` | `VARCHAR(60) NOT NULL` | Marca y modelo del auto |
| `id_piloto` | `INT NOT NULL` | Piloto propietario |
| `traccion` | `ENUM('RWD','AWD','FWD') NOT NULL` | Tipo de traccion |
| `potencia_hp` | `INT NOT NULL` | Caballos de fuerza modificados |
| `oxido_nitroso` | `ENUM('Si','No') DEFAULT 'Si'` | Equipamiento de nitro NOS |
| `carreras_ganadas` | `INT NOT NULL DEFAULT 0` | Victorias en piques |
| `valor_tuning` | `DECIMAL(8,2) NOT NULL` | Inversion en modificaciones en USD |

---

## Explicación de los Scripts

### 1. DDL (`ddl/schema.sql`)
Crea la base de datos `campuslands_mysql`, elimina en orden correcto las tablas existentes para evitar conflictos de integridad referencial y crea las tablas `pilotos_urbanos` y `vehiculos_tuning` con sus restricciones de clave foránea.

### 2. DML (`dml/inserts.sql`)
Inserta registros consistentes en `pilotos_urbanos` y posteriormente en `vehiculos_tuning`, garantizando que las claves foráneas correspondan a registros existentes y permitiendo evaluar casos normales y casos límite.

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

El diseño implementado asegura la integridad referencial y elimina la redundancia mediante normalización. El dominio de **UNIQUE** permite explotar los datos relacionales de manera eficiente para generar valor analítico en el contexto de **carreras urbanas**.
