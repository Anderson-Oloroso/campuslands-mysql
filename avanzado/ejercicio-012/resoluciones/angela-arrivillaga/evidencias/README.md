# ejercicio 012 - window functions para playlist musical

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

1. ejecutar ddl/schema.sql.
2. ejecutar dml/inserts.sql.
3. ejecutar dql/consultas.sql.

## decisiones tecnicas

* se utilizo la base de datos relacional `playlist_musical_db`.
* especialización absoluta en el uso de funciones de ventana (`Window Functions`) como `ROW_NUMBER()`, `RANK()`, `DENSE_RANK()`, acumulados con `SUM()` y promedios particionados con `AVG() OVER (PARTITION BY ...)`.
* aplicación de tipos de datos estrictos, restricciones `CHECK` para garantizar duraciones positivas, reproducciones no negativas y calificaciones en escala de 0.00 a 5.00 con precisión `DECIMAL`.

## salida y resultados esperados

* ranking personalizado de canciones particionado por género musical usando `ROW_NUMBER()`.
* clasificación global de pistas musicales por calificación con `RANK()`.
* cálculo de reproducciones acumuladas en orden ascendente de duración mediante marcos de ventana.
* comparación analítica de la calificación de cada pista frente al promedio de su respectivo género.
* jerarquización densa de canciones activas con mayor volumen de reproducciones.

## evidencias

para demostrar la correcta ejecucion:

* ddl: diseño de esquema relacional con llaves primarias y foráneas protegidas.
* dml: inserción de múltiples registros realistas de géneros y pistas musicales.
* dql: consultas avanzadas basadas en funciones de ventana orientadas al análisis analítico detallado.