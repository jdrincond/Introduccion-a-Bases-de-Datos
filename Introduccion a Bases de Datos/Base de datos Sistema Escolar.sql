create database SistemaEscolar;

use SistemaEscolar;

create table Direcciones(
	IdDirecciones int primary key auto_increment,
	Direccion varchar(200)
);

create table Cursos(
	IdCurso int primary key auto_increment,
	Curso varchar(100) not null
);

create table Departamento(
IdDepartamento int primary key auto_increment,
Departamento varchar(100) not null,
Encargado varchar(200)
);

create table Matricula(
idMatriculas int primary key auto_increment,
Fecha_Pago date not null,
Monto float not null,
Estado char(1)
);

create table Estudiantes(
	Matricula int primary key auto_increment, 
	Nombre varchar(100) not null,
	Apellidos varchar(100) not null,
	Fecha_Nacimiento date not null,
	Sexo char(1) not null,
	Direccion varchar(200) not null,
	Fecha_Ingreso date not null,
	Telefono varchar(100),
	Correo varchar(150),
	Curso varchar(100),
	idCurso int,
	idMatriculas int,
	IdDirecciones int,
    foreign	key (idCurso) references Cursos(idCurso),
    foreign key (idMatriculas) references Matricula(idMatriculas),
    foreign key (IdDirecciones) references Direcciones (IdDirecciones)
);

create table Profesores(
	ID_Profesor int primary key auto_increment, 
	Nombre varchar(100) not null,
	Apellidos varchar(100) not null,
	Fecha_Nacimiento date,
	Sexo char(1),
	Direccion varchar(200) not null,
	Fecha_Ingreso date,
	Telefono varchar(100),
	Correo varchar(150),
	Carrera varchar(200),
	Materia varchar(100),
	IdDepartamento int,
	IdDirecciones int,
    foreign key (IdDepartamento) references Departamento(IdDepartamento),
    foreign key (IdDirecciones) references Direcciones(IdDirecciones)    
);
