# Ejercicio 033 - funciones SQL para inventario de skins shooter

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

1. Ejecutar ddl/schema.sql (incluye creación de tablas y definición de la función almacenada `fn_calcular_precio_con_descuento`).
2. Ejecutar dml/inserts.sql (carga registros realistas de skins de armas estilo shooter).
3. Ejecutar dql/consultas.sql.

## Decisiones técnicas

* Se utilizó la base de datos campuslands_mysql.
* Se programó una función SQL escalar (`fn_calcular_precio_con_descuento`) para encapsular la lógica de negocio del cálculo de descuentos porcentuales sobre los precios base de los artículos.
* Se empleó el tipo `DECIMAL` para garantizar una precisión exacta en el manejo monetario de las transacciones y costos de las skins.
* Se utilizaron tipos `ENUM` para mantener un control estricto sobre los niveles de rareza de las armas y los estados comerciales del inventario.
* Se establecieron restricciones `CHECK` para validar que los precios base no sean negativos y que los descuentos se mantengan dentro del rango de 0% a 100%.

## Salida y resultados esperados

* La función SQL permite proyectar de manera dinámica el valor comercial real aplicando descuentos en consultas analíticas y reportes.
* El reporte por rareza agrupa estadísticas de costos y porcentajes de rebaja.
* El top 3 muestra las skins más exclusivas y costosas del catálogo.

---

# Evidencias

En este archivo se registran las validaciones realizadas:
* **Ejecución del DDL:** Verificar la creación correcta de la tabla skins_shooter y la compilación exitosa de la función `fn_calcular_precio_con_descuento`.
* **Inserción de datos:** Validar que los 8 registros de skins se insertaron de manera correcta respetando las restricciones numéricas y de enumeración.
* **Ejecución de las consultas:** Comprobar que los scripts DQL integran de forma óptima la función SQL personalizada en las proyecciones y filtros.
* **Resultados importantes:** Validar la precisión matemática en el cálculo dinámico de precios finales, promedios por rareza y sumatorias totales del inventario.