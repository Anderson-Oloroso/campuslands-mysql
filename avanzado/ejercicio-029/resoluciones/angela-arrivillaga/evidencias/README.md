# ejercicio 029 - event scheduler para marketplace de accesorios

## estructura del proyecto

angela-arrivillaga/
├── ddl/
│   └── schema.sql
├── dml/
│   └── inserts.sql
├── dql/
│   └── consultas.sql
└── evidencias/
    └── README.md

## ejecucion

1. ejecutar el script `ddl/schema.sql` para crear la base de datos relacional del marketplace de accesorios, tablas normalizadas, llaves foraneas y restricciones de stock y precios.
2. ejecutar el script `dml/inserts.sql` para poblar el sistema con registros realistas de categorias, accesorios, estados de publicacion e historial inicial de auditoria.
3. ejecutar el script `dql/consultas.sql` para configurar el planificador de eventos (`event scheduler`) en mysql, automatizar la revision de stock en cero y ejecutar consultas analiticas de inventario, stock critico, ranking de precios y auditoria.

## decisiones tecnicas

* se diseño el esquema relacional `marketplace_accesorios_db` enfocado en el comercio electronico de accesorios, control de inventario y trazabilidad automatica.
* **estrategia con event scheduler:**
  - se programo un evento diario (`ev_actualizar_accesorios_agotados`) encargado de sincronizar automaticamente el estado de los productos a `agotado` cuando su stock llega a cero, registrando simultaneamente una traza en la tabla de auditoría.
* se estructuraron 5 consultas analiticas para medir la valoracion de inventario por categoria, control preventivo de stock critico, ranking de precios por categoria, reporte de eventos automatizados y distribucion porcentual del catalogo.
* cumplimiento estricto de la regla de comentarios (cero mayusculas y cero tildes en todo el codigo sql).

## salida y resultados esperados

* base de datos completamente funcional y relacional dotada de automatizacion mediante el planificador de eventos de mysql.
* insercion exitosa de datos con restricciones de integridad y validaciones de stock.
* consultas dql avanzadas y ejecutables para la supervision operativa y comercial del marketplace.