# Biblioteca Gamer - Base de Datos en MySQL

## Alumno

**Lester Garcia**

## Descripción

En este ejercicio se desarrolló una base de datos relacional en MySQL para administrar una biblioteca especializada en videojuegos. El sistema permite registrar usuarios, géneros, videojuegos y préstamos, estableciendo relaciones entre las diferentes entidades para mantener la información organizada y evitar duplicidad de datos. El ejercicio está orientado a practicar relaciones simples mediante claves primarias y claves foráneas.

## Solución General

La solución consiste en crear la base de datos **biblioteca_gamer**, utilizando las tablas **usuarios**, **generos**, **videojuegos** y **prestamos**. Cada tabla representa una entidad específica del sistema y utiliza una clave primaria para identificar de forma única sus registros. La tabla `videojuegos` se relaciona con `generos`, mientras que la tabla `prestamos` conecta a los usuarios con los videojuegos mediante claves foráneas. Posteriormente se insertaron diez registros de usuarios, géneros, videojuegos y préstamos, y finalmente se realizaron consultas `SELECT` utilizando `INNER JOIN`, filtros, ordenamientos y funciones de agregación para comprobar que las relaciones funcionan correctamente.

## Evidencia

La solución se encuentra organizada en archivos independientes según la responsabilidad de cada componente SQL:

- **01_ddl.sql** → Creación de la base de datos, tablas y relaciones.
- **02_dml.sql** → Inserción de datos de prueba.
- **03_dql.sql** → Consultas para comprobar las relaciones.
- **README.md** → Documentación del ejercicio.

### Relaciones utilizadas

| Relación | Tipo |
|---|---|
| Géneros → Videojuegos | 1:N |
| Usuarios → Préstamos | 1:N |
| Videojuegos → Préstamos | 1:N |

### Claves foráneas

La tabla `videojuegos` contiene:

```sql
FOREIGN KEY (id_genero) REFERENCES generos(id_genero)
```

La tabla `prestamos` contiene:

```sql
FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
```

y:

```sql
FOREIGN KEY (id_videojuego) REFERENCES videojuegos(id_videojuego)
```

Estas relaciones permiten mantener la integridad referencial de la información.

### Estructura del proyecto

```text
lester-garcia/plantilla
│
├── 01_ddl.sql
├── 02_dml.sql
├── 03_dql.sql
└── README.md
```

### Resultado esperado

- Base de datos creada correctamente.
- Tablas creadas con sus respectivas claves primarias.
- Relaciones establecidas mediante claves foráneas.
- Datos insertados sin errores.
- Consultas con `JOIN` ejecutadas correctamente.
- Información de usuarios, videojuegos, géneros y préstamos relacionada de forma coherente.
- Código organizado para facilitar su revisión y mantenimiento.