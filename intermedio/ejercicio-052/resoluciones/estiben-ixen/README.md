# Ejercicio 052 - normalizacion 2FN para animacion 3D

## Descripción

En este ejercicio de nivel intermedio se diseña e implementa un modelo relacional en MySQL para la temática de **animacion 3D**, aplicando conceptos avanzados de integridad referencial, normalización de datos y consultas multi-tabla enfocadas en **normalizacion 2FN**.

---

## Objetivos de Aprendizaje

- Diseñar esquemas relacionales normalizados con claves primarias y foráneas (`FOREIGN KEY`).
- Implementar restricciones de integridad y comportamiento en cascada (`ON DELETE CASCADE`).
- Dominar el uso de **normalizacion 2FN** en escenarios de negocio reales.
- Construir consultas complejas utilizando `INNER JOIN`, `LEFT JOIN`, `GROUP BY`, `HAVING` y subconsultas.
- Documentar las entidades y su relación de cardinalidad (1:N).

---

## Estructura de las Tablas

### Tabla Principal: `estudios_animacion`
Almacena estudios y productoras de animacion CGI y efectos visuales (VFX).

| Campo | Tipo de dato | Descripción |
| --- | --- | --- |
| `id_estudio` | `INT AUTO_INCREMENT PRIMARY KEY` | Identificador del estudio |
| `nombre_estudio` | `VARCHAR(60) NOT NULL UNIQUE` | Nombre comercial de la productora |
| `pais` | `VARCHAR(40) NOT NULL` | Pais de operaciones |
| `motor_render_principal` | `ENUM('Cycles','Arnold','RenderMan','V-Ray','Unreal Engine 5') NOT NULL` | Motor principal |

### Tabla Secundaria: `personajes_3d`
Almacena personajes 3D modelados, rigs, poligonos y motores de render.

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
Crea la base de datos `campuslands_mysql`, elimina en orden correcto las tablas existentes para evitar conflictos de integridad referencial y crea las tablas `estudios_animacion` y `personajes_3d` con sus restricciones de clave foránea.

### 2. DML (`dml/inserts.sql`)
Inserta registros consistentes en `estudios_animacion` y posteriormente en `personajes_3d`, garantizando que las claves foráneas correspondan a registros existentes y permitiendo evaluar casos normales y casos límite.

### 3. DQL (`dql/consultas.sql`)
Presenta un conjunto de consultas analíticas aplicando **normalizacion 2FN**, uniones relacionales (`JOIN`), filtros agrupados (`HAVING`), subconsultas y reportes ordenados.

---

## Conceptos Practicados

- Integridad Referencial (`FOREIGN KEY`, `REFERENCES`)
- Normalización relacional (1FN, 2FN, 3FN)
- `normalizacion 2FN`
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

El diseño implementado asegura la integridad referencial y elimina la redundancia mediante normalización. El dominio de **normalizacion 2FN** permite explotar los datos relacionales de manera eficiente para generar valor analítico en el contexto de **animacion 3D**.
