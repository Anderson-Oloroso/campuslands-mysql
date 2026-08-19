# Ejercicio 038 - Normalización 3FN para Fútbol Sala

## Estructura del Proyecto

angela-arrivillaga/
├── ddl/
│   └── schema.sql
├── dml/
│   └── inserts.sql
├── dql/
│   └── consultas.sql
└── evidencias/
    └── README.md

## Ejecución

1. Ejecutar el script `ddl/schema.sql` para crear la base de datos y sus tablas normalizadas.
2. Ejecutar el script `dml/inserts.sql` para poblar con datos realistas e íntegros.
3. Ejecutar el script `dql/consultas.sql` para validar los reportes analíticos e indicadores clave.

## Decisiones Técnicas

* Se diseñó la base de datos `futbol_sala_3fn_db` cumpliendo estrictamente con la **Tercera Forma Normal (3FN)**.
* **Eliminación de dependencias transitivas:** 
  - La tabla `ciudades` es totalmente independiente.
  - La tabla `sedes` depende directamente de `ciudades` (evitando almacenar el nombre de la ciudad o departamento de forma repetida por cada sede).
  - La tabla `equipos` referencia a `sedes`, y las tablas `jugadores` y `partidos` se relacionan mediante claves foráneas robustas.
* Se implementaron restricciones como `CHECK` para garantizar capacidades positivas, validación de que un equipo no juegue contra sí mismo y control estricto de goles y tarjetas.

## Salida y Resultados Esperados

* Estructura relacional limpia, sin redundancias y preparada para soportar consultas complejas de negocio.
* Inserción de 5 ciudades, 5 sedes, 6 equipos, múltiples jugadores con estadísticas de rendimiento y encuentros deportivos programados o finalizados.
* Consultas DQL avanzadas con múltiples uniones (`JOIN`), funciones de agregación (`COUNT`, `SUM`, `AVG`), ordenamientos y filtros lógicos orientados a la gestión de ligas deportivas.