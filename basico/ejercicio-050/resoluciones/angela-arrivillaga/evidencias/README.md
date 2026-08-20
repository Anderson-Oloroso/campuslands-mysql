# Ejercicio 050 - SELECT para estudio de tatuajes

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

* Se utilizó la base de datos campuslands_mysql.
* Se aplicó la instrucción SELECT junto con funciones de agregación (AVG, SUM, COUNT) y filtros avanzados (WHERE, GROUP BY, ORDER BY, LIMIT) para explotar los datos del estudio de tatuajes.
* Se empleó el tipo DECIMAL para asegurar la precisión numérica en los precios y calificaciones.
* Se utilizó el tipo ENUM para controlar de forma estricta los estilos de arte corporal y los estados de los citas o trabajos.
* Se establecieron restricciones CHECK para validar que los precios, las horas de trabajo y las calificaciones se mantengan en rangos coherentes.
* Se incluyeron 8 registros variados para permitir pruebas completas de consultas complejas.

## Salida y resultados esperados

* El reporte de promedio agrupa los costos y tiempos por estilo exclusivamente para los tatuajes finalizados.
* El top 3 muestra las piezas de arte mejor valoradas por los clientes del estudio.
* Las consultas específicas devuelven reportes filtrados por rangos económicos, estados operativos y estilos artísticos.

---

# Evidencias

En este archivo se registran las validaciones realizadas:
* **Ejecución del DDL:** Verificar que la tabla tatuajes se creó correctamente con sus restricciones y tipos de datos.
* **Inserción de datos:** Validar que los 8 registros de tatuajes se insertaron correctamente mediante la instrucción INSERT.
* **Ejecución de las consultas:** Validar que cada archivo de consulta devuelva los reportes y indicadores esperados sin errores de sintaxis.
* **Resultados importantes:** Comprobar el funcionamiento correcto de la sentencia SELECT en conjunto con agrupaciones, filtros relacionales y ordenamientos avanzados.