create	database ProyectoFinalDB;

 Use ProyectoFinalDB;
  
 #Crear tabla persona con relación 1:1 a su Cédula
 CREATE TABLE personas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    cedula VARCHAR(20) UNIQUE NOT NULL
);

# Insertar datos en la tabla persona
INSERT INTO personas (nombre, cedula) VALUES
('Juan Pérez', '001-1234567-8'),
('María Gómez', '002-7654321-9');

#Realizar consultar de datos para buscar persona por cedula
SELECT * FROM personas WHERE cedula = '001-1234567-8';

#Realizar  una actualizacion 
UPDATE personas
SET nombre = 'Juan Rincón', cedula = '002-0134443-9'
WHERE id = 1;
#realizar un select de la actualizacion 
SELECT * FROM personas WHERE id = 1;

#Realizar otro insert
INSERT INTO personas (nombre, cedula) VALUES
('Juan Pérez', '042-1234567-8'),
('Ana Gómez', '001-7654321-9');

#realizar todo
SELECT * FROM personas;

#realizar un delete
DELETE FROM personas
WHERE id = 1;

DELETE FROM personas
WHERE cedula = '042-1234567-8';
 

#Crear tablas Cliente y sus Pedidos (1:N)
CREATE TABLE clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE pedidos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT NOT NULL,
    fecha DATE NOT NULL,
    total DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES clientes(id) ON DELETE CASCADE
);

# Insertar datos en las tablas Cliente y sus Pedidos 
INSERT INTO clientes (nombre, email) VALUES
('Juan Pérez', 'juan.perez@example.com'),
('María Gómez', 'maria.gomez@example.com');

INSERT INTO pedidos (cliente_id, fecha, total) VALUES
(1, '2025-05-04', 150.00),
(1, '2025-05-05', 200.00),
(2, '2025-05-06', 300.00);

#Realizar consultar de datos para buscar infotmacion de las tablas Cliente y sus Pedidos 
SELECT c.id AS cliente_id, c.nombre, p.id AS pedido_id, p.fecha, p.total
FROM clientes c
LEFT JOIN pedidos p ON c.id = p.cliente_id;

SELECT p.id AS pedido_id, p.fecha, p.total
FROM pedidos p
WHERE p.cliente_id = 1;

#Realizar una actualizacion 
UPDATE pedidos
SET fecha = '2025-05-3', total = 250.00
WHERE id = 1;
#realizar un select de la actualizacion 
SELECT * FROM pedidos WHERE id = 1;


#Crear tablas Estudiantes y sus Cursos (N:M)
CREATE TABLE estudiantes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE cursos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT
);

CREATE TABLE estudiantes_cursos (
    estudiante_id INT NOT NULL,
    curso_id INT NOT NULL,
    fecha_inscripcion DATE NOT NULL,
    PRIMARY KEY (estudiante_id, curso_id),
    FOREIGN KEY (estudiante_id) REFERENCES estudiantes(id) ON DELETE CASCADE,
    FOREIGN KEY (curso_id) REFERENCES cursos(id) ON DELETE CASCADE
);

#Insertar datos en las tablas Estudiantes y sus Cursos (N:M)
INSERT INTO estudiantes (nombre, email) VALUES
('Juan Pérez', 'juan.perez@example.com'),
('María Gómez', 'maria.gomez@example.com');

INSERT INTO cursos (nombre, descripcion) VALUES
('Matemáticas', 'Curso de matemáticas avanzadas'),
('Historia', 'Curso de historia universal');

INSERT INTO estudiantes_cursos (estudiante_id, curso_id, fecha_inscripcion) VALUES
(1, 1, '2025-05-04'),
(1, 2, '2025-05-05'),
(2, 1, '2025-05-06');

#Consultar datos
#Estudiantes con sus cursos
SELECT e.nombre AS estudiante, c.nombre AS curso, ec.fecha_inscripcion
FROM estudiantes e
JOIN estudiantes_cursos ec ON e.id = ec.estudiante_id
JOIN cursos c ON c.id = ec.curso_id;

#Cursos de un estudiante específico
SELECT c.nombre AS curso, ec.fecha_inscripcion
FROM cursos c
JOIN estudiantes_cursos ec ON c.id = ec.curso_id
WHERE ec.estudiante_id = 1;

#Estudiantes inscritos en un curso específico
SELECT e.nombre AS estudiante, ec.fecha_inscripcion
FROM estudiantes e
JOIN estudiantes_cursos ec ON e.id = ec.estudiante_id
WHERE ec.curso_id = 1;

#Empleado y su Jefe (auto-referencia)
#Crear tabla Empleado con auto-referencia a su Jefe 
CREATE TABLE empleados (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    puesto VARCHAR(100),
    jefe_id INT DEFAULT NULL,
    FOREIGN KEY (jefe_id) REFERENCES empleados(id) ON DELETE SET NULL
);

#insertar datos en Empleados sin Jefe
INSERT INTO empleados (nombre, puesto) VALUES
('Juan Pérez', 'Gerente General'),
('María Gómez', 'Directora de Finanzas');

#insertar datos en Empleados con Jefe
INSERT INTO empleados (nombre, puesto, jefe_id) VALUES
('Carlos López', 'Analista Financiero', 2), -- Jefe: María Gómez
('Ana Torres', 'Asistente Administrativa', 1); -- Jefe: Juan Pérez

#Consulta de datos
#Empleados de un jefe en especifico 
SELECT e.id AS empleado_id, e.nombre AS empleado, e.puesto AS puesto_empleado
FROM empleados e
WHERE e.jefe_id = 1; -- Jefe: Juan Pérez

#Empleados con sus jefes
SELECT e.id AS empleado_id, e.nombre AS empleado, e.puesto AS puesto_empleado,
       j.id AS jefe_id, j.nombre AS jefe, j.puesto AS puesto_jefe
FROM empleados e
LEFT JOIN empleados j ON e.jefe_id = j.id;






