# Ejercicio 012 - Modelado de entidad para playlist musical

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

* Se utilizó la base de datos `playlist_musical_db`.
* Se aplicó un modelado relacional de muchos a muchos mediante una tabla intermedia (`playlist_canciones`) para asociar múltiples canciones a múltiples listas de reproducción conservando un orden específico.
* Se incluyeron restricciones de validación simples (`CHECK`) para asegurar que la duración de las canciones y el número de orden sean mayores a cero.
* Se incorporaron registros suficientes (4 playlists, 8 canciones y 8 relaciones) para evaluar agrupaciones, conversiones de tiempo y filtros por estado.

## Salida y resultados esperados

* Detalle de listas: Muestra las canciones ordenadas dentro de cada playlist mediante cruces relacionales avanzados.
* Conteo por playlist: Cuantifica el volumen de temas musicales integrados por lista de reproducción.
* Duración acumulada: Calcula la sumatoria total del tiempo en segundos y minutos de reproducción por cada mix.
* Filtro de duración: Selecciona pistas musicales extendidas que superan el umbral estándar de 3 minutos.
* Filtrado operativo: Lista exclusivamente las playlists con estatus operativo (`activa`).

## Evidencias

Para demostrar la correcta ejecución:

* **DDL:** Captura de consola ejecutando `SHOW TABLES;` y validando las restricciones de integridad y llaves foráneas.
* **DML:** Verificación con consultas de conteo base (`SELECT COUNT(*) FROM canciones;`) cumpliendo con el mínimo de registros solicitados.
* **DQL:** Salida estructurada de las 5 consultas requeridas para reportes y métricas de negocio.