# Ejercicio 032 - procedimientos almacenados para ranking battle royale

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

1. Ejecutar ddl/schema.sql (incluye definición de tablas y creación del procedimiento almacenado).
2. Ejecutar dml/inserts.sql (carga datos base y ejecuta llamadas de prueba al procedimiento almacenado).
3. Ejecutar dql/consultas.sql.

## Decisiones técnicas

* Se utilizó la base de datos campuslands_mysql.
* Se implementó un procedimiento almacenado (`sp_registrar_partida_br`) dotado de control transaccional completo (`START TRANSACTION`, `COMMIT`, `ROLLBACK` mediante manejador de excepciones `SQLEXCEPTION`) para automatizar el registro de partidas y la actualización concurrente del puntaje y victorias del jugador.
* Se diseñó una arquitectura relacional de 1:N entre el perfil de los jugadores y el historial de sus partidas.
* Se incorporaron restricciones `CHECK` para mantener la consistencia lógica en los puestos, asesinatos, puntos de liga y victorias sin permitir valores negativos.
* Se utilizaron tipos `ENUM` para controlar de manera estricta los estados de los competidores.

## Salida y resultados esperados

* El procedimiento almacenado actualiza de forma atómica y segura las tablas dependientes al simular nuevas partidas.
* El reporte por rango agrupa las estadísticas de rendimiento competitivo.
* El top 3 muestra a los líderes absolutos del ranking del battle royale.

---

# Evidencias

En este archivo se registran las validaciones realizadas:
* **Ejecución del DDL:** Verificar la creación exitosa de las tablas jugadores_br y partidas_br, así como la compilación sin errores del procedimiento almacenado.
* **Inserción y Procedimientos:** Validar la carga de registros iniciales y el funcionamiento correcto de las llamadas `CALL` para registrar partidas dinámicas.
* **Ejecución de las consultas:** Comprobar que los scripts DQL devuelven los reportes de negocio, agregaciones y uniones de tablas esperadas.
* **Resultados importantes:** Validar la precisión en los cálculos de promedios, sumatorias de victorias y la integridad transaccional del sistema.