/*
=============================================================
Create Database and Schemas
=============================================================
Script Purpose:
    This script creates a new database named 'Corporate_ESG' after checking if it already exists. 
    If the database exists, it is dropped and recreated. Additionally, the script sets up three schemas 
    within the database: 'bronze', 'silver', and 'gold'.
	
WARNING:
    Running this script will drop the entire 'Corporate_ESG' database if it exists. 
    All data in the database will be permanently deleted. Proceed with caution 
    and ensure you have proper backups before running this script.
*/
USE master;
GO

-- Drop and recreate the 'Corporate_ESG' database
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'Corporate_ESG')
BEGIN
    ALTER DATABASE Corporate_ESG SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE Corporate_ESG;
END;
GO

-- Create the 'Corporate_ESG' database
CREATE DATABASE Corporate_ESG;
GO

USE Corporate_ESG;
GO

-- Create Schemas
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO
