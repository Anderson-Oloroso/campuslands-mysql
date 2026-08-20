# ejercicio 040 - backup logico para carreras urbanas

## estructura del proyecto

angela-arrivillaga/
├── ddl/
│   └── schema.sql
├── dml/
│   └── inserts.sql
├── dql/
│   └── consultas.sql
└── evidencias/
    └── README.md

## ejecucion y respaldo logico

1. ejecutar ddl/schema.sql (creacion de tablas normalizadas y restricciones de integridad).
2. ejecutar dml/inserts.sql (insercion de registros con casos reales y limites).
3. ejecutar dql/consultas.sql (ejecucion de consultas analíticas de negocio).

### comandos recomendados para respaldo logico (mysqldump)
para generar un backup logico de la solucion desde la terminal del sistema:
```bash
mysqldump -u tu_usuario -p campuslands_mysql > backup_carreras_urbanas.sql