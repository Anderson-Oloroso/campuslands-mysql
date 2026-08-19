# Gamer Library Optimization - Base de Datos en MySQL

## Alumno

**Lester Garcia**

## Descripción

En este ejercicio se desarrolló una base de datos relacional en MySQL inspirada en una biblioteca gamer. El objetivo fue almacenar información sobre videojuegos, usuarios y préstamos, aplicando técnicas básicas de **optimización de consultas** mediante índices y análisis de planes de ejecución.

La optimización permite mejorar el acceso a los datos cuando una base de datos comienza a manejar un mayor volumen de registros. Para analizar el comportamiento de las consultas se utilizó la instrucción `EXPLAIN`, permitiendo observar cómo MySQL planea ejecutar cada consulta.

## Solución General

La solución consiste en la creación de una base de datos llamada **gamer_library_optimization**, conformada por tres tablas: **games**, **users** y **loans**.

La tabla `games` almacena la información de los videojuegos disponibles en la biblioteca. La tabla `users` contiene los usuarios registrados y la tabla `loans` registra los préstamos realizados.

Para mejorar el acceso a los datos se crearon índices sobre columnas utilizadas frecuentemente en búsquedas y relaciones:

- `genre`
- `platform`
- `game_id`
- `user_id`
- `loan_date`

Posteriormente se utilizaron consultas con `EXPLAIN` para analizar el plan de ejecución y comprobar la utilización de los índices.

## Decisiones técnicas

- Se utilizaron claves primarias para identificar cada registro.
- Se utilizaron claves foráneas para mantener la integridad referencial entre préstamos, usuarios y videojuegos.
- Se utilizaron restricciones `UNIQUE` para evitar usuarios y correos electrónicos duplicados.
- Se crearon índices sobre columnas utilizadas frecuentemente en filtros y relaciones.
- Se utilizó `EXPLAIN` para analizar cómo MySQL ejecuta las consultas.
- Se utilizó `SHOW INDEX` para verificar los índices existentes en las tablas.
- Los índices fueron aplicados sobre columnas que representan posibles criterios de búsqueda frecuentes.
- La optimización debe evaluarse mediante el plan de ejecución y no únicamente por la existencia de índices.

## Evidencia

La solución está organizada en tres archivos SQL independientes para facilitar su mantenimiento y revisión:

- **01_ddl.sql** → Creación de la base de datos, tablas e índices.
- **02_dml.sql** → Inserción de los datos de prueba.
- **03_dql.sql** → Consultas de análisis utilizando `EXPLAIN`, verificación de índices y consultas de prueba.

**Estructura del proyecto:**

```text
lester-garcia/plantilla
│
├── 01_ddl.sql
├── 02_dml.sql
├── 03_dql.sql
└── README.md
```

## Resultado esperado

- Base de datos creada correctamente.
- Relaciones entre tablas funcionando mediante claves foráneas.
- Datos insertados sin errores.
- Índices creados correctamente.
- Índices verificados mediante `SHOW INDEX`.
- Planes de ejecución analizados mediante `EXPLAIN`.
- Consultas ejecutadas correctamente mostrando información coherente sobre videojuegos y préstamos.
- La estructura queda preparada para evaluar mejoras de rendimiento a medida que aumente el volumen de información.