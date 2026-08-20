USE campuslands_mysql;

SELECT
    titulo,
    artista,
    tecnica,
    precio
FROM dibujos
WHERE estado = 'disponible';

SELECT
    titulo,
    artista,
    nivel_dificultad,
    precio
FROM dibujos
WHERE precio > 300;

SELECT
    titulo,
    artista,
    tecnica,
    precio
FROM dibujos
WHERE tecnica = 'Digital Painting';

SELECT
    titulo,
    artista,
    nivel_dificultad,
    estado
FROM dibujos
WHERE nivel_dificultad = 'avanzado'
  AND estado = 'disponible';

SELECT
    titulo,
    artista,
    precio,
    estado
FROM dibujos
WHERE precio BETWEEN 200 AND 500
  AND estado <> 'vendido';