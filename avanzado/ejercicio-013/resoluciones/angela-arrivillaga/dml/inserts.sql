use peliculas_miedo_db;

insert into subgeneros_terror (nombre_subgenero, descripcion_tematica) values
('sobrenatural', 'fantasmas, demonios y posesiones paranormales'),
('slasher', 'asesinos seriales enmascarados y persecuciones'),
('terror psicologico', 'locura, paranoia y tension mental profunda'),
('monster movie', 'criaturas monstruosas, entidades cosmicas y gore');

insert into peliculas_terror (titulo_original, director, id_subgenero, anio_estreno, presupuesto_millones, calificacion_imdb, detalles_json, estado_distribucion) values
('the conjuring', 'james wan', 1, 2013, 20.00, 7.50, 
 '{
    "elenco_principal": ["vera farmiga", "patrick wilson"],
    "streaming": ["netflix", "hbo max"],
    "premios": {"ganados": 5, "nominados": 12},
    "nivel_sustos": "alto"
 }', 'archivada'),

('hereditary', 'ari aster', 3, 2018, 10.00, 7.30, 
 '{
    "elenco_principal": ["toni collette", "gabriel byrne"],
    "streaming": ["prime video", "apple tv"],
    "premios": {"ganados": 35, "nominados": 60},
    "nivel_sustos": "psicologico"
 }', 'cartelera'),

('halloween', 'john carpenter', 2, 1978, 0.30, 7.70, 
 '{
    "elenco_principal": ["jamie lee curtis", "donald pleasence"],
    "streaming": ["shudder", "paramount+"],
    "premios": {"ganados": 4, "nominados": 3},
    "nivel_sustos": "moderado"
 }', 'cartelera'),

('the shining', 'stanley kubrick', 3, 1980, 19.00, 8.40, 
 '{
    "elenco_principal": ["jack nicholson", "shelley duvall"],
    "streaming": ["hbo max", "apple tv"],
    "premios": {"ganados": 4, "nominados": 7},
    "nivel_sustos": "alto"
 }', 'cartelera'),

('get out', 'jordan peele', 3, 2017, 4.50, 7.80, 
 '{
    "elenco_principal": ["daniel kaluuya", "allison williams"],
    "streaming": ["netflix", "peacock"],
    "premios": {"ganados": 120, "nominados": 230},
    "nivel_sustos": "suspenso"
 }', 'archivada'),

('the thing', 'john carpenter', 4, 1982, 15.00, 8.20, 
 '{
    "elenco_principal": ["kurt russell", "keith david"],
    "streaming": ["apple tv", "prime video"],
    "premios": {"ganados": 1, "nominados": 3},
    "nivel_sustos": "gore"
 }', 'archivada'),

('sinister', 'scott derrickson', 1, 2012, 3.00, 6.80, 
 '{
    "elenco_principal": ["ethan hawke", "juliet rylance"],
    "streaming": ["netflix", "prime video"],
    "premios": {"ganados": 2, "nominados": 8},
    "nivel_sustos": "alto"
 }', 'estreno'),

('scream', 'wes craven', 2, 1996, 14.00, 7.40, 
 '{
    "elenco_principal": ["neve campbell", "courteney cox"],
    "streaming": ["paramount+", "apple tv"],
    "premios": {"ganados": 10, "nominados": 15},
    "nivel_sustos": "moderado"
 }', 'estreno');