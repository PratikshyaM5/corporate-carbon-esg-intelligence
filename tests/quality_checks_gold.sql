/*
===============================================================================
Quality Checks
===============================================================================
Script Purpose:
    This script performs quality checks to validate the integrity, consistency,
    and accuracy of the Gold Layer. These checks ensure:
    - Uniqueness of surrogate keys in dimension tables.
    - Referential integrity between fact and dimension tables.
    - Validation of relationships in the data model for analytical purposes.

Usage Notes:
    - Investigate and resolve any discrepancies found during the checks.
===============================================================================
*/

-- ====================================================================
-- Checking 'gold.dim_supplier'
-- ====================================================================
-- Check for Uniqueness of Product Key in gold.dim_supplier
-- Expectation: No results
SELECT
    supplier_key,
    COUNT(*) AS duplicate_count
FROM gold.dim_supplier
GROUP BY supplier_key
HAVING COUNT(*) > 1;

-- ====================================================================
-- Checking 'gold.dim_facility'
-- ====================================================================
-- Check for Uniqueness of Product Key in gold.dim_facility
-- Expectation: No results
SELECT
    facility_key,
    COUNT(*) AS duplicate_count
FROM gold.dim_facility
GROUP BY facility_key
HAVING COUNT(*) > 1;

-- ====================================================================
-- Checking 'gold.dim_employee'
-- ====================================================================
-- Check for Uniqueness of Product Key in gold.dim_employee
-- Expectation: No results
SELECT
    employee_key,
    COUNT(*) AS duplicate_count
FROM gold.dim_employee
GROUP BY employee_key
HAVING COUNT(*) > 1;

-- ====================================================================
-- Checking 'gold.fact_business_travel'
-- ====================================================================
-- Check the data model connectivity between fact and dimensions
SELECT *
FROM gold.fact_business_travel bt
LEFT JOIN gold.dim_employee de
    ON de.employee_key = bt.employee_key
LEFT JOIN gold.dim_facility df
    ON df.facility_key = bt.facility_key
WHERE de.employee_key IS NULL OR df.facility_key IS NULL

-- ====================================================================
-- Checking 'gold.fact_employee_commute'
-- ====================================================================
-- Check the data model connectivity between fact and dimensions
SELECT *
FROM gold.fact_employee_commute ec
LEFT JOIN gold.dim_employee de
    ON de.employee_key = ec.employee_key
LEFT JOIN gold.dim_facility df
    ON df.facility_key = ec.facility_key
WHERE de.employee_key IS NULL OR df.facility_key IS NULL

-- ====================================================================
-- Checking 'gold.fact_energy_readings'
-- ====================================================================
-- Check the data model connectivity between fact and dimensions
SELECT *
FROM gold.fact_energy_readings AS fe
LEFT JOIN gold.dim_facility AS df
    ON fe.facility_key = df.facility_key
WHERE df.facility_key IS NULL;

-- ====================================================================
-- Checking 'gold.fact_fuel_transactions'
-- ====================================================================
-- Check the data model connectivity between fact and dimensions
SELECT *
FROM gold.fact_fuel_transactions AS ff
LEFT JOIN gold.dim_facility AS df
    ON ff.facility_key = df.facility_key
WHERE df.facility_key IS NULL;

-- ====================================================================
-- Checking 'gold.fact_monthly_financials'
-- ====================================================================
-- Check the data model connectivity between fact and dimensions
SELECT *
FROM gold.fact_monthly_financials AS fm
LEFT JOIN gold.dim_facility AS df
    ON fm.facility_key = df.facility_key
WHERE df.facility_key IS NULL;

-- ====================================================================
-- Checking 'gold.fact_procurement'
-- ====================================================================
-- Check the data model connectivity between fact and dimensions
SELECT *
FROM gold.fact_procurement AS fp
LEFT JOIN gold.dim_supplier AS ds
    ON fp.supplier_key = ds.supplier_key
WHERE ds.supplier_key IS NULL;

-- ====================================================================
-- Checking 'gold.fact_shipment'
-- ====================================================================
-- Check the data model connectivity between fact and dimensions
SELECT *
FROM gold.fact_shipment AS fs
LEFT JOIN gold.dim_supplier AS ds
    ON fs.supplier_key = ds.supplier_key
WHERE ds.supplier_key IS NULL;  ---- Missing Supplier Key in dim_supplier (SUP999)

-- Check origin_facility_key
SELECT *
FROM gold.fact_shipment AS fs
LEFT JOIN gold.dim_facility AS df
    ON fs.origin_facility_key = df.facility_key
WHERE df.facility_key IS NULL;

-- Check destination_facility_key
SELECT *
FROM gold.fact_shipment AS fs
LEFT JOIN gold.dim_facility AS df
    ON fs.destination_facility_key = df.facility_key
WHERE df.facility_key IS NULL;

-- ====================================================================
-- Checking 'gold.fact_waste_register'
-- ====================================================================
-- Check the data model connectivity between fact and dimensions
SELECT *
FROM gold.fact_waste_register AS fw
LEFT JOIN gold.dim_facility AS df
    ON fw.facility_key = df.facility_key
WHERE df.facility_key IS NULL;
