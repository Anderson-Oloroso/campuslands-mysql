# Ejercicio 026 - Validaciones simples para videojuego RPG

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

* Se utilizó la base de datos `rpg_videojuego_db`.
* Se implementaron **validaciones rigurosas** a nivel de esquema DDL mediante restricciones `CHECK` para garantizar que el nivel del personaje se mantenga estrictamente en el rango de 1 a 100 y que la experiencia acumulada nunca sea un valor negativo.
* Se estructuraron consultas DQL orientadas a validar rangos numéricos y condiciones de negocio (`BETWEEN`, `IN`, `NOT IN`, operadores lógicos `AND`), asegurando la integridad y la veracidad de los datos consultados.
* Se registraron 8 personajes icónicos con clases variadas (Guerrero, Mago, Arquero, Asesino, Paladin) y diversos estados operativos para probar múltiples casos de filtrado y validación.

## Salida y resultados esperados

* Validación de nivel y estado: Listado de personajes activos de alto nivel (> 80) ordenados de forma descendente.
* Validación de rangos de experiencia: Extracción de avatares cuyo progreso se sitúa entre umbrales específicos mediante `BETWEEN`.
* Validación de múltiples clases (`IN`): Filtrado de personajes pertenecientes a grupos tácticos clave.
* Validación de exclusión de estados (`NOT IN`): Aislamiento de jugadores con participación activa o en combate.
* Reporte analítico agrupado: Estadísticas de niveles máximos y experiencia acumulada por clase para jugadores experimentados.

## Evidencias

Para demostrar la correcta ejecución:

* **DDL:** Captura de consola ejecutando comandos descriptivos de esquema para validar la correcta configuración de claves primarias y restricciones `CHECK`.
* **DML:** Comprobación mediante `SELECT COUNT(*) FROM personajes_rpg;` confirmando la inserción exacta de los 8 registros de prueba.
* **DQL:** Salida en consola de las 5 consultas con validaciones estrictas demostrando el dominio de restricciones lógicas y de integridad en MySQL.