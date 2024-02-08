/* Relación tipo 1:1 */
-- PASO 1
CREATE TABLE usuarios_2(
	id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR (50) NOT NULL,
    apellido VARCHAR (100) NOT NULL,
    email VARCHAR (100) NOT NULL,
    edad INT
    );
INSERT INTO usuarios_2 (nombre, apellido, email, edad) VALUES
('Juan', 'Gomez', 'juan.gomez@example.com', 28),
('Maria', 'Lopez', 'maria.lopez@example.com', 32),
('Carlos', 'Rodriguez', 'carlos.rodriguez@example.com', 25),
('Laura', 'Fernandez', 'laura.fernandez@example.com', 30),
('Pedro', 'Martinez', 'pedro.martinez@example.com', 22),
('Ana', 'Hernandez', 'ana.hernandez@example.com', 35),
('Miguel', 'Perez', 'miguel.perez@example.com', 28),
('Sofia', 'Garcia', 'sofia.garcia@example.com', 26),
('Javier', 'Diaz', 'javier.diaz@example.com', 31),
('Luis', 'Sanchez', 'luis.sanchez@example.com', 27),
('Elena', 'Moreno', 'elena.moreno@example.com', 29),
('Daniel', 'Romero', 'daniel.romero@example.com', 33),
('Paula', 'Torres', 'paula.torres@example.com', 24),
('Alejandro', 'Ruiz', 'alejandro.ruiz@example.com', 28),
('Carmen', 'Vega', 'carmen.vega@example.com', 29),
('Adrian', 'Molina', 'adrian.molina@example.com', 34),
('Isabel', 'Gutierrez', 'isabel.gutierrez@example.com', 26),
('Hector', 'Ortega', 'hector.ortega@example.com', 30),
('Raquel', 'Serrano', 'raquel.serrano@example.com', 32),
('Alberto', 'Reyes', 'alberto.reyes@example.com', 28);



-- PASO 2
CREATE TABLE roles (
	id_rol INT AUTO_INCREMENT PRIMARY KEY,
    nombre_rol VARCHAR (50) NOT NULL
);

INSERT INTO roles (nombre_rol) VALUES
('Bronce'),
('Plata'),
('Oro'),
('Platino');



-- PASO 3
ALTER TABLE usuarios_2 ADD COLUMN id_rol INT;

ALTER TABLE usuarios_2 ADD FOREIGN KEY (id_rol) REFERENCES roles(id_rol);


-- PASO 4
SELECT usuarios.id,usuarios.nombre,usuarios.apellido,usuarios.email,usuarios.edad 
FROM usuarios 
INNER JOIN roles ON roles.nombre_rol;


/* Relación tipo 1:N */
-- PASO 1
CREATE TABLE categorias(
	id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nombre_categoria VARCHAR(100) NOT NULL
);

INSERT INTO categorias (nombre_categoria) VALUES
('Electronicos'),
('Ropa y Accesorios'),
('Libros'),
('Hogar y Cocina'),
('Deportes y aire libre'),
('Salud y cuidado personal'),
('Herramientas y mejoras para el hogar'),
('Juguetes y juegos'),
('Automotriz'),
('Música y Películas');


-- PASO 2
ALTER TABLE usuarios ADD COLUMN id_categoria INT;



-- PASO 3
UPDATE usuarios SET id_categoria = 1 WHERE id IN (1, 5, 9, 13, 17);



-- PASO 4
SELECT usuarios.id,usuarios.nombre,usuarios.apellido,usuarios.email,usuarios.edad
FROM usuarios
JOIN roles ON roles.nombre_rol
JOIN categorias ON categorias.nombre_categoria;

/* Relación tipo N:M */
-- PASO 1
CREATE TABLE usuarios_categorias (
	id_usuario_categoria INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    id_categoria INT,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id),
	FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria)



-- PASO 2
INSERT INTO usuarios_categorias (id_usuario, id_categoria) VALUES
(1, 1), (1, 2), (1, 3),
(2, 4), (2, 5),
(3, 6), (3, 7),
(4, 8), (4, 9), (4, 10);



-- PASO 3
SELECT usuarios.id,usuarios.nombre,usuarios.apellido,usuarios.email,usuarios.edad,roles.nombre_rol,categorias.nombre_categoria
FROM usuarios
JOIN roles ON usuarios.id_rol = roles.id_rol
JOIN categorias ON usuarios.id_categoria = categorias.id_categoria;
