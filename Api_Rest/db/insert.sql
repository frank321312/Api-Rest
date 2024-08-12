INSERT INTO Rol (nombre) VALUES
    ("Administrador"),
    ("Cliente"),
    ("Programador backend"),
    ("Programador frontend"),
    ("Diseñador web");

INSERT INTO Ticket (nombre, fechaCreacion, fechaFinal, descripcion) VALUES 
    ("Diseño UI", NOW(), NULL, "Hacer el diseño para el usuario"),
    ("Desarrollo de servidor", NOW(), NULL, "Hacer el servidor en base a los requerimientos"),
    ("Desarrollo de frontend", NOW(), NULL, "Pasar a codigo el diseño UI");

INSERT INTO Usuario (nombre, contrasena, idRol) VALUES 
    ("Pepito", "contraseña", 1),
    ("Javo", "123456", 2),
    ("Maria", "abcdef", 3),
    ("Pedro", "pedro123", 4),
    ("Carlos", "carlos_123", 5);

INSERT INTO Proyecto (nombre, idUsuario, idTicket, fechaCreacion, fechaFinal)
VALUES ("Watchmen", NULL, NULL, NOW(), NULL);
