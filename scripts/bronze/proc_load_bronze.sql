/*
===============================================================================
Stored Procedure: Load Bronze Layer (Source -> Bronze)
===============================================================================
Script Purpose:
    This stored procedure loads data into the 'bronze' schema from external CSV files. 
    It performs the following actions:
    - Truncates the bronze tables before loading data.
    - Uses the `BULK INSERT` command to load data from csv Files to bronze tables.

Parameters:
    None. 
	  This stored procedure does not accept any parameters or return any values.

Usage Example:
    EXEC bronze.load_bronze;
===============================================================================
*/
CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
	DECLARE @start_time DATETIME, @end_time DATETIME, @batch_start_time DATETIME, @batch_end_time DATETIME;
	BEGIN TRY
		SET @batch_start_time = GETDATE();
		PRINT '=====================================';
		PRINT 'Loading Bronze Layer';
		PRINT '=====================================';

		PRINT '-------------------------------------';
		PRINT 'Loading CRM Tables';
		PRINT '-------------------------------------';

		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: bronze.crm_bp_supplier_master'; 
		TRUNCATE TABLE bronze.crm_bp_supplier_master;

		PRINT '>> Inserting Data Into: bronze.crm_bp_supplier_master';
		BULK INSERT bronze.crm_bp_supplier_master
		FROM 'C:\Users\HP\Desktop\SQL\corporate-carbon-esg-intelligence\datasets\source_crm\bp_supplier_master.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			ROWTERMINATOR = '0x0a',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST (DATEDIFF (second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '------------------';

		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: bronze.crm_facility_locations';
		TRUNCATE TABLE bronze.crm_facility_locations;

		PRINT '>> Inserting Data Into: bronze.crm_facility_locations';
		BULK INSERT bronze.crm_facility_locations
		FROM 'C:\Users\HP\Desktop\SQL\corporate-carbon-esg-intelligence\datasets\source_crm\facility_locations.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			ROWTERMINATOR = '0x0a',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST (DATEDIFF (second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '------------------';

		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: bronze.crm_hcm_employeeroster';
		TRUNCATE TABLE bronze.crm_hcm_employeeroster;

		PRINT '>> Inserting Data Into: bronze.crm_hcm_employeeroster';
		BULK INSERT bronze.crm_hcm_employeeroster
		FROM 'C:\Users\HP\Desktop\SQL\corporate-carbon-esg-intelligence\datasets\source_crm\hcm_employeeroster.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			ROWTERMINATOR = '0x0a',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST (DATEDIFF (second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '------------------';

		PRINT '-------------------------------------';
		PRINT 'Loading ERP Tables';
		PRINT '-------------------------------------';

		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: bronze.erp_ehs_waste_register';
		TRUNCATE TABLE bronze.erp_ehs_waste_register;

		PRINT '>> Inserting Data Into: bronze.erp_ehs_waste_register';
		BULK INSERT bronze.erp_ehs_waste_register
		FROM 'C:\Users\HP\Desktop\SQL\corporate-carbon-esg-intelligence\datasets\source_erp\ehs_waste_register.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			ROWTERMINATOR = '0x0a',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST (DATEDIFF (second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '------------------';

		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: bronze.erp_fi_gl_monthly_actuals';
		TRUNCATE TABLE bronze.erp_fi_gl_monthly_actuals;

		PRINT '>> Inserting Data Into: bronze.erp_fi_gl_monthly_actuals';
		BULK INSERT bronze.erp_fi_gl_monthly_actuals
		FROM 'C:\Users\HP\Desktop\SQL\corporate-carbon-esg-intelligence\datasets\source_erp\fi_gl_monthly_actuals.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			ROWTERMINATOR = '0x0a',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST (DATEDIFF (second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '------------------';

		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: bronze.erp_fuel_txn_export';
		TRUNCATE TABLE bronze.erp_fuel_txn_export;

		PRINT '>> Inserting Data Into: bronze.erp_fuel_txn_export';
		BULK INSERT bronze.erp_fuel_txn_export
		FROM 'C:\Users\HP\Desktop\SQL\corporate-carbon-esg-intelligence\datasets\source_erp\fuel_txn_export.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			ROWTERMINATOR = '0x0a',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST (DATEDIFF (second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '------------------';

		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: bronze.erp_hr_commute_survey';
		TRUNCATE TABLE bronze.erp_hr_commute_survey;

		PRINT '>> Inserting Data Into: bronze.erp_hr_commute_survey';
		BULK INSERT bronze.erp_hr_commute_survey
		FROM 'C:\Users\HP\Desktop\SQL\corporate-carbon-esg-intelligence\datasets\source_erp\hr_commute_survey.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			ROWTERMINATOR = '0x0a',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST (DATEDIFF (second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '------------------';

		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: bronze.erp_mm_po_history';
		TRUNCATE TABLE bronze.erp_mm_po_history;

		PRINT '>> Inserting Data Into: bronze.erp_mm_po_history';
		BULK INSERT bronze.erp_mm_po_history
		FROM 'C:\Users\HP\Desktop\SQL\corporate-carbon-esg-intelligence\datasets\source_erp\mm_po_history.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			ROWTERMINATOR = '0x0a',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST (DATEDIFF (second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '------------------';

		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: bronze.erp_tms_shipment_fact';
		TRUNCATE TABLE bronze.erp_tms_shipment_fact;

		PRINT '>> Inserting Data Into: bronze.erp_tms_shipment_fact';
		BULK INSERT bronze.erp_tms_shipment_fact
		FROM 'C:\Users\HP\Desktop\SQL\corporate-carbon-esg-intelligence\datasets\source_erp\tms_shipment_fact.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			ROWTERMINATOR = '0x0a',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST (DATEDIFF (second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '------------------';

		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: bronze.erp_travel_expense_feed';
		TRUNCATE TABLE bronze.erp_travel_expense_feed;

		PRINT '>> Inserting Data Into: bronze.erp_travel_expense_feed';
		BULK INSERT bronze.erp_travel_expense_feed
		FROM 'C:\Users\HP\Desktop\SQL\corporate-carbon-esg-intelligence\datasets\source_erp\travel_expense_feed.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			ROWTERMINATOR = '0x0a',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST (DATEDIFF (second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '------------------';

		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: bronze.erp_util_energy_readings';
		TRUNCATE TABLE bronze.erp_util_energy_readings;

		PRINT '>> Inserting Data Into: bronze.erp_util_energy_readings';
		BULK INSERT bronze.erp_util_energy_readings
		FROM 'C:\Users\HP\Desktop\SQL\corporate-carbon-esg-intelligence\datasets\source_erp\util_energy_readings.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			ROWTERMINATOR = '0x0a',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST (DATEDIFF (second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '------------------';

		SET @batch_end_time = GETDATE();
		PRINT '===========================================';
		PRINT 'LOADING BRONZE LAYER IS COMPLETED';
		PRINT '-   Total Load Duration: ' + CAST (DATEDIFF (second, @batch_start_time, @batch_end_time) AS NVARCHAR) + ' seconds';
		PRINT '===========================================';
	END TRY
	BEGIN CATCH
		PRINT '===================================================';
		PRINT 'ERROR OCCURED DURING LOADING DATA INTO BRONZE LAYER';
		PRINT 'Error Message' + ERROR_MESSAGE();
		PRINT 'Error Message' + CAST (ERROR_NUMBER() AS NVARCHAR);
		PRINT 'Error Message' + CAST (ERROR_STATE() AS NVARCHAR);
		PRINT '===================================================';
	END CATCH
END
