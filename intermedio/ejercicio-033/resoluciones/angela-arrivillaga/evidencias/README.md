# Ejercicio 033 - GROUP BY para Inventario de Skins Shooter

## Estructura del Proyecto

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

1. Ejecutar `ddl/schema.sql`.
2. Ejecutar `dml/inserts.sql`.
3. Ejecutar `dql/consultas.sql`.

## Decisiones Técnicas

* Se estructuró la base de datos relacional `inventario_skins_db` separando entidades normalizadas como categorías de armas y niveles de rareza.
* Foco principal en el uso avanzado de la cláusula **GROUP BY** combinada con funciones de agregación (`COUNT`, `SUM`, `AVG`, `MAX`, `MIN`) y filtrado avanzado mediante `HAVING`.
* Aplicación de restricciones de integridad como `CHECK` para garantizar precios positivos y `ENUM` para controlar los estados válidos de disponibilidad de las skins.

## Salida y Resultados Esperados

* Reportes detallados por categoría con conteo y valoración monetaria total y promedio.
* Análisis de rarezas excluyendo elementos archivados para medir la disponibilidad real de piezas valiosas.
* Distribución del inventario por estado actual de uso o venta.
* Agrupación avanzada con `HAVING` para filtrar segmentos exclusivos con alta valoración económica.
* Análisis cronológico de adquisiciones mensuales.

## Evidencias

Para demostrar la correcta ejecución:

* DDL: Creación del esquema relacional con claves foráneas, tipos de datos precisos y validaciones de negocio.
* DML: Inserción de 12 registros diversos y realistas simulando un inventario completo de videojuego shooter.
* DQL: Consultas con agrupaciones múltiples, alias descriptivos y funciones analíticas clave.