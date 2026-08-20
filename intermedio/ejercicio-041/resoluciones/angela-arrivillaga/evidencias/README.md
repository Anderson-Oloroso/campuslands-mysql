# ejercicio 041 - check para pingpong

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

1. ejecutar ddl/schema.sql (creacion de tablas relacionales con restricciones check avanzadas).
2. ejecutar dml/inserts.sql (carga de registros con datos realistas para torneos y jugadores).
3. ejecutar dql/consultas.sql (ejecucion de consultas analíticas de negocio).

## decisiones tecnicas

* uso de restricciones `CHECK` personalizadas (`chk_ranking_valido`, `chk_sets_ganados`, `chk_sets_perdidos` y `chk_premio_torneo`) para garantizar la integridad de los datos e impedir el ingreso de rangos lógicos inválidos o números negativos.
* modelado relacional riguroso 1:N entre torneos de ping pong y jugadores.
* empleo de tipos de datos `DECIMAL` para mantener precisión monetaria exacta en los premios monetarios de los torneos.
* uso de enumeraciones (`ENUM`) para controlar los estados administrativos de los atletas.

## salida y resultados esperados

* validación estricta de restricciones a nivel de base de datos durante inserciones y actualizaciones.
* reportes estadísticos consolidados de rendimiento de sets, rankings mundiales y distribución de premios.

---

# evidencias

* se verificó que la aplicación de restricciones `CHECK` rechaza correctamente valores fuera del rango permitido en rankings y estadísticas deportivas.
* se validó el correcto funcionamiento de las consultas analíticas DQL sin errores de sintaxis relacional.