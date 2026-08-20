# ejercicio 038 - roles y permisos para futbol sala

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

1. ejecutar ddl/schema.sql (incluye definicion de tablas, creacion de roles de base de datos y asignacion de privilegios).
2. ejecutar dml/inserts.sql (carga registros para equipos y jugadores de futbol sala).
3. ejecutar dql/consultas.sql.

## decisiones tecnicas

* creacion y configuracion de roles de base de datos (`rol_analista_sala` y `rol_operador_sala`) para cumplir con el principio de mínimo privilegio en entornos corporativos.
* modelado relacional de 1:N entre equipos y jugadores con integridad referencial estricta.
* uso de restricciones `check` para validar que dorsales, goles y puntos mantengan rangos lógicos sin valores negativos.
* empleo de tipos de datos `enum` para controlar con rigor los estados administrativos de los clubes.

## salida y resultados esperados

* configuracion exitosa de roles de seguridad independientes para analistas y operadores.
* reportes estadísticos avanzados de rendimiento de equipos y goleadores del torneo.

---

# evidencias

* se verificó la creación de roles mediante consultas al diccionario de datos de mysql.
* se validó que los permisos de lectura y escritura funcionen acorde al rol asignado.