# Ejercicio 024 - FOREIGN KEY para soldadura

## Descripción

En este ejercicio de nivel intermedio se diseña e implementa un modelo relacional en MySQL para la temática de **soldadura**, aplicando conceptos avanzados de integridad referencial, normalización de datos y consultas multi-tabla enfocadas en **FOREIGN KEY**.

---

## Objetivos de Aprendizaje

- Diseñar esquemas relacionales normalizados con claves primarias y foráneas (`FOREIGN KEY`).
- Implementar restricciones de integridad y comportamiento en cascada (`ON DELETE CASCADE`).
- Dominar el uso de **FOREIGN KEY** en escenarios de negocio reales.
- Construir consultas complejas utilizando `INNER JOIN`, `LEFT JOIN`, `GROUP BY`, `HAVING` y subconsultas.
- Documentar las entidades y su relación de cardinalidad (1:N).

---

## Estructura de las Tablas

### Tabla Principal: `talleres_metalmecanicos`
Almacena plantas y talleres industriales de estructuras metalicas.

| Campo | Tipo de dato | Descripción |
| --- | --- | --- |
| `id_taller` | `INT AUTO_INCREMENT PRIMARY KEY` | Identificador del taller metalurgico |
| `nombre_taller` | `VARCHAR(70) NOT NULL UNIQUE` | Razon social |
| `ciudad` | `VARCHAR(50) NOT NULL` | Ciudad de la planta |
| `norma_calidad` | `ENUM('AWS D1.1','ASME Seccion IX','ISO 3834','API 1104') NOT NULL` | Norma de certificacion |

### Tabla Secundaria: `proyectos_soldadura`
Registra proyectos de union de metales, metodos de soldadura y pruebas de calidad.

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
Crea la base de datos `campuslands_mysql`, elimina en orden correcto las tablas existentes para evitar conflictos de integridad referencial y crea las tablas `talleres_metalmecanicos` y `proyectos_soldadura` con sus restricciones de clave foránea.

### 2. DML (`dml/inserts.sql`)
Inserta registros consistentes en `talleres_metalmecanicos` y posteriormente en `proyectos_soldadura`, garantizando que las claves foráneas correspondan a registros existentes y permitiendo evaluar casos normales y casos límite.

### 3. DQL (`dql/consultas.sql`)
Presenta un conjunto de consultas analíticas aplicando **FOREIGN KEY**, uniones relacionales (`JOIN`), filtros agrupados (`HAVING`), subconsultas y reportes ordenados.

---

## Conceptos Practicados

- Integridad Referencial (`FOREIGN KEY`, `REFERENCES`)
- Normalización relacional (1FN, 2FN, 3FN)
- `FOREIGN KEY`
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

El diseño implementado asegura la integridad referencial y elimina la redundancia mediante normalización. El dominio de **FOREIGN KEY** permite explotar los datos relacionales de manera eficiente para generar valor analítico en el contexto de **soldadura**.
