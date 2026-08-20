# Ejercicio 046 - CREATE TABLE para restaurante de comida urbana

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
* Se empleó el tipo DECIMAL para asegurar la precisión numérica en los precios de los platos y las calificaciones.
* Se utilizó el tipo ENUM para restringir las categorías de comida urbana y el estado del inventario a valores válidos.
* Se aplicaron restricciones CHECK para garantizar que los precios sean positivos y las calificaciones estén dentro del rango de 0 a 10.
* Se incluyeron 8 registros detallados para cubrir escenarios de filtrado por categoría, estado y rangos de precios.

## Salida y resultados esperados

* El reporte de promedio de precios agrupa los costos por categoría filtrando únicamente los productos disponibles.
* El top 3 muestra las comidas urbanas mejor valoradas por los clientes del restaurante.
* Las consultas específicas devuelven conjuntos de datos filtrados de manera exacta según criterios de negocio.

---

# Evidencias

En este archivo se registran las validaciones realizadas:
* **Ejecución del DDL:** Verificar que la tabla productos_urbana se creó correctamente con sus restricciones y tipos de datos.
* **Inserción de datos:** Validar que los 8 registros se insertaron correctamente y cumplen con las reglas de validación.
* **Ejecución de las consultas:** Validar que cada archivo de consulta devuelva los resultados esperados sin errores de sintaxis.
* **Resultados importantes:** Comprobar que los filtros de precio, funciones de agregación y agrupaciones por categoría funcionen adecuadamente.