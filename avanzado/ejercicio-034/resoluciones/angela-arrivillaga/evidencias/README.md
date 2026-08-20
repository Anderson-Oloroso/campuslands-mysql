# Ejercicio 034 - triggers para garaje de motos

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

1. Ejecutar ddl/schema.sql (incluye creación de tablas y programación del Trigger `trg_auditoria_mantenimiento_motos`).
2. Ejecutar dml/inserts.sql (carga registros iniciales y ejecuta sentencias UPDATE que disparan el trigger de auditoría).
3. Ejecutar dql/consultas.sql.

## Decisiones técnicas

* Se utilizó la base de datos campuslands_mysql.
* Se programó un Trigger avanzado de tipo `AFTER UPDATE` (`trg_auditoria_mantenimiento_motos`) para detectar de manera automática cualquier modificación en el estado de las motocicletas y registrar una traza detallada en la tabla de auditoría.
* Se estructuró una relación de 1:N entre el inventario de motos y los eventos de auditoría mediante claves foráneas.
* Se emplearon tipos `DECIMAL` para garantizar precisión financiera estricta en los precios comerciales.
* Se utilizaron tipos `ENUM` y restricciones `CHECK` para mantener la integridad en los estados y evitar valores negativos o ilógicos en cilindradas y precios.

## Salida y resultados esperados

* El Trigger registra automáticamente los cambios de estado operativos sin intervención manual del usuario.
* El reporte por marca calcula promedios de costos y cilindrada en las unidades disponibles.
* El top 3 identifica los modelos de mayor valor comercial en el garaje.

---

# Evidencias

En este archivo se registran las validaciones realizadas:
* **Ejecución del DDL:** Verificar la creación correcta de las tablas motos_garaje y auditoria_motos, así como la compilación exitosa del Trigger.
* **Inserción y Activación del Trigger:** Validar la carga inicial de registros y comprobar que las sentencias UPDATE inserten registros de control en la tabla de auditoría.
* **Ejecución de las consultas:** Validar que los scripts DQL devuelvan los reportes analíticos, agregaciones y uniones de control (JOIN) sin errores.
* **Resultados importantes:** Comprobar el funcionamiento exacto de la automatización por eventos, el cálculo de sumatorias de inventario y los filtros por estado operativo.