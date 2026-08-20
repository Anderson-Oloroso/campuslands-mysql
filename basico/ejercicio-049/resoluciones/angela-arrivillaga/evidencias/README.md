# Ejercicio 049 - INSERT para paracaidismo

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
* Se aplicó la instrucción INSERT para poblar la entidad con registros variados orientados al paracaidismo extremo.
* Se empleó el tipo DECIMAL para asegurar precisión en las calificaciones de aterrizaje.
* Se utilizó el tipo ENUM para controlar de forma estricta los estados posibles de cada salto.
* Se establecieron restricciones CHECK para validar que las alturas, duraciones y calificaciones se mantengan dentro de rangos reales y positivos.
* Se incluyeron 8 registros para permitir pruebas detalladas de inserción masiva, filtrado y funciones estadísticas.

## Salida y resultados esperados

* El reporte de promedio calcula la nota media de aterrizaje exclusivamente para los saltos completados con éxito.
* El top 3 muestra las experiencias de salto que alcanzaron mayor altitud en pies.
* Las consultas específicas devuelven conjuntos de datos filtrados por criterios de rendimiento, estados y marcas temporales de caída.

---

# Evidencias

En este archivo se registran las validaciones realizadas:
* **Ejecución del DDL:** Verificar que la tabla saltos_paracaidismo se creó correctamente con sus restricciones de validación.
* **Inserción de datos:** Validar que los 8 registros de paracaidismo se insertaron correctamente mediante la instrucción INSERT.
* **Ejecución de las consultas:** Validar que cada archivo de consulta devuelva los reportes esperados sin errores de sintaxis.
* **Resultados importantes:** Comprobar el funcionamiento correcto de las funciones de agregación y los filtros sobre el dataset operativo.