# 🎮 Ejercicio 015 - Optimización para Biblioteca Gamer

## 📌 Descripción Técnica
Este proyecto presenta la versión optimizada de la base de datos `basico_biblioteca_gamer`. Enfocado en rendimiento de nivel avanzado inicial, implementa estrategias de indexación en claves foráneas y columnas de alto filtrado, eliminación en cascada y abstrae los `JOIN` complejos mediante una vista optimizada.

---

## 🚀 Estrategias de Optimización Aplicadas

* **Índices Secundarios (`INDEX`):** Se crearon índices explícitos sobre las Foreign Keys (`idx_juego_categoria`, `idx_libreria_juego_creador`) para acelerar la velocidad de respuesta en operaciones `JOIN`.
* **Indexación de Ordenamiento:** Índice descendente en `cantidad_descargas` para resolver consultas con `ORDER BY ... DESC LIMIT` sin requerir lecturas completas de tabla (`Filesort`).
* **Abstracción con Vistas (`VIEW`):** Implementación de `vw_resumen_biblioteca` para simplificar las consultas DQL del equipo de desarrollo sin sacrificar el plan de ejecución.
* **Integridad Referencial:** Cláusulas `ON DELETE CASCADE` configuradas para evitar inconsistencias o llamadas huérfanas en operaciones transaccionales.

---

## 🛠️ Instrucciones de Ejecución

1. Ejecuta la sección **DDL** para estructurar la base de datos, índices y vistas.
2. Carga los registros utilizando el bloque **DML**.
3. Corre el script **DQL** y analiza los resultados utilizando las herramientas de *Execution Plan* o `EXPLAIN` de tu cliente MySQL.