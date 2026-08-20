# Ejercicio 034 - INSERT para Garaje de Motos

Solución de nivel básico enfocada en la correcta aplicación de sentencias **INSERT** y la gestión de esquemas estructurados en MySQL para el control de inventario de un garaje de motocicletas, utilizando la base de datos `campuslands_mysql`.

## Estructura de la Solución
- `ddl/schema.sql`: Creación de la base de datos, limpieza previa y definición estructurada de la tabla `garaje_motos` aplicando restricciones de unicidad (`UNIQUE`) para las placas, validaciones lógicas mediante `CHECK` para rangos de años y cilindradas, y tipos de datos precisos.
- `dml/inserts.sql`: Carga inicial de 8 registros detallados de motocicletas con variaciones de marca, modelo, cilindrada, valor comercial y estado operativo.
- `dql/consultas.sql`: Implementación de 5 consultas analíticas que incluyen reportes ordenados por precio, filtros de disponibilidad, agrupaciones estadísticas por marca y estado, y selección del *Top 3* por potencia (*cilindrada*).

## Tabla Resumen de Datos (`garaje_motos`)
| Columna | Tipo de Dato | Restricción / Atributo | Descripción |
| :--- | :--- | :--- | :--- |
| `id` | INT | PRIMARY KEY, AUTO_INCREMENT | Identificador único del registro |
| `placa` | VARCHAR(10) | NOT NULL, UNIQUE | Placa o matrícula oficial única de la moto |
| `marca` | VARCHAR(50) | NOT NULL | Fabricante de la motocicleta |
| `modelo` | VARCHAR(60) | NOT NULL | Línea o referencia comercial del modelo |
| `cilindrada_cc` | INT UNSIGNED | CHECK (> 0), NOT NULL | Cilindrada del motor en centímetros cúbicos |
| `anio_fabricacion`| INT UNSIGNED | CHECK (1950 - 2026), NOT NULL | Año en que se fabricó el vehículo |
| `precio_comercial`| DECIMAL(10,2)| CHECK (>= 0.00), Default 0.00 | Valor estimado de mercado de la moto |
| `estado_motos` | ENUM | disponible / en_mantenimiento / alquilada / reservada | Estatus operativo actual en el garaje |

## Ejecución
1. Ejecutar el archivo `schema.sql` para configurar la base de datos y la estructura relacional.
2. Ejecutar el archivo `inserts.sql` para poblar la tabla mediante inserciones limpias y estructuradas.
3. Ejecutar el archivo `consultas.sql` para comprobar el funcionamiento de las consultas de negocio y reportes operativos.

## Decisiones Técnicas
- **Consistencia en Inserciones**: Uso de nombres de columnas explícitos en las sentencias `INSERT` para garantizar la correspondencia exacta de los datos y evitar errores ante futuras modificaciones de la estructura.
- **Validaciones de Integridad**: Incorporación de restricciones `CHECK` para asegurar que las cilindradas sean positivas y los años de fabricación se encuentren dentro de un rango cronológico válido.