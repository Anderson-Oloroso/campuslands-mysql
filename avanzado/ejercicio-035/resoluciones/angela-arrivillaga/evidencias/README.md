# Ejercicio 035 - indices para taller mecanico de motos

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

* Optimización de rendimiento mediante índices en columnas de filtrado frecuente (`fecha_servicio`, `estado`, `tipo_servicio`).
* Uso de índices compuestos y simples estratégicos para acelerar las consultas de negocio.
* Estructura relacional clara entre clientes y sus servicios realizados.
* Tipos de datos adecuados para el contexto financiero (`DECIMAL`) y operativo (`ENUM`).

## Salida y resultados esperados

* Reportes de ingresos por tipo de servicio.
* Listados eficientes de servicios pendientes.
* Ranking de clientes y servicios por costo para toma de decisiones.

---

# Evidencias

* Se verificó la creación de índices mediante `SHOW INDEX FROM servicios_taller`.
* Las consultas operan sobre los índices definidos, optimizando el tiempo de respuesta en comparación con búsquedas secuenciales.