# Solución Ejercicio 053 (Intermedio Retador) - Arquitectura 3D (Normalización 3FN)

## Descripción
Esta solución aplica las reglas de la **Tercera Forma Normal (3FN)** para un sistema de **Arquitectura 3D**.

### Criterio de Normalización 3FN:
1. **Atributos Atómicos (1FN)** y **Dependencia Funcional Completa (2FN)** garantizados.
2. **Eliminación de Dependencias Transitivas (3FN)**:
   - Datos como `pais_origen` o `software_bim_preferido` dependen de la **Firma de Arquitectura**, no directamente del proyecto ni del modelo 3D. Se creó la tabla `firmas_arquitectura`.
   - Atributos como `norma_construccion_aplicable` o `es_espacio_publico` dependen de la **Categoría del Espacio**, no del modelo 3D directamente. Se creó la tabla `categorias_espacio`.

## Instrucciones de Ejecución
1. Ejecutar `ddl/schema.sql` en MySQL para desplegar el esquema normalizado en 3FN.
2. Ejecutar `dml/inserts.sql` para cargar los registros.
3. Ejecutar `dql/consultas.sql` para validar reportes e indicadores.

---

## Evidencia de Resultados

### Consulta 2: Indicadores por Firma de Arquitectura
| nombre_firma          | software_bim_preferido | total_modelos | superficie_total_m2 | costo_promedio_usd_por_m2 |
|-----------------------|------------------------|---------------|---------------------|---------------------------|
| Gensler Digital       | Revit                  | 1             | 22000.00            | 859.09                    |
| Foster + Partners     | Revit                  | 2             | 16600.50            | 796.83                    |
| Zaha Hadid Architects | Rhinoceros 3D          | 2             | 18000.00            | 929.59                    |

### Consulta 4: Proyectos en Espacios Públicos (> $5M USD)
| nombre_proyecto               | nombre_categoria          | costo_estimado_usd | nombre_firma          | estado          |
|-------------------------------|---------------------------|--------------------|-----------------------|-----------------|
| Mall Plaza Innovación         | Comercial & Retail        | 18900000.00        | Gensler Digital       | Aprobado        |
| Centro Cultural de las Artes  | Infraestructura Cultural  | 7800000.00         | Zaha Hadid Architects | Aprobado        |
| Parque Lineal Metropolitano   | Paisajismo Urbano         | 5400000.00         | Foster + Partners     | Aprobado        |