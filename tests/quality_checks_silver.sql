/*
===============================================================================
Quality Checks
===============================================================================
Script Purpose:
    This script performs various quality checks for data consistency, accuracy, 
    and standardization across the 'silver' layer. It includes checks for:
    - Null or duplicate primary keys.
    - Unwanted spaces in string fields.
    - Data standardization and consistency.
    - Invalid date ranges.
    - Data consistency between related fields.

Usage Notes:
    - Run these checks after data loading Silver Layer.
    - Investigate and resolve any discrepancies found during the checks.
===============================================================================
*/

-- ====================================================================
-- Checking 'silver.crm_bp_supplier_master'
-- ====================================================================
-- Check for NULLS or Duplicates in the Primary Key
-- Expectation: No Results

SELECT 
  bp_id,
  COUNT(*) AS Duplicates
FROM bronze.crm_bp_supplier_master
GROUP BY bp_id
HAVING COUNT(*) > 1 OR bp_id IS NULL

-- Check for unwanted Spaces
-- Expectation: No Results
SELECT 
    legal_name
FROM bronze.crm_bp_supplier_master
WHERE legal_name != TRIM(legal_name); 

-- Check for NULLS or Negative numbers
-- Expectation: No Results
SELECT 
    esg_rating
FROM silver.crm_bp_supplier_master
WHERE TRY_CAST(esg_rating AS DECIMAL(10,2)) < 0 OR TRY_CAST(esg_rating AS DECIMAL(10,2)) IS NULL OR
DATALENGTH(esg_rating) != DATALENGTH(TRIM(esg_rating))


-- Data Standardization and Consistency
SELECT DISTINCT 
  country_cd
FROM bronze.crm_bp_supplier_master

