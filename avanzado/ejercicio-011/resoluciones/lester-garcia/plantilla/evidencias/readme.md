# Ping Pong CTE - Base de Datos en MySQL

## Alumno
**Lester Garcia**

## Descripción

En este ejercicio se desarrolló una base de datos relacional en MySQL inspirada en competencias de ping pong. El objetivo fue almacenar información sobre jugadores, torneos y partidos, y posteriormente utilizar **Common Table Expressions (CTE)** para organizar consultas que requieren cálculos y análisis sobre los datos registrados.

La solución está diseñada para trabajar con **MySQL 8.0 o superior**, debido al uso de la cláusula `WITH`, necesaria para implementar CTE.

## Solución General

La solución consiste en la creación de una base de datos llamada **pingpong_cte**, conformada por tres tablas relacionadas mediante claves primarias y foráneas: **players**, **tournaments** y **matches**.

La tabla `players` almacena la información de los participantes, mientras que `tournaments` contiene los datos de los torneos. La tabla `matches` registra los enfrentamientos entre dos jugadores y los puntos obtenidos por cada uno.

Para practicar CTE se utilizaron expresiones `WITH` que permiten construir resultados temporales antes de ejecutar la consulta principal. Esto facilita la organización de consultas más complejas y mejora su legibilidad.

Entre los análisis realizados se encuentran:

- Cálculo de puntos acumulados por jugador.
- Cálculo de victorias por jugador.
- Promedio de puntos por partido.
- Identificación de partidos con mayor puntuación.
- Obtención de estadísticas generales de los jugadores.

## Decisiones técnicas

- Se utilizaron claves primarias para identificar de forma única cada registro.
- Se utilizaron claves foráneas para relacionar jugadores, torneos y partidos.
- Se utilizaron CTE mediante `WITH` para separar cálculos intermedios de las consultas principales.
- Se utilizó `UNION ALL` para combinar estadísticas provenientes de las dos posiciones posibles de un jugador dentro de un partido.
- Se utilizaron funciones de agregación como `SUM`, `COUNT` y `AVG` para obtener indicadores.
- Se utilizó `ORDER BY` para presentar los resultados de forma descendente según el rendimiento.
- La solución requiere **MySQL 8.0 o superior**.

## Evidencia

La solución está organizada en tres archivos SQL independientes para facilitar su mantenimiento y revisión:

- **01_ddl.sql** → Creación de la base de datos y las tablas.
- **02_dml.sql** → Inserción de los datos de prueba.
- **03_dql.sql** → Consultas utilizando CTE para analizar la información.

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
- Datos de jugadores, torneos y partidos insertados correctamente.
- Consultas CTE ejecutadas sin errores.
- Resultados mostrando estadísticas coherentes sobre puntos, victorias y rendimiento de los jugadores.