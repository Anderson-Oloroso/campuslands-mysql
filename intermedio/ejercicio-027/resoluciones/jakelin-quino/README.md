# Ejercicio 027 - Nivel Intermedio - Reportes Videojuego Acción y Aventura

## 1. Temática

Videojuego de acción y aventura con consultas de reportes para análisis.

## 2. Decisiones Técnicas

- **Diseño de Tablas (DDL):**
  - Una tabla: `ejercicio-027-int-personajes`.
  - Columnas: `id`, `nombre`, `tipo`, `nivel`, `vida`, `ataque`, `misiones_completadas`.
  - PRIMARY KEY en `id` con AUTO_INCREMENT.
  - Uso de comillas invertidas para nombres con guiones.

- **Inserción de Datos (DML):**
  - 5 personajes con diferentes estadísticas y misiones.

- **Consultas (DQL):**
  - La consulta `1` agrupa por tipo con COUNT y AVG.
  - La consulta `2` muestra top 3 por misiones.
  - La consulta `3` muestra estadísticas generales.

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
