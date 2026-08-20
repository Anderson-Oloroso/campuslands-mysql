# Ejercicio 036 - normalizacion 1FN para autos hiperdeportivos

## Descripción

En este ejercicio de nivel intermedio se diseña e implementa un modelo relacional en MySQL para la temática de **autos hiperdeportivos**, aplicando conceptos avanzados de integridad referencial, normalización de datos y consultas multi-tabla enfocadas en **normalizacion 1FN**.

---

## Objetivos de Aprendizaje

- Diseñar esquemas relacionales normalizados con claves primarias y foráneas (`FOREIGN KEY`).
- Implementar restricciones de integridad y comportamiento en cascada (`ON DELETE CASCADE`).
- Dominar el uso de **normalizacion 1FN** en escenarios de negocio reales.
- Construir consultas complejas utilizando `INNER JOIN`, `LEFT JOIN`, `GROUP BY`, `HAVING` y subconsultas.
- Documentar las entidades y su relación de cardinalidad (1:N).

---

## Estructura de las Tablas

### Tabla Principal: `fabricantes_autos`
Almacena marcas y fabricantes de vehiculos de ultra alto rendimiento.

| Campo | Tipo de dato | Descripción |
| --- | --- | --- |
| `id_fabricante` | `INT AUTO_INCREMENT PRIMARY KEY` | Identificador de la marca constructora |
| `marca` | `VARCHAR(50) NOT NULL UNIQUE` | Nombre del fabricante |
| `pais_origen` | `VARCHAR(40) NOT NULL` | Pais de la sede principal |
| `fundacion` | `INT NOT NULL` | Ano de creacion de la marca |
| `estado` | `ENUM('Activo','Inactivo') DEFAULT 'Activo'` | Estado operativo |

### Tabla Secundaria: `autos_hiperdeportivos`
Almacena especificaciones, potencia, velocidad y precios de autos hiperdeportivos.

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
Crea la base de datos `campuslands_mysql`, elimina en orden correcto las tablas existentes para evitar conflictos de integridad referencial y crea las tablas `fabricantes_autos` y `autos_hiperdeportivos` con sus restricciones de clave foránea.

### 2. DML (`dml/inserts.sql`)
Inserta registros consistentes en `fabricantes_autos` y posteriormente en `autos_hiperdeportivos`, garantizando que las claves foráneas correspondan a registros existentes y permitiendo evaluar casos normales y casos límite.

### 3. DQL (`dql/consultas.sql`)
Presenta un conjunto de consultas analíticas aplicando **normalizacion 1FN**, uniones relacionales (`JOIN`), filtros agrupados (`HAVING`), subconsultas y reportes ordenados.

---

## Conceptos Practicados

- Integridad Referencial (`FOREIGN KEY`, `REFERENCES`)
- Normalización relacional (1FN, 2FN, 3FN)
- `normalizacion 1FN`
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

El diseño implementado asegura la integridad referencial y elimina la redundancia mediante normalización. El dominio de **normalizacion 1FN** permite explotar los datos relacionales de manera eficiente para generar valor analítico en el contexto de **autos hiperdeportivos**.
