# Ejercicio 025 - Nivel Básico - COUNT y SUM Laboratorio Fórmulas Químicas

## 1. Temática

Laboratorio de fórmulas químicas con COUNT y SUM para análisis de compuestos.

## 2. Decisiones Técnicas

- **Diseño de Tablas (DDL):**
  - Una tabla: `ejercicio-025-bas-compuestos`.
  - Columnas: `id`, `nombre`, `tipo`, `peso`, `cantidad`.
  - PRIMARY KEY en `id` con AUTO_INCREMENT.
  - Uso de comillas invertidas para nombres con guiones.

- **Inserción de Datos (DML):**
  - 5 compuestos de diferentes tipos.

- **Consultas (DQL):**
  - La consulta `1` cuenta el total de compuestos.
  - La consulta `2` suma la cantidad total.
  - La consulta `3` agrupa por tipo con COUNT y SUM.

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
