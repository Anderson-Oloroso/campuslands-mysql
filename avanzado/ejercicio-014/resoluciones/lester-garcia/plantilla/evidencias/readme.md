# Sci-Fi Saga Event Scheduler - Base de Datos en MySQL

## Alumno

**Lester Garcia**

## Descripción

En este ejercicio se desarrolló una base de datos relacional en MySQL inspirada en una saga de ciencia ficción. El objetivo fue almacenar información sobre personajes, misiones y participantes, además de implementar tareas automáticas mediante el **Event Scheduler de MySQL**.

El Event Scheduler permite ejecutar instrucciones SQL automáticamente de acuerdo con una programación definida, evitando que determinadas tareas tengan que ejecutarse manualmente.

## Solución General

La solución consiste en la creación de una base de datos llamada **sci_fi_saga_events**, conformada por cuatro tablas:

- **characters** → Almacena los personajes de la saga.
- **missions** → Contiene las misiones realizadas.
- **mission_participants** → Relaciona personajes con misiones.
- **mission_logs** → Registra las acciones y mensajes generados por el sistema.

Posteriormente se implementaron dos eventos programados:

1. **archive_completed_missions** → Revisa diariamente las misiones completadas con más de 30 días de antigüedad y genera automáticamente un registro en `mission_logs`.

2. **system_mission_report** → Ejecuta una verificación diaria y registra automáticamente un mensaje de control del sistema.

## Decisiones técnicas

- Se utilizaron claves primarias para identificar cada registro.
- Se utilizaron claves foráneas para mantener la integridad referencial.
- Se utilizó una tabla intermedia `mission_participants` para representar la relación entre personajes y misiones.
- Se creó `mission_logs` para mantener un historial de las acciones generadas automáticamente.
- Se utilizó `CREATE EVENT` para implementar tareas programadas.
- Se utilizó `EVERY 1 DAY` para ejecutar los procesos de manera diaria.
- Se utilizó `SHOW EVENTS` para comprobar que los eventos fueron creados correctamente.
- Se consultó `information_schema.EVENTS` para verificar la configuración de los eventos.
- El Event Scheduler debe encontrarse habilitado para que los eventos puedan ejecutarse automáticamente.

## Importante

El Event Scheduler puede verificarse mediante:

```sql
SHOW VARIABLES LIKE 'event_scheduler';
```

Si el resultado muestra que está desactivado, un usuario con los permisos correspondientes puede habilitarlo mediante:

```sql
SET GLOBAL event_scheduler = ON;
```

La activación global puede requerir privilegios administrativos y puede depender de la configuración del servidor MySQL.

## Evidencia

La solución está organizada en tres archivos SQL independientes:

- **01_ddl.sql** → Creación de la base de datos y las tablas.
- **02_dml.sql** → Inserción de personajes, misiones, participantes y registros iniciales.
- **03_dql.sql** → Configuración, creación y verificación de los eventos programados.

**Estructura del proyecto:**

```text
lester-garcia/plantilla
│
├── 01_ddl.sql
├── 02_dml.sql
├── 03_dql.sql
└── README.md
```

## Resultado esperado

- Base de datos creada correctamente.
- Datos insertados sin errores.
- Relaciones entre personajes y misiones funcionando correctamente.
- Event Scheduler habilitado.
- Eventos creados correctamente.
- Eventos visibles mediante `SHOW EVENTS`.
- Registros automáticos almacenados en `mission_logs` cuando los eventos sean ejecutados por MySQL.
- Configuración de los eventos verificable mediante `information_schema.EVENTS`.