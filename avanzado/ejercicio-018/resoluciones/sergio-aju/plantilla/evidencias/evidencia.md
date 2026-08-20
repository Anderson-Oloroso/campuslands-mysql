# Solución Ejercicio 018 (Avanzado) - Stored Functions Viajes y Turismo

## Descripción
Solución del ejercicio avanzado enfocado en la creación y uso de **Funciones Almacenadas (`STORED FUNCTIONS`)** (`fn_calcular_costo_base`, `fn_calcular_total_reserva`, `fn_clasificar_categoria_precio`) para realizar cálculos de precios, aplicación de descuentos y clasificación automática de paquetes turísticos.

## Pasos para ejecutar
1. Ejecuta `ddl/schema.sql` para crear las tablas y registrar las funciones en la base de datos.
2. Ejecuta `dml/inserts.sql` para insertar los paquetes turísticos y las reservas de prueba.
3. Ejecuta `dql/consultas.sql` para consultar las reservas y validar las funciones personalizadas.

---

## Evidencia de Resultados

### Consulta 1: Costo base y clasificación de paquetes
| id | destino                | pais      | duracion_dias | costo_base | nivel_precio |
|----|------------------------|-----------|---------------|------------|--------------|
| 3  | Cancún Resort          | México    | 7             | 840.00     | Premium      |
| 7  | Punta Cana             | Rep. Dom. | 6             | 780.00     | Estándar     |
| 5  | Machu Picchu Expreso   | Perú      | 4             | 600.00     | Estándar     |
| 1  | Tikal y Antigua        | Guatemala | 5             | 450.00     | Estándar     |

### Consulta 2: Reporte de reservas con total calculado dinámicamente
| reserva_id | cliente        | destino          | personas | descuento_porcentaje | total_pagado |
|------------|----------------|------------------|----------|----------------------|--------------|
| 3          | Luis Fernández | Cancún Resort    | 4        | 15.00                | 2856.00      |
| 5          | Javier López   | Punta Cana       | 3        | 20.00                | 1872.00      |
| 4          | María Morales  | Machu Picchu Exp | 2        | 5.00                 | 1140.00      |
| 1          | Carlos Gómez   | Tikal y Antigua  | 2        | 10.00                | 810.00       |