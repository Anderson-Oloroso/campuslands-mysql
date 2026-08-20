# Ejercicio 044 - fechas basicas para saga de ciencia ficcion

## Estructura del proyecto

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

1. Ejecutar ddl/schema.sql.
2. Ejecutar dml/inserts.sql.
3. Ejecutar dql/consultas.sql.

## Decisiones técnicas

* Se utilizó la base de datos campuslands_mysql.
* Se empleó el tipo DATE para el manejo y filtrado cronologico de las fechas de lanzamiento.
* Se utilizo el tipo ENUM para controlar los estados validos de los libros en la saga.
* Se aplicaron restricciones CHECK para asegurar la validez del numero de libro y el rango de la calificacion.
* Se incluyeron 8 registros para permitir pruebas efectivas con operadores de fecha, ordenamientos y agregaciones.

## Salida y resultados esperados

* El promedio de calificacion refleja el comportamiento de los libros ya publicados.
* El top 3 muestra las entregas mejor valoradas de la saga de ciencia ficcion.
* Las consultas por rango de fechas permiten filtrar de manera precisa los lanzamientos historicos y recientes.

---

# Evidencias

En este archivo se registran las validaciones realizadas:
* **Ejecucion del DDL:** Verificar que la tabla saga_ciencia_ficcion se creo correctamente con las restricciones de fecha y calificacion.
* **Insercion de datos:** Validar la correcta insercion de los 8 registros historicos y programados en formato DATE.
* **Ejecucion de las consultas:** Validar que los scripts DQL filtren correctamente por condiciones temporales y devuelvan los reportes esperados.
* **Resultados importantes:** Comprobar el funcionamiento de las funciones de agregacion y ordenamiento sobre campos de tipo fecha.