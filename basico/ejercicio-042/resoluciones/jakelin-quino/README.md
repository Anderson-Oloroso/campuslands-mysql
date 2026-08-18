# Ejercicio 042 - Nivel Básico - Modelado de Entidad Playlist Musical

## 1. Temática

Playlist musical con modelado de entidad para almacenar canciones con sus atributos principales.

## 2. Decisiones Técnicas

- **Diseño de Tablas (DDL):**
  - Una tabla: `ejercicio-042-bas-canciones`.
  - Columnas: `id`, `titulo`, `artista`, `album`, `genero`, `duracion`, `año`, `reproducciones`, `calificacion`.
  - PRIMARY KEY en `id` con AUTO_INCREMENT.
  - Uso de comillas invertidas para nombres con guiones.

- **Atributos de la entidad canción:**
  - **Título:** Identificador principal (NOT NULL).
  - **Artista:** Nombre del intérprete.
  - **Álbum:** Nombre del disco.
  - **Género:** Categoría musical (default 'pop').
  - **Duración:** Tiempo de la canción (tipo TIME).
  - **Año:** Año de lanzamiento.
  - **Reproducciones:** Contador de escuchas.
  - **Calificación:** Puntuación entre 0 y 5 (con CHECK).

- **Inserción de Datos (DML):**
  - 8 canciones de diferentes géneros y épocas.
  - Datos variados para pruebas.

- **Consultas (DQL):**
  - Ver todos los datos.
  - Agrupación por género.
  - Top 5 más reproducidas.
  - Filtro por calificación.
  - Estadísticas generales con funciones de agregación.
