# Ejercicio 045 - relaciones simples para biblioteca gamer

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
* Se implementó una relación de uno a muchos (1:N) entre las tablas plataformas y videojuegos mediante una clave foránea.
* Se empleó el tipo DECIMAL para asegurar la precisión numérica en los precios y calificaciones de los juegos.
* Se aplicó la restricción ENUM para controlar de forma estricta los estados válidos del inventario.
* Se incluyeron registros suficientes en ambas tablas para garantizar pruebas funcionales con operadores JOIN, funciones de agregación y filtros.

## Salida y resultados esperados

* El reporte de promedio por plataforma calcula la calificación media agrupando los datos mediante la relación de tablas.
* El top 3 muestra los títulos más destacados disponibles en el catálogo gamer.
* Las consultas relacionales filtran de manera exacta los videojuegos por plataforma y condiciones de negocio específicas.

---

# Evidencias

En este archivo se registran las validaciones realizadas:
* **Ejecución del DDL:** Verificar que las tablas plataformas y videojuegos se crearon correctamente con sus llaves primarias y foráneas.
* **Inserción de datos:** Validar la correcta inserción de registros maestros en plataformas y transaccionales en videojuegos.
* **Ejecución de las consultas:** Validar que los scripts DQL con operaciones JOIN devuelvan los reportes esperados sin errores de sintaxis.
* **Resultados importantes:** Comprobar el funcionamiento correcto de los filtros relacionales, agrupaciones y límites sobre el modelo de datos.