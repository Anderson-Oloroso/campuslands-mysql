# Solución Ejercicio 018 - Viajes y Turismo (PRIMARY KEY)

## Descripción
Solución del ejercicio básico para practicar la creación de tablas con clave primaria (`PRIMARY KEY AUTO_INCREMENT`) enfocada en un catálogo de paquetes de viajes y turismo.

## Pasos para ejecutar
1. Ejecuta `ddl/schema.sql` para crear la tabla `basico_ejercicio_018`.
2. Ejecuta `dml/inserts.sql` para cargar los destinos de prueba.
3. Ejecuta `dql/consultas.sql` para verificar los reportes.

---

## Evidencia de Resultados

### Consulta 2: Promedio de precios por categoría
| categoria  | total_paquetes | precio_promedio |
|------------|----------------|-----------------|
| Cultural   | 1              | 450.00          |
| Playa      | 2              | 820.00          |
| Aventura   | 2              | 565.00          |
| Ecoturismo | 1              | 280.00          |

### Consulta 3: Top 3 viajes económicos
| destino               | categoria  | duracion_dias | precio |
|-----------------------|------------|---------------|--------|
| Ruta del Café Atitlán | Ecoturismo | 3             | 280.00 |
| Tikal y Antigua       | Cultural   | 5             | 450.00 |
| Salar de Uyuni        | Aventura   | 5             | 510.00 |