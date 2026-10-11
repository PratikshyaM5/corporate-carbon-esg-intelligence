/*
===============================================================================
DDL Script: Create Bronze Tables
===============================================================================
Script Purpose:
    This script creates tables in the 'bronze' schema, dropping existing tables 
    if they already exist.
	  Run this script to re-define the DDL structure of 'bronze' Tables
===============================================================================
*/
IF OBJECT_ID ( 'bronze.crm_bp_supplier_master' , 'U') IS NOT NULL
	DROP TABLE bronze.crm_bp_supplier_master;
GO

CREATE TABLE bronze.crm_bp_supplier_master (
	bp_id         NVARCHAR(50),
	legal_name    NVARCHAR(50),
	sector        NVARCHAR(50),
	country_cd    NVARCHAR(50),
	geo_region    NVARCHAR(50),
	esg_rating    NVARCHAR(50),
	bp_status     NVARCHAR(50),
	strat_flg     NVARCHAR(50)
);
GO

IF OBJECT_ID ( 'bronze.crm_facility_locations' , 'U') IS NOT NULL
	DROP TABLE bronze.crm_facility_locations;
GO
CREATE TABLE bronze.crm_facility_locations (
	fy_code      NVARCHAR(50),
	site_nm      NVARCHAR(50),
	site_type    NVARCHAR(50),
	cntry_cd     NVARCHAR(50),
	rgn_nm       NVARCHAR(50),
	hc_count     INT,
	ops_status   NVARCHAR(50)
);
GO

IF OBJECT_ID ( 'bronze.crm_hcm_employeeroster' , 'U') IS NOT NULL
	DROP TABLE bronze.crm_hcm_employeeroster;
GO
CREATE TABLE bronze.crm_hcm_employeeroster (
	emp_no       NVARCHAR(50),
	loc_code     NVARCHAR(50),
	dept         NVARCHAR(50),
	emp_type     NVARCHAR(50),
	ctry_cd      NVARCHAR(50)
);
GO

IF OBJECT_ID ( 'bronze.erp_ehs_waste_register' , 'U') IS NOT NULL
	DROP TABLE bronze.erp_ehs_waste_register;
GO
CREATE TABLE bronze.erp_ehs_waste_register (
	waste_ref     NVARCHAR(50),
	site_cd       NVARCHAR(50),
	waste_dt      NVARCHAR(50),
	waste_cat     NVARCHAR(50),
	qty_mt        NVARCHAR(50),
	disp_type     NVARCHAR(50),
	handling_cost NVARCHAR(50),
);
GO

IF OBJECT_ID ( 'bronze.erp_fi_gl_monthly_actuals' , 'U') IS NOT NULL
	DROP TABLE bronze.erp_fi_gl_monthly_actuals;
GO
CREATE TABLE bronze.erp_fi_gl_monthly_actuals (
	plant_id      NVARCHAR(50),
	fisc_mth      DATE,
	net_sales     NVARCHAR(50),
	opex_amt      NVARCHAR(50),
	prod_vol      NVARCHAR(50)
);
GO

IF OBJECT_ID ( 'bronze.erp_fuel_txn_export' , 'U') IS NOT NULL
	DROP TABLE bronze.erp_fuel_txn_export;
GO
CREATE TABLE bronze.erp_fuel_txn_export (
	fuel_txn_id   NVARCHAR(50),
	site_id       NVARCHAR(50),
	txn_dt        NVARCHAR(50),
	fuel_cd       NVARCHAR(50),
	qty           DECIMAL(8,2),
	uom           NVARCHAR(50),
	amount        DECIMAL(8,2)
);
GO

IF OBJECT_ID ( 'bronze.erp_hr_commute_survey' , 'U') IS NOT NULL
	DROP TABLE bronze.erp_hr_commute_survey;
GO
CREATE TABLE bronze.erp_hr_commute_survey (
	emp_id         NVARCHAR(50),
	survey_dt      NVARCHAR(50),
	commute_mode   NVARCHAR(50),
	oneway_km      DECIMAL(4,1),
	work_days      INT
);
GO

IF OBJECT_ID ( 'bronze.erp_mm_po_history' , 'U') IS NOT NULL
	DROP TABLE bronze.erp_mm_po_history;
GO
CREATE TABLE bronze.erp_mm_po_history (
	po_no         NVARCHAR(50),
	po_dt         NVARCHAR(50),
	vendor_cd     NVARCHAR(50),
	matl_id       NVARCHAR(50),
	ord_qty       NVARCHAR(50),
	net_value     NVARCHAR(50),
	curr          NVARCHAR(50)
);
GO

IF OBJECT_ID ( 'bronze.erp_tms_shipment_fact' , 'U') IS NOT NULL
	DROP TABLE bronze.erp_tms_shipment_fact;
GO
CREATE TABLE bronze.erp_tms_shipment_fact (
	shipment_no    NVARCHAR(50),
	ship_dt        NVARCHAR(50),
	supp_no        NVARCHAR(50),
	from_loc       NVARCHAR(50),
	to_loc         NVARCHAR(50),
	mode_cd        NVARCHAR(50),
	dist_km        NVARCHAR(50),
	wt_mt          NVARCHAR(50),
	freight_amt    NVARCHAR(50)
);
GO

IF OBJECT_ID ( 'bronze.erp_travel_expense_feed' , 'U') IS NOT NULL
	DROP TABLE bronze.erp_travel_expense_feed;
GO
CREATE TABLE bronze.erp_travel_expense_feed (
	trip_id        NVARCHAR(50),
	emp_no         NVARCHAR(50),
	travel_dt      NVARCHAR(50),
	mode           NVARCHAR(50),
	from_city      NVARCHAR(50),
	to_city        NVARCHAR(50),
	distance_km    NVARCHAR(50),
	claim_amt      NVARCHAR(50)
);
GO

IF OBJECT_ID ( 'bronze.erp_util_energy_readings' , 'U') IS NOT NULL
	DROP TABLE bronze.erp_util_energy_readings;
GO
CREATE TABLE bronze.erp_util_energy_readings (
	read_dt       NVARCHAR(50),
	site_cd       NVARCHAR(50),
	enrgy_typ     NVARCHAR(50),
	cons_qty      NVARCHAR(50),
	uom_cd        NVARCHAR(20),
	cost_lc       NVARCHAR(50),
);
GO
