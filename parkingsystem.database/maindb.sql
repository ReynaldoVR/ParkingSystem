-- ParkingSystem database local creation
-- @user Reynaldo Vera
-- @version 1.0.0
USE master;
GO
IF DB_ID('ParkingSystem') IS NOT NULL BEGIN
	PRINT 'Eliminando base de datos ParkingSystem...';
	DROP DATABASE [ParkingSystem];
	PRINT 'Base de datos ParkingSystem eliminada.';
END
ELSE BEGIN
	PRINT 'Creando base de datos ParkingSystem...';
	CREATE DATABASE [ParkingSystem] CONTAINMENT=NONE ON PRIMARY(
		NAME='ParkingSystem',
		FILENAME='C:\Users\Lenovo\Sources\Repositories\ParkingSystem\parkingsystem.database\parkingsystem.mdf',
		SIZE=10MB,
		MAXSIZE=2GB,
		FILEGROWTH=10%
	) LOG ON(
		NAME='ParkingSystemLog',
		FILENAME='C:\Users\Lenovo\Sources\Repositories\ParkingSystem\parkingsystem.database\parkingsystem.ldf',
		SIZE=5MB,
		MAXSIZE=1GB,
		FILEGROWTH=10%
	) COLLATE SQL_Latin1_General_CP1_CI_AS;
	PRINT 'Base de datos ParkingSystem creada.';
END
GO
