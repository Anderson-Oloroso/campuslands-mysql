# Ejercicio 034 - HAVING para Garaje de Motos

Solución de nivel intermedio enfocada en el dominio y aplicación avanzada de la cláusula **HAVING** en MySQL para filtrar conjuntos de datos agrupados en un sistema de inventario de un garaje de motocicletas, utilizando la base de datos `campuslands_mysql`.

## Estructura de la Solución
- `ddl/schema.sql`: Creación de la base de datos, limpieza previa y definición estructurada de la tabla `garaje_motos_having` aplicando restricciones de unicidad (`UNIQUE`) para las placas, validaciones lógicas mediante `CHECK` para cilindradas y años, y tipos de datos estrictos.
- `dml/inserts.sql`: Carga inicial de 8 registros de motocicletas con variaciones calculadas por marca, cilindrada, valor comercial y estado para permitir pruebas efectivas de filtrado post-agregación.
- `dql/consultas.sql`: Implementación de 5 consultas avanzadas que explotan la cláusula `HAVING` para aplicar condiciones sobre funciones de agregación (`COUNT`, `SUM`, `AVG`, `MAX`), incluyendo la combinación clave con filtros de fila (`WHERE`).

## Tabla Resumen de Datos (`garaje_motos_having`)
| Columna | Tipo de Dato | Restricción / Atributo | Descripción |
| :--- | :--- | :--- | :--- |
| `id` | INT | PRIMARY KEY, AUTO_INCREMENT | Identificador único del registro |
| `placa` | VARCHAR(10) | NOT NULL, UNIQUE | Placa o matrícula oficial única de la moto |
| `marca` | VARCHAR(50) | NOT NULL | Fabricante de la motocicleta |
| `modelo` | VARCHAR(60) | NOT NULL | Línea o referencia comercial del modelo |
| `cilindrada_cc` | INT UNSIGNED | CHECK (> 0), NOT NULL | Cilindrada del motor en centímetros cúbicos |
| `anio_fabricacion`| INT UNSIGNED | CHECK (1950 - 2026), NOT NULL | Año de fabricación del vehículo |
| `precio_comercial`| DECIMAL(10,2)| CHECK (>= 0.00), Default 0.00 | Valor estimado de mercado de la moto |
| `estado_motos` | ENUM | disponible / en_mantenimiento / alquilada / reservada | Estatus operativo actual en el garaje |

## Ejecución
1. Ejecutar el archivo `schema.sql` para configurar la base de datos y la estructura relacional.
2. Ejecutar el archivo `inserts.sql` para poblar la tabla con los registros iniciales de prueba.
3. Ejecutar el archivo `consultas.sql` para comprobar el funcionamiento de los filtros analíticos basados en `HAVING`.

## Decisiones Técnicas
- **Uso de HAVING vs WHERE**: Se aplicó `WHERE` para filtrar registros individuales antes de la agrupación temporal y `HAVING` específicamente para restringir los resultados calculados por funciones de agregación (como conteos, sumas y promedios).
- **Validaciones Estadísticas**: Creación de consultas orientadas a la toma de decisiones gerenciales (por ejemplo, detectar marcas con alta inversión acumulada o estados operativos con alta densidad de unidades).