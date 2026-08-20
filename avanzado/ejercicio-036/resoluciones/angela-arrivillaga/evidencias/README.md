# Ejercicio 036 - EXPLAIN para autos hiperdeportivos

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

* Optimización mediante índices (`idx_velocidad`, `idx_estado`).
* Análisis del plan de ejecución utilizando `EXPLAIN` para validar el uso de índices y tipo de escaneo.
* Relación entre fabricantes y vehículos para consultas complejas.

## Salida y resultados esperados

* Uso de `type: range` o `ref` en el `EXPLAIN` confirmando eficiencia.
* Reportes ordenados de rendimiento y costo.

---

# Evidencias

* Se validó que las consultas de filtrado utilizan los índices definidos en la estructura `DDL`.