# Ejercicio 054 - Nivel Básico - DELETE Controlado Soldadura

## 1. Temática

Soldadura con DELETE controlado para eliminar proyectos según estado.

## 2. Decisiones Técnicas

- **Diseño de Tablas (DDL):**
  - Una tabla: `ejercicio-054-bas-proyectos`.
  - Columnas: `id`, `nombre`, `material`, `temperatura`, `estado`.
  - PRIMARY KEY en `id` con AUTO_INCREMENT.
  - Uso de comillas invertidas para nombres con guiones.

- **Inserción de Datos (DML):**
  - 5 proyectos con diferentes materiales y estados.

- **Consultas (DQL):**
  - La consulta `1` muestra todos los proyectos.
  - La consulta `2` elimina proyectos con estado 'cancelado'.
  - La consulta `3` verifica los proyectos restantes.
