# Ejercicio 048 - PRIMARY KEY para viajes y turismo

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
* Se estableció una clave primaria autoincremental (`PRIMARY KEY`) en la columna `id` para asegurar la unicidad de cada registro turístico.
* Se utilizó el tipo DECIMAL para garantizar precisión exacta en el manejo de precios y calificaciones.
* Se empleó el tipo ENUM para controlar de forma estricta los estados del inventario turístico.
* Se aplicaron restricciones CHECK para validar que los precios, las duraciones en días y las calificaciones mantengan rangos lógicos y positivos.
* Se incluyeron 8 registros variados para permitir pruebas con funciones de agregación, agrupaciones y límites de registros.

## Salida y resultados esperados

* El reporte de promedio de precios agrupa los costos por país excluyendo los paquetes agotados.
* El top 3 muestra las experiencias de viaje mejor valoradas del catálogo.
* Las consultas específicas devuelven reportes filtrados por rangos de precios, destinos geográficos y estados operativos.

---

# Evidencias

En este archivo se registran las validaciones realizadas:
* **Ejecución del DDL:** Verificar que la tabla paquetes_turisticos se creó correctamente con su clave primaria y restricciones.
* **Inserción de datos:** Validar que los 8 registros se insertaron correctamente cumpliendo con las reglas de negocio.
* **Ejecución des las consultas:** Validar que cada archivo de consulta devuelva los resultados esperados sin errores de sintaxis.
* **Resultados importantes:** Comprobar el funcionamiento correcto de las funciones de agregación, filtros numéricos y ordenamientos sobre el modelo de turismo.