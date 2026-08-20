# Ejercicio 047 - tipos de datos para tienda de ropa

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
* Se empleó el tipo DECIMAL para garantizar precisión en los precios de las prendas de ropa.
* Se utilizaron tipos ENUM para restringir las categorías, tallas y estados del inventario a valores controlados.
* Se aplicaron restricciones CHECK para asegurar que los precios sean estrictamente positivos y el stock no sea negativo.
* Se incluyeron 8 registros completos para validar operaciones de filtrado, agregación con SUM/COUNT y rangos numéricos.

## Salida y resultados esperados

* El reporte de promedio de precios calcula los costos por categoría excluyendo los artículos agotados.
* El top 3 muestra las prendas más costosas del inventario ordenadas descendentemente.
* Las consultas específicas devuelven datos exactos basados en filtros por categoría, estados promocionales y niveles de stock.

---

# Evidencias

En este archivo se registran las validaciones realizadas:
* **Ejecución del DDL:** Verificar que la tabla productos_ropa se creó correctamente con los tipos de datos y restricciones especificadas.
* **Inserción de datos:** Validar que los 8 registros se insertaron correctamente cumpliendo con las validaciones de stock y precios.
* **Ejecución de las consultas:** Validar que cada archivo de consulta devuelva los reportes y conteos esperados sin errores de sintaxis.
* **Resultados importantes:** Comprobar el funcionamiento correcto de las funciones de agregación (AVG, SUM, COUNT) y filtros avanzados sobre el catálogo de ropa.