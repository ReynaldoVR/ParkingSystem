-- ParkingSystem database interactive procedures
-- @user Reynaldo Vera
-- @version 1.0.0
USE [ParkingSystem];
GO
CREATE PROCEDURE [dbo].[CRUDUsuario](
	@field1 INT,
	@field2 VARCHAR(50),
	@field3 VARCHAR(100),
	@field4 VARCHAR(100),
	@field5 VARCHAR(45),
	@textsearch VARCHAR(75),
	@parameter CHAR(1)
) WITH EXECUTE AS CALLER AS
	BEGIN TRY
		BEGIN TRANSACTION
			IF(@parameter='C') BEGIN
				INSERT INTO [ParkingSystem].[dbo].[Usuario] VALUES(@field2, @field3, @field4, @field5);
			END
			ELSE IF(@parameter='R') BEGIN
				SELECT * FROM [ParkingSystem].[dbo].[Usuario] WHERE
					[ParkingSystem].[dbo].[Usuario].[rol_usu] LIKE CONCAT('%',@textsearch,'%') OR
					[ParkingSystem].[dbo].[Usuario].[email_usu] LIKE CONCAT('%',@textsearch,'%');
			END
			ELSE IF(@parameter='U') BEGIN
				UPDATE [ParkingSystem].[dbo].[Usuario] SET
					[ParkingSystem].[dbo].[Usuario].[nombre_usu]=@field2,
					[ParkingSystem].[dbo].[Usuario].[email_usu]=@field3,
					[ParkingSystem].[dbo].[Usuario].[contrasenia_usu]=@field4,
					[ParkingSystem].[dbo].[Usuario].[rol_usu]=@field5 WHERE
					[ParkingSystem].[dbo].[Usuario].[id_usu]=@field1;
			END
			ELSE IF(@parameter='D') BEGIN
				DELETE FROM [ParkingSystem].[dbo].[Usuario] WHERE [ParkingSystem].[dbo].[Usuario].[id_usu]=@field1;
			END
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		IF(@@TRANCOUNT > 0) BEGIN
			ROLLBACK TRANSACTION
			DECLARE @ERROR_MESSAGE NVARCHAR(4000),@ERROR_SEVERITY INT;
			SELECT @ERROR_MESSAGE=ERROR_MESSAGE(),@ERROR_SEVERITY=ERROR_SEVERITY();
			RAISERROR(@ERROR_MESSAGE,@ERROR_SEVERITY,1);
		END
	END CATCH
GO
CREATE PROCEDURE [dbo].[CRUDCliente](
	@field1 INT,
	@field2 INT,
	@field3 VARCHAR(75),
	@field4 VARCHAR(125),
	@field5 CHAR(8),
	@field6 CHAR(9),
	@field7 VARCHAR(255),
	@textsearch VARCHAR(125),
	@parameter CHAR(1)
) WITH EXECUTE AS CALLER AS
	BEGIN TRY
		BEGIN TRANSACTION
			IF(@parameter='C') BEGIN
				INSERT INTO [ParkingSystem].[dbo].[Cliente] VALUES(@field2, @field3, @field4, @field5, @field6, @field7);
			END
			ELSE IF(@parameter='R') BEGIN
				SELECT * FROM [ParkingSystem].[dbo].[Cliente] WHERE
					([ParkingSystem].[dbo].[Cliente].[nombre_cli] + ' ' + [ParkingSystem].[dbo].[Cliente].[apellido_cli]) LIKE CONCAT('%',@textsearch,'%') OR
					[ParkingSystem].[dbo].[Cliente].[dni_cli] LIKE CONCAT('%',@textsearch,'%');
			END
			ELSE IF(@parameter='U') BEGIN
				UPDATE [ParkingSystem].[dbo].[Cliente] SET
					[ParkingSystem].[dbo].[Cliente].[id_usu_cli]=@field2,
					[ParkingSystem].[dbo].[Cliente].[nombre_cli]=@field3,
					[ParkingSystem].[dbo].[Cliente].[apellido_cli]=@field4,
					[ParkingSystem].[dbo].[Cliente].[dni_cli]=@field5,
					[ParkingSystem].[dbo].[Cliente].[telefono_cli]=@field6,
					[ParkingSystem].[dbo].[Cliente].[direccion_cli]=@field7 WHERE
					[ParkingSystem].[dbo].[Cliente].[id_cli]=@field1;
			END
			ELSE IF(@parameter='D') BEGIN
				DELETE FROM [ParkingSystem].[dbo].[Cliente] WHERE [ParkingSystem].[dbo].[Cliente].[id_cli]=@field1;
			END
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		IF(@@TRANCOUNT > 0) BEGIN
			ROLLBACK TRANSACTION
			DECLARE @ERROR_MESSAGE NVARCHAR(4000),@ERROR_SEVERITY INT;
			SELECT @ERROR_MESSAGE=ERROR_MESSAGE(),@ERROR_SEVERITY=ERROR_SEVERITY();
			RAISERROR(@ERROR_MESSAGE,@ERROR_SEVERITY,1);
		END
	END CATCH
GO
CREATE PROCEDURE [dbo].[CRUDAutomovil](
	@field1 INT,
	@field2 INT,
	@field3 VARCHAR(45),
	@field4 VARCHAR(45),
	@field5 VARCHAR(7),
	@textsearch VARCHAR(45),
	@parameter CHAR(1)
) WITH EXECUTE AS CALLER AS
	BEGIN TRY
		BEGIN TRANSACTION
			IF(@parameter='C') BEGIN
				INSERT INTO [ParkingSystem].[dbo].[Automovil] VALUES(@field2, @field3, @field4, @field5);
			END
			ELSE IF(@parameter='R') BEGIN
				SELECT * FROM [ParkingSystem].[dbo].[Automovil] WHERE
					CAST([ParkingSystem].[dbo].[Automovil].[id_cli_aut] AS VARCHAR(45)) LIKE CONCAT('%',@textsearch,'%') OR
					[ParkingSystem].[dbo].[Automovil].[placa_aut] LIKE CONCAT('%',@textsearch,'%');
			END
			ELSE IF(@parameter='U') BEGIN
				UPDATE [ParkingSystem].[dbo].[Automovil] SET
					[ParkingSystem].[dbo].[Automovil].[id_cli_aut]=@field2,
					[ParkingSystem].[dbo].[Automovil].[marca_aut]=@field3,
					[ParkingSystem].[dbo].[Automovil].[modelo_aut]=@field4,
					[ParkingSystem].[dbo].[Automovil].[placa_aut]=@field5 WHERE
					[ParkingSystem].[dbo].[Automovil].[id_aut]=@field1;
			END
			ELSE IF(@parameter='D') BEGIN
				DELETE FROM [ParkingSystem].[dbo].[Automovil] WHERE [ParkingSystem].[dbo].[Automovil].[id_aut]=@field1;
			END
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		IF(@@TRANCOUNT > 0) BEGIN
			ROLLBACK TRANSACTION
			DECLARE @ERROR_MESSAGE NVARCHAR(4000),@ERROR_SEVERITY INT;
			SELECT @ERROR_MESSAGE=ERROR_MESSAGE(),@ERROR_SEVERITY=ERROR_SEVERITY();
			RAISERROR(@ERROR_MESSAGE,@ERROR_SEVERITY,1);
		END
	END CATCH
GO
CREATE PROCEDURE [dbo].[CRUDEstacionamiento](
	@field1 INT,
	@field2 INT,
	@field3 INT,
	@field4 INT,
	@field5 DATETIME,
	@field6 DATETIME,
	@field7 BIT,
	@textsearch VARCHAR(25),
	@parameter CHAR(1)
) WITH EXECUTE AS CALLER AS
	BEGIN TRY
		BEGIN TRANSACTION
			IF(@parameter='C') BEGIN
				INSERT INTO [ParkingSystem].[dbo].[Estacionamiento] VALUES(@field2, @field3, @field4, @field5, @field6, @field7);
			END
			ELSE IF(@parameter='R') BEGIN
				SELECT * FROM [ParkingSystem].[dbo].[Estacionamiento] WHERE
					CAST([ParkingSystem].[dbo].[Estacionamiento].[id_aut_est] AS VARCHAR(25)) LIKE CONCAT('%',@textsearch,'%') OR
					CAST([ParkingSystem].[dbo].[Estacionamiento].[numero_plaza_est] AS VARCHAR(25)) LIKE CONCAT('%',@textsearch,'%');
			END
			ELSE IF(@parameter='U') BEGIN
				UPDATE [ParkingSystem].[dbo].[Estacionamiento] SET
					[ParkingSystem].[dbo].[Estacionamiento].[id_cli_est]=@field2,
					[ParkingSystem].[dbo].[Estacionamiento].[id_aut_est]=@field3,
					[ParkingSystem].[dbo].[Estacionamiento].[numero_plaza_est]=@field4,
					[ParkingSystem].[dbo].[Estacionamiento].[fecha_entrada_est]=@field5,
					[ParkingSystem].[dbo].[Estacionamiento].[fecha_salida_est]=@field6,
					[ParkingSystem].[dbo].[Estacionamiento].[estado_est]=@field7 WHERE
					[ParkingSystem].[dbo].[Estacionamiento].[id_est]=@field1;
			END
			ELSE IF(@parameter='D') BEGIN
				DELETE FROM [ParkingSystem].[dbo].[Estacionamiento] WHERE [ParkingSystem].[dbo].[Estacionamiento].[id_est]=@field1;
			END
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		IF(@@TRANCOUNT > 0) BEGIN
			ROLLBACK TRANSACTION
			DECLARE @ERROR_MESSAGE NVARCHAR(4000),@ERROR_SEVERITY INT;
			SELECT @ERROR_MESSAGE=ERROR_MESSAGE(),@ERROR_SEVERITY=ERROR_SEVERITY();
			RAISERROR(@ERROR_MESSAGE,@ERROR_SEVERITY,1);
		END
	END CATCH
GO
