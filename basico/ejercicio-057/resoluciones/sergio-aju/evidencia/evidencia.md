# Ejercicio 057 - Modelado para Videojuego de Acción y Aventura

Solución técnica que modela una relación **uno a muchos** entre una base de objetos y el inventario dinámico de los jugadores, permitiendo rastrear rareza, valor y estado de equipo.

## Estructura
- `ddl/schema.sql`: Define las entidades `objetos_juego` e `inventario_jugador` aplicando integridad referencial.
- `dml/inserts.sql`: Carga inicial de catálogo de objetos y asignación de ítems a jugadores.
- `dql/consultas.sql`: Reportes sobre valor de inventario, rareza y estados operativos.

## Decisiones Técnicas
- **Normalización**: Separar el objeto (catálogo estático) del inventario (instancia dinámica) evita la redundancia de datos.
- **Integridad**: Uso de `FOREIGN KEY` para asegurar que solo se guarden objetos que existen en la base.
- **Tipado**: Uso de `ENUM` para restringir rarezas y tipos, evitando errores de entrada manual.