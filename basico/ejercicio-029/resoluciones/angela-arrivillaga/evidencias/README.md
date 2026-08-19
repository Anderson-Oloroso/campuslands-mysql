# Ejercicio 029 - Fechas básicas para marketplace de accesorios

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

* Se utilizó la base de datos `marketplace_accesorios_db`.
* Se implementaron restricciones de validación a nivel de esquema (`CHECK`) para asegurar que el precio en USD del accesorio sea estrictamente mayor a cero.
* Se estructuró la entidad `accesorios_marketplace` incluyendo atributos clave como `fecha_lanzamiento` de tipo `DATE` para practicar funciones temporales de MySQL (`YEAR`, `MONTH`, `DATEDIFF`, `CURDATE`, `BETWEEN`).
* Se diseñaron 5 consultas DQL orientadas a la gestión comercial y análisis temporal, evaluando antigüedad de inventario, lanzamientos por periodos específicos y reportes financieros consolidados por categoría.

## Salida y resultados esperados

* Filtrado por año de lanzamiento: Extracción de productos nuevos introducidos al marketplace en el año en curso.
* Filtrado por mes específico: Identificación de catálogos lanzados en periodos particulares mediante funciones de extracción mensual.
* Cálculo de antigüedad operativa: Determinación exacta de los días transcurridos desde el lanzamiento de cada accesorio hasta la fecha actual (`CURDATE`).
* Filtrado por rangos temporales (`BETWEEN`): Segmentación de inventario estrenado en trimestres o temporadas específicas.
* Reporte analítico por categoría: Resumen estadístico con conteos, precios promedio formateados e identificación del último lanzamiento por tipo de accesorio.

## Evidencias

Para demostrar la correcta ejecución:

* **DDL:** Captura de consola ejecutando comandos descriptivos de esquema para validar la correcta configuración de claves primarias y restricciones `CHECK`.
* **DML:** Comprobación mediante `SELECT COUNT(*) FROM accesorios_marketplace;` confirmando la inserción exacta de los 8 registros de prueba.
* **DQL:** Salida en consola de las 5 consultas analíticas demostrando el dominio de manipulación y filtrado de fechas en MySQL.