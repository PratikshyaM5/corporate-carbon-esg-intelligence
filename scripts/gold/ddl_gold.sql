/*
===============================================================================
DDL Script: Create Gold Views
===============================================================================
Script Purpose:
    This script creates views for the Gold layer in the data warehouse.
    The Gold layer represents the final dimension and fact tables (Galaxy Schema)

    Each view performs transformations and combines data from the Silver layer
    to produce a clean, enriched, and business-ready dataset.

Usage:
    - These views can be queried directly for analytics and reporting.
===============================================================================
*/

-- =============================================================================
-- Create Dimension: gold.dim_supplier
-- =============================================================================
IF OBJECT_ID('gold.dim_supplier', 'V') IS NOT NULL
    DROP VIEW gold.dim_supplier;
GO
  
CREATE VIEW gold.dim_supplier AS
SELECT
    ROW_NUMBER() OVER (ORDER BY bp_id) AS supplier_key,
    bp_id AS supplier_id,
    legal_name AS supplier_name,
    sector AS supplier_sector,
    country_cd AS supplier_country,
    geo_region AS supplier_region,
    esg_rating AS supplier_esg_rating,
    bp_status AS supplier_status,
    strat_flg AS is_strategic_supplier
FROM silver.crm_bp_supplier_master
GO

-- =============================================================================
-- Create Dimension: gold.dim_facility
-- =============================================================================
IF OBJECT_ID('gold.dim_facility', 'V') IS NOT NULL
    DROP VIEW gold.dim_facility;
GO

CREATE VIEW gold.dim_facility AS
SELECT
    ROW_NUMBER() OVER (ORDER BY fy_code) AS facility_key,
    fy_code AS facility_code,
    site_nm AS facility_name,
    site_type AS facility_type,
    cntry_cd AS faciity_country,
    rgn_nm AS facility_region,
    hc_count AS facility_headcount,
    ops_status AS facility_operational_status
FROM silver.crm_facility_locations
GO
