# Ejercicio 042 - modelado de entidad para playlist musical

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
* Se empleó el tipo ENUM para genero y estado para restringir valores válidos.
* Se aplicó un CHECK constraint para asegurar que la duracion sea positiva y el puntaje este entre 0 y 10.
* Se incluyeron 8 registros para cubrir casos de filtrado por estado y genero.
* Las consultas utilizan alias para mejorar la legibilidad de los reportes.

## Salida y resultados esperados

* El promedio de puntaje agrupa por genero filtrando solo activos.
* El top 3 de canciones muestra las pistas mas largas del catalogo.
* Las consultas especificas retornan el conjunto exacto de datos solicitado segun los filtros aplicados.

---

# Evidencias

En este archivo se registran las validaciones realizadas:
* **Ejecucion del DDL:** Verificar que la tabla canciones se creo correctamente con sus restricciones.
* **Insercion de datos:** Validar que los 8 registros se insertaron correctamente usando un select count.
* **Ejecucion de las consultas:** Validar que cada archivo de consulta devuelva los resultados esperados sin errores de sintaxis.
* **Resultados importantes:** Comprobar que los filtros por estado y las funciones de agregacion funcionen sobre el dataset.