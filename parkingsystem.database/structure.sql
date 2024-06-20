-- ParkingSystem database structure
-- @user Reynaldo Vera
-- @version 1.0.0
PRINT 'Empleando base de datos ParkingSystem...';
USE [ParkingSystem];
PRINT 'Encontrado ParkingSystem.';
GO
PRINT 'Creando tablas para ParkingSystem...';
CREATE TABLE [ParkingSystem].[dbo].[Usuario](
	id_usu INT IDENTITY(1,1) NOT NULL,
	nombre_usu VARCHAR(50) NOT NULL,
	email_usu VARCHAR(100) NOT NULL,
	contrasenia_usu VARCHAR(100) NOT NULL,
	rol_usu VARCHAR(45) NOT NULL,
	CONSTRAINT pk_id_usu PRIMARY KEY CLUSTERED(id_usu),
	CONSTRAINT u_email_usu UNIQUE NONCLUSTERED(email_usu)
);
GO
CREATE TABLE [ParkingSystem].[dbo].[Cliente](
	id_cli INT IDENTITY(1,1) NOT NULL,
	id_usu_cli INT,
	nombre_cli VARCHAR(75) NOT NULL,
	apellido_cli VARCHAR(125) NOT NULL,
	dni_cli CHAR(8) NOT NULL,
	telefono_cli CHAR(9) NOT NULL,
	direccion_cli VARCHAR(255) NOT NULL,
	CONSTRAINT pk_id_cli PRIMARY KEY CLUSTERED(id_cli),
	CONSTRAINT u_dni_cli UNIQUE NONCLUSTERED(dni_cli),
	CONSTRAINT fk_id_usu_cli FOREIGN KEY(id_usu_cli) REFERENCES [ParkingSystem].[dbo].[Usuario](id_usu) ON DELETE SET NULL ON UPDATE CASCADE
);
GO
CREATE TABLE [ParkingSystem].[dbo].[Automovil](
	id_aut INT IDENTITY(1,1) NOT NULL,
	id_cli_aut INT,
	marca_aut VARCHAR(45) NOT NULL,
	modelo_aut VARCHAR(45) NOT NULL,
	placa_aut VARCHAR(7) NOT NULL,
	CONSTRAINT pk_id_aut PRIMARY KEY CLUSTERED(id_aut),
	CONSTRAINT u_placa_aut UNIQUE NONCLUSTERED(placa_aut),
	CONSTRAINT fk_id_cli_aut FOREIGN KEY(id_cli_aut) REFERENCES [ParkingSystem].[dbo].[Cliente](id_cli) ON DELETE SET NULL ON UPDATE CASCADE
);
GO
CREATE TABLE [ParkingSystem].[dbo].[Estacionamiento](
	id_est INT IDENTITY(1,1) NOT NULL,
	id_cli_est INT,
	id_aut_est INT,
	numero_plaza_est INT NOT NULL,
	fecha_entrada_est DATETIME NOT NULL,
	fecha_salida_est DATETIME NOT NULL,
	estado_est BIT NOT NULL,
	CONSTRAINT pk_id_est PRIMARY KEY CLUSTERED(id_est),
	CONSTRAINT fk_id_cli_est FOREIGN KEY(id_cli_est) REFERENCES [ParkingSystem].[dbo].[Cliente](id_cli) ON DELETE SET NULL ON UPDATE NO ACTION,
	CONSTRAINT fk_id_aut_est FOREIGN KEY(id_aut_est) REFERENCES [ParkingSystem].[dbo].[Automovil](id_aut) ON DELETE SET NULL ON UPDATE NO ACTION
);
PRINT 'Tablas para ParkingSystem creadas correctamente.';
GO
