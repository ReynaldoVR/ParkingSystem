-- ParkingSystem database test registers
-- @user Reynaldo Vera
-- @version 1.0.0
USE [ParkingSystem];
GO
EXECUTE [dbo].[CRUDUsuario] NULL, 'usuario1', 'usuario1@example.com', 'password1', 'user', '', 'C';
EXECUTE [dbo].[CRUDUsuario] NULL, 'Usuario2', 'usuario2@example.com', 'password2', 'user', '', 'C';
EXECUTE [dbo].[CRUDUsuario] NULL, 'Usuario3', 'usuario3@example.com', 'password3', 'user', '', 'C';
GO
EXECUTE [dbo].[CRUDCliente] NULL, 1, 'Cliente1', 'Apellido1', '12345678', '987654321', 'Dirección 1', '', 'C';
EXECUTE [dbo].[CRUDCliente] NULL, 2, 'Cliente2', 'Apellido2', '87654321', '123456789', 'Dirección 2', '', 'C';
EXECUTE [dbo].[CRUDCliente] NULL, 3, 'Cliente3', 'Apellido3', '45678901', '567890123', 'Dirección 3', '', 'C';
GO
EXECUTE [dbo].[CRUDAutomovil] NULL, 1, 'Marca1', 'Modelo1', 'ABC-123', '', 'C';
EXECUTE [dbo].[CRUDAutomovil] NULL, 2, 'Marca2', 'Modelo2', 'XYZ-789', '', 'C';
EXECUTE [dbo].[CRUDAutomovil] NULL, 3, 'Marca3', 'Modelo3', 'DEF-456', '', 'C';
GO
DECLARE @fechaEntrada DATETIME = GETDATE();
DECLARE @fechaSalida DATETIME = DATEADD(HOUR, 2, GETDATE());
EXECUTE [dbo].[CRUDEstacionamiento] NULL, 1, 1, 1, @fechaEntrada, @fechaSalida, 1, '', 'C';
EXECUTE [dbo].[CRUDEstacionamiento] NULL, 2, 2, 2, @fechaEntrada, @fechaSalida, 1, '', 'C';
EXECUTE [dbo].[CRUDEstacionamiento] NULL, 3, 3, 3, @fechaEntrada, @fechaSalida, 1, '', 'C';
GO
