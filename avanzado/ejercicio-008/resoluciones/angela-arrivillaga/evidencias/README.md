# Ejercicio 008 - Roles y permisos para futbol sala

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

* Se utilizó la base de datos `futbol_sala`.
* Se normalizó el modelo de control de acceso mediante una relación de muchos a muchos (`rol_permisos`) entre `roles` y `permisos`.
* Se implementó un campo `estado` tipo `ENUM` en la tabla `usuarios` para manejar restricciones de actividad (`activo`, `inactivo`, `suspendido`).
* Se incluyeron 8 registros de usuarios variados para permitir pruebas de filtrado y agrupamiento con `GROUP BY` y `HAVING`.

## Salida y resultados esperados

* Consulta de usuarios con rol: Relaciona cada usuario con su respectivo rol en el sistema.
* Conteo por rol: Muestra el total de usuarios activos por cada categoría de rol.
* Permisos por rol: Detalla los privilegios específicos asignados al rol de Administrador.
* Filtro de permisos avanzados: Identifica roles con alta asignación de privilegios mediante cláusula `HAVING`.
* Usuarios inactivos/suspendidos: Filtra cuentas con restricciones de acceso.

## Evidencias

Para demostrar la correcta ejecución:

* **DDL:** Captura de pantalla de `SHOW TABLES;` y la estructura de las tablas creadas en MySQL.
* **DML:** Ejecución de `SELECT * FROM usuarios;` y `SELECT * FROM rol_permisos;` confirmando los 8 registros de usuarios y sus relaciones.
* **DQL:** Salida en consola de las 5 consultas solicitadas, verificando los reportes de roles, permisos y estados.