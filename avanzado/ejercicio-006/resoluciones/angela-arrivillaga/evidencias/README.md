# Ejercicio 006 - EXPLAIN para autos hiperdeportivos

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

* Se utilizó la base de datos campuslands_hiperdeportivos.
* Se crearon índices (idx_potencia) específicamente para optimizar las consultas que filtran por caballaje, permitiendo que EXPLAIN muestre el uso eficiente de los índices.
* Se utilizó DECIMAL(15, 2) para precios garantizando precisión financiera.
* El campo estado utiliza un ENUM para asegurar la integridad de los datos de inventario.

## Salida y resultados esperados

* EXPLAIN: Muestra el plan de ejecución detallando el uso del índice `idx_potencia` para optimizar el filtrado de registros.
* Ranking de autos por potencia: Lista ordenada de mayor a menor potencia (`SELECT modelo, potencia_cv, estado ORDER BY potencia_cv DESC`).
* Reporte de inventario por marca: Agrupa la cantidad de modelos y calcula el promedio de potencia por cada fabricante.
* Autos de alto valor: Filtra los modelos cuyo precio supera los 2,500,000.00 USD.
* Disponibilidad de stock: Agrupa y cuenta los vehículos según su estado actual (`disponible`, `reservado`, `vendido`).

## Evidencias

* **DDL**: Comprobación de la creación de la base de datos y la correcta estructura relacional con restricciones y tipos de datos adecuados.
* **DML**: Verificación mediante conteo de que se han insertado los 8 registros requeridos en las tablas correspondientes.
* **DQL**: Salida tabular de cada una de las 5 consultas requeridas.
* **EXPLAIN**: Validación técnica de la optimización y uso de índices en la consulta principal.