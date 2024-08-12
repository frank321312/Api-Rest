DELIMITER $$
CREATE PROCEDURE altaRol(
    IN unNombre VARCHAR(45)
)
BEGIN
    INSERT INTO Rol (nombre)
    VALUES (unNombre);
END
$$

DELIMITER $$
CREATE PROCEDURE altaUsuario(
    IN unNombre VARCHAR(45),
    IN unContrasena VARCHAR(45)
)
BEGIN
    INSERT INTO Usuario (nombre, contrasena, idRol)
    VALUES (unNombre, unContrasena, NULL);
END
$$

DELIMITER $$
CREATE PROCEDURE altaTicket(
    IN unNombre VARCHAR(45),
    IN unFechaCreacion DATETIME,
    IN unDescripcion VARCHAR(200)
)
BEGIN
    INSERT INTO Ticket (nombre, fechaCreacion, fechaFinal, descripcion, idUsuario)
    VALUES (unNombre, NOW(), NULL, unDescripcion, NULL);
END
$$

DELIMITER $$
CREATE PROCEDURE altaProyecto(
    IN unNombre VARCHAR(45),
    IN unFechaCreacion DATETIME
)
BEGIN
    INSERT INTO Proyecto (nombre, idUsuario, idTicket, fechaCreacion, fechaFinal)
    VALUES (unNombre, NULL, NULL, NOW(), NULL);
END
$$
