# Ejercicio 021 - Nivel Avanzado - EXPLAIN Dibujo Digital

## 1. Temática

Dibujo digital con EXPLAIN para analizar el rendimiento de consultas.

## 2. Decisiones Técnicas

- **Diseño de Tablas (DDL):**
  - Una tabla: `ejercicio-021-adv-dibujos`.
  - Columnas: `id`, `titulo`, `artista`, `tecnica`, `precio`.
  - PRIMARY KEY en `id` con AUTO_INCREMENT.
  - Índices en `artista` y `precio`.
  - Uso de comillas invertidas para nombres con guiones.

- **Inserción de Datos (DML):**
  - 4 dibujos con diferentes artistas y precios.

- **Consultas (DQL):**
  - La consulta `1` muestra los índices creados.
  - La consulta `2` usa EXPLAIN para analizar consulta con índice `idx_artista`.
  - La consulta `3` usa EXPLAIN para analizar consulta con índice `idx_precio`.

## 3. Evidencias

<!-- Capturas aquí -->

*A continuación, se adjuntan capturas de pantalla que demuestran la ejecución y los resultados de los scripts SQL en phpMyAdmin.*

Definición de tablas e inserción de datos
![Definir e insertar](evidencias/definirEinsertar.png)
Consulta 1
![Consulta1](evidencias/consulta1.png)
Consulta 2
![Consulta2](evidencias/consulta2.png)
Consulta 3
![Consulta3](evidencias/consulta3.png)
