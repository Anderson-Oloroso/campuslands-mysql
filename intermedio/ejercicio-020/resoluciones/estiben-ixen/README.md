# Ejercicio 020 - subconsultas para estudio de tatuajes

## Descripción

En este ejercicio de nivel intermedio se diseña e implementa un modelo relacional en MySQL para la temática de **estudio de tatuajes**, aplicando conceptos avanzados de integridad referencial, normalización de datos y consultas multi-tabla enfocadas en **subconsultas**.

---

## Objetivos de Aprendizaje

- Diseñar esquemas relacionales normalizados con claves primarias y foráneas (`FOREIGN KEY`).
- Implementar restricciones de integridad y comportamiento en cascada (`ON DELETE CASCADE`).
- Dominar el uso de **subconsultas** en escenarios de negocio reales.
- Construir consultas complejas utilizando `INNER JOIN`, `LEFT JOIN`, `GROUP BY`, `HAVING` y subconsultas.
- Documentar las entidades y su relación de cardinalidad (1:N).

---

## Estructura de las Tablas

### Tabla Principal: `artistas_tatuadores`
Almacena tatuadores profesionales con sus estilos insignia.

| Campo | Tipo de dato | Descripción |
| --- | --- | --- |
| `id_artista` | `INT AUTO_INCREMENT PRIMARY KEY` | Identificador del tatuador |
| `nombre` | `VARCHAR(70) NOT NULL` | Nombre del artista |
| `apodo` | `VARCHAR(40) NOT NULL UNIQUE` | Nombre artistico |
| `estilo_principal` | `ENUM('Realismo Black & Grey','Neotradicional','Japones Tradicional (Irezumi)','Microrealismo','Lettering','Blackwork') NOT NULL` | Especialidad |
| `tarifa_por_hora` | `DECIMAL(6,2) NOT NULL DEFAULT 80.00` | Precio horario USD |

### Tabla Secundaria: `citas_tatuajes`
Registra citas de tatuajes, tamano, horas de sesion y precios.

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
Crea la base de datos `campuslands_mysql`, elimina en orden correcto las tablas existentes para evitar conflictos de integridad referencial y crea las tablas `artistas_tatuadores` y `citas_tatuajes` con sus restricciones de clave foránea.

### 2. DML (`dml/inserts.sql`)
Inserta registros consistentes en `artistas_tatuadores` y posteriormente en `citas_tatuajes`, garantizando que las claves foráneas correspondan a registros existentes y permitiendo evaluar casos normales y casos límite.

### 3. DQL (`dql/consultas.sql`)
Presenta un conjunto de consultas analíticas aplicando **subconsultas**, uniones relacionales (`JOIN`), filtros agrupados (`HAVING`), subconsultas y reportes ordenados.

---

## Conceptos Practicados

- Integridad Referencial (`FOREIGN KEY`, `REFERENCES`)
- Normalización relacional (1FN, 2FN, 3FN)
- `subconsultas`
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

El diseño implementado asegura la integridad referencial y elimina la redundancia mediante normalización. El dominio de **subconsultas** permite explotar los datos relacionales de manera eficiente para generar valor analítico en el contexto de **estudio de tatuajes**.
