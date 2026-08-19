USE arquitectura_3d_db;

-- SECCIÓN DE ACTUALIZACIONES (UPDATE)

-- 1. Actualizar el estado de los proyectos que se encuentran 'en_diseno' hacia 'render_final'
UPDATE proyectos_arquitectura
SET estado_proyecto = 'render_final'
WHERE estado_proyecto = 'en_diseno';

-- 2. Aplicar un incremento salarial o ajuste de presupuesto del 10% a los proyectos modelados en el software 'SketchUp'
UPDATE proyectos_arquitectura
SET presupuesto_usd = presupuesto_usd * 1.10
WHERE software_bim = 'SketchUp';

-- 3. Actualizar la calificación del cliente a un puntaje optimizado de 5.00 para aquellos proyectos que ya fueron 'entregados'
UPDATE proyectos_arquitectura
SET calificacion_cliente = 5.00
WHERE estado_proyecto = 'entregado';

-- 4. Actualizar de manera específica el estado y presupuesto del proyecto con código 'ARQ-004' (caso de ajuste contractual)
UPDATE proyectos_arquitectura
SET estado_proyecto = 'render_final', presupuesto_usd = presupuesto_usd + 5000.00
WHERE codigo_proyecto = 'ARQ-004';


-- SECCIÓN DE CONSULTAS DE VERIFICACIÓN Y REPORTE (SELECT)

-- 5. Consulta final de control: Listar todos los proyectos ordenados por presupuesto actualizado de mayor a menor
SELECT codigo_proyecto, nombre_proyecto, software_bim, CONCAT('$', FORMAT(presupuesto_usd, 2)) AS presupuesto_actualizado, calificacion_cliente, estado_proyecto
FROM proyectos_arquitectura
ORDER BY presupuesto_usd DESC;