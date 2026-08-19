# Ejercicio 019 - HAVING para paracaidismo

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

* Se utilizó la base de datos `paracaidismo_db`.
* Se implementó el uso avanzado de la cláusula **HAVING** combinada con `GROUP BY` y funciones agregadas (`COUNT`, `AVG`, `SUM`, `MAX`) para filtrar y aislar grupos estadísticos según umbrales de negocio específicos.
* Se aplicaron restricciones de validación estrictas (`CHECK`) en el esquema DDL para garantizar que la altura de salto sea de al menos 3,000 pies, la duración de caída libre sea positiva y el costo del servicio supere los cero dólares.
* Se estructuraron 8 registros de saltos profesionales abarcando diversas zonas de paracaidismo (Skydive Coast, Skyline Extreme DZ, Andes Centrales y Pacific Blue) y modalidades técnicas (Tandem, Freefly, Wingsuit y Formation) para validar con precisión los filtros agregados.

## Salida y resultados esperados

* Filtrado por altura media (`HAVING`): Reporte por zona que selecciona exclusivamente los centros de paracaidismo con un promedio de salida superior a 14,000 pies.
* Filtrado por duración de caída libre (`HAVING`): Listado de modalidades técnicas donde la media de caída libre excede los 55 segundos.
* Filtrado por volumen financiero acumulado (`HAVING`): Resumen de zonas que superan los $500 USD en costos acumulados registrados.
* Filtrado por frecuencia de estado (`HAVING`): Conteo agrupado por estado operativo que muestra únicamente condiciones con 2 o más registros.
* Análisis cruzado avanzado (`HAVING`): Cruce de zona y modalidad filtrando grupos con un costo promedio superior a los $250 USD.

## Evidencias

Para demostrar la correcta ejecución:

* **DDL:** Captura de consola ejecutando comandos descriptivos de esquema para validar la correcta configuración de claves primarias y restricciones `CHECK`.
* **DML:** Comprobación mediante `SELECT COUNT(*) FROM saltos_paracaidismo;` confirmando la inserción exacta de los 8 registros de prueba.
* **DQL:** Salida en consola de las 5 consultas de reporte solicitadas demostrando el dominio técnico de la cláusula `HAVING` sobre agregaciones complejas.