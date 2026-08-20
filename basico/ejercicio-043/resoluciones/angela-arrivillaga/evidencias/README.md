# Ejercicio 043 - filtros por estado para catalogo de peliculas de miedo

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
* Se empleó el tipo ENUM para subgenero y estado para restringir valores válidos.
* Se aplicó un CHECK constraint para asegurar que el anio de estreno sea mayor o igual a 1900 y la calificacion este entre 0 y 10.
* Se incluyeron 8 registros para cubrir casos de filtrado por estado y subgenero.
* Las consultas utilizan alias para mejorar la legibilidad de los reportes.

## Salida y resultados esperados

* El promedio de calificacion agrupa por subgenero filtrando solo peliculas disponibles.
* El top 3 de peliculas muestra los titulos con mayor puntaje del catalogo.
* Las consultas especificas retornan el conjunto exacto de datos solicitado segun los filtros de estado, anio y subgenero aplicados.

---

# Evidencias

En este archivo se registran las validaciones realizadas:
* **Ejecucion del DDL:** Verificar que la tabla peliculas_miedo se creo correctamente con sus restricciones.
* **Insercion de datos:** Validar que los 8 registros se insertaron correctamente usando un select count.
* **Ejecucion de las consultas:** Validar que cada archivo de consulta devuelva los resultados esperados sin errores de sintaxis.
* **Resultados importantes:** Comprobar que los filtros por estado y las funciones de agregacion funcionen sobre el dataset de peliculas de miedo.