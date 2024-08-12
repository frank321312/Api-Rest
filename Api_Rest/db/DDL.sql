DROP DATABASE IF EXISTS gestionProyectos;
CREATE DATABASE gestionProyectos;
USE gestionProyectos;

CREATE TABLE Rol (
    nombre VARCHAR(45) NOT NULL,
    idRol INTEGER AUTO_INCREMENT PRIMARY KEY
);

CREATE TABLE Usuario (
    nombre VARCHAR(45) NOT NULL,
    contrasena VARCHAR(45) NOT NULL,
    idRol INTEGER,
    idUsuario INTEGER AUTO_INCREMENT PRIMARY KEY,
    CONSTRAINT FK_usuario_rol FOREIGN KEY (idRol)
    REFERENCES Rol (idRol)
);

CREATE TABLE Ticket (
    nombre VARCHAR(45) NOT NULL,
    fechaCreacion DATETIME NOT NULL,
    fechaFinal DATETIME,
    descripcion VARCHAR(200) NOT NULL,
    idUsuario INTEGER,
    idTicket INTEGER AUTO_INCREMENT PRIMARY KEY,
    CONSTRAINT FK_ticket_usuario FOREIGN KEY (idUsuario)
    REFERENCES Usuario (idUsuario)
);

CREATE TABLE Proyecto (
    nombre VARCHAR(45) NOT NULL,
    idProyecto INTEGER AUTO_INCREMENT PRIMARY KEY,
    idUsuario INTEGER,
    idTicket INTEGER,
    fechaCreacion DATETIME NOT NULL,
    fechaFinal DATETIME,
    CONSTRAINT FK_proyecto_usuario FOREIGN KEY (idUsuario)
    REFERENCES Usuario (idUsuario),
    CONSTRAINT FK_proyecto_ticket FOREIGN KEY (idTicket)
    REFERENCES Ticket (idTicket)
);

CREATE TABLE ProyectoUsuario (
    idUsuario INTEGER NOT NULL,
    idProyecto INTEGER NOT NULL,
    CONSTRAINT FK_proyectoUsuario_usuario PRIMARY KEY (idUsuario, idProyecto),
    CONSTRAINT FK_usuario FOREIGN KEY (idUsuario)
    REFERENCES Usuario (idUsuario),
    CONSTRAINT FK_proyectoUsuario_proyecto FOREIGN KEY (idProyecto)
    REFERENCES Proyecto (idProyecto)
);