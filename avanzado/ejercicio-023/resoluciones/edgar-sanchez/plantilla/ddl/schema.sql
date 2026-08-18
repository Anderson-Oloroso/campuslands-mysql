DROP TABLE IF EXISTS revisiones_render;
DROP TABLE IF EXISTS renders_arquitectonicos;
DROP TABLE IF EXISTS proyectos_arquitectura;
DROP TABLE IF EXISTS clientes_estudio;
DROP TABLE IF EXISTS arquitectos_3d;

CREATE TABLE arquitectos_3d (
    arquitecto_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_arquitecto VARCHAR(100) NOT NULL,
    especialidad VARCHAR(50) NOT NULL,
    correo VARCHAR(100) NOT NULL UNIQUE,
    nivel_acceso VARCHAR(30) NOT NULL DEFAULT 'Junior' CONSTRAINT chk_nivel_acceso CHECK (nivel_acceso IN ('Junior', 'Senior', 'Director'))
);

CREATE TABLE clientes_estudio (
    cliente_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_empresa VARCHAR(100) NOT NULL,
    contacto_principal VARCHAR(100) NOT NULL,
    correo VARCHAR(100) NOT NULL UNIQUE,
    telefono VARCHAR(20) NOT NULL
);

CREATE TABLE proyectos_arquitectura (
    proyecto_id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT NOT NULL,
    arquitecto_lider_id INT NOT NULL,
    nombre_proyecto VARCHAR(120) NOT NULL,
    tipo_edificacion VARCHAR(50) NOT NULL,
    presupuesto_usd DECIMAL(12,2) NOT NULL CONSTRAINT chk_presupuesto CHECK (presupuesto_usd > 0.00),
    estado_proyecto VARCHAR(30) NOT NULL DEFAULT 'En Diseño' CONSTRAINT chk_estado_arq CHECK (estado_proyecto IN ('En Diseño', 'En Renderizado', 'En Revision', 'Aprobado', 'Cancelado')),
    CONSTRAINT fk_proyectos_clientes 
        FOREIGN KEY (cliente_id) REFERENCES clientes_estudio(cliente_id) 
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_proyectos_arquitectos 
        FOREIGN KEY (arquitecto_lider_id) REFERENCES arquitectos_3d(arquitecto_id) 
        ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE renders_arquitectonicos (
    render_id INT AUTO_INCREMENT PRIMARY KEY,
    proyecto_id INT NOT NULL,
    titulo_vista VARCHAR(100) NOT NULL,
    tipo_vista VARCHAR(50) NOT NULL CONSTRAINT chk_tipo_vista CHECK (tipo_vista IN ('Exterior', 'Interior', 'Planta 3D', 'Recorrido Virtual')),
    motor_render VARCHAR(50) NOT NULL,
    resolucion VARCHAR(20) NOT NULL DEFAULT '3840x2160',
    tiempo_render_minutos INT NOT NULL CONSTRAINT chk_tiempo_render_arq CHECK (tiempo_render_minutos > 0),
    CONSTRAINT fk_renders_proyectos 
        FOREIGN KEY (proyecto_id) REFERENCES proyectos_arquitectura(proyecto_id) 
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE revisiones_render (
    revision_id INT AUTO_INCREMENT PRIMARY KEY,
    render_id INT NOT NULL,
    fecha_revision DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    observaciones TEXT NOT NULL,
    aprobado BOOLEAN NOT NULL DEFAULT FALSE,
    CONSTRAINT fk_revisiones_renders 
        FOREIGN KEY (render_id) REFERENCES renders_arquitectonicos(render_id) 
        ON DELETE CASCADE ON UPDATE CASCADE
);