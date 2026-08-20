# ejercicio 025 - backup logico para laboratorio de formulas quimicas

## estructura del proyecto

angela-arrivillaga/
├── ddl/
│   └── schema.sql
├── dml/
│   └── inserts.sql
├── dql/
│   └── consultas.sql
├── backup/
│   └── mysqldump_comandos.sql
└── evidencias/
    └── README.md

## ejecucion

1. ejecutar el script `ddl/schema.sql` para crear la base de datos relacional del laboratorio, tablas normalizadas, llaves foraneas y restricciones de stock y cantidades.
2. ejecutar el script `dml/inserts.sql` para poblar el sistema con registros realistas de investigadores, reactivos quimicos, formulas y sus composiciones detalladas.
3. ejecutar el script `dql/consultas.sql` para validar indicadores de negocio, reportes de estado, inventarios criticos y ranking de componentes.
4. consultar el archivo `backup/mysqldump_comandos.sql` para conocer las instrucciones estandar de generacion y restauracion de respaldos logicos con `mysqldump`.

## decisiones tecnicas

* se diseño el esquema relacional `laboratorio_formulas_db` enfocado en el control estricto de compuestos quimicos, niveles de peligrosidad y formulas experimentales.
* **estrategia de backup logico:**
  - se documentaron los comandos nativos de `mysqldump` para respaldos completos, por estructura (ddl) y por datos (dml), permitiendo garantizar la recuperacion ante desastres y la portabilidad del esquema.
* se estructuraron 5 consultas dql enfocadas en analisis estadistico por estado de formulas, auditoria de inventarios peligrosos, rendimiento de investigadores y ranking de consumo de gramos.
* cumplimiento estricto de la regla de comentarios (cero mayusculas y cero tildes en todo el codigo sql).

## salida y resultados esperados

* base de datos completamente funcional y relacional para la gestion del laboratorio.
* insercion exitosa de datos con restricciones de integridad y validaciones de stock.
* documentacion y comandos claros para la administracion de respaldos logicos en entornos de produccion mysql.