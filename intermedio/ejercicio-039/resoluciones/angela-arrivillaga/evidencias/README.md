# Ejercicio 039 - Uso de FOREIGN KEY para Kickboxing

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

1. Ejecutar el script `ddl/schema.sql` para crear la base de datos relacional y definir las restricciones de clave foránea (`FOREIGN KEY`).
2. Ejecutar el script `dml/inserts.sql` para insertar registros iniciales y de prueba en todas las tablas.
3. Ejecutar el script `dql/consultas.sql` para verificar las relaciones mediante reportes analíticos y consultas complejas.

## Decisiones Técnicas

* Se diseñó el esquema relacional `kickboxing_fk_db` haciendo uso estricto y profesional de restricciones `FOREIGN KEY` con políticas de borrado y actualización controladas (`RESTRICT`, `CASCADE`, `SET NULL`).
* **Integridad Referencial:** 
  - La tabla `luchadores` se conecta de forma dependiente con `gimnasios` y `categorias_peso`.
  - La tabla `combates` relaciona de manera segura múltiples entidades (`eventos`, `luchadores` azul, `luchadores` rojo, `categorias_peso` y el luchador `ganador`).
* Se incorporaron validaciones adicionales mediante `CHECK` para garantizar edades mínimas válidas, estadísticas no negativas y la imposibilidad de que un luchador compita contra sí mismo.

## Salida y Resultados Esperados

* Modelo relacional robusto que asegura la integridad referencial y evita registros huérfanos.
* Inserción exitosa de 5 gimnasios, 5 categorías de peso, 10 luchadores con perfiles completos, 3 eventos oficiales y múltiples combates con diferentes métodos de resolución.
* Consultas DQL avanzadas con uniones múltiples (`JOIN`), funciones de agregación, cálculo de porcentajes de efectividad y análisis estadístico del rendimiento deportivo.