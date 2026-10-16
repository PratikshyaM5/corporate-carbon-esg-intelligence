# **CarbonIQ - Corporate Carbon & ESG Intelligence Platform**

## **📖 Project Overview**

A fictional multinational industrial manufacturing company operating across India, Germany, France, Singapore, and the Netherlands. Its operations involve industrial manufacturing, procurement, energy consumption, fuel usage, transportation, waste management, business travel, and employee commuting.
The company generates operational data across multiple source systems, making it challenging to obtain a consolidated view of its environmental performance. Inconsistent data formats, missing values, duplicate records, inconsistent identifiers and  invalid measurements complicate the process of producing reliable sustainability insights.

This project aims to develop a **Corporate Carbon & ESG Intelligence Platform using Microsoft SQL Server and Power BI**. The platform integrates operations and supporting business data implements ETL process and calculates **Scope 1, Scope 2, and selected Scope 3 greenhouse gas emissions, and presents actionable insights through interactive dashboards**.
The goal is to help management understand the company's emissions profile, identify environmental hotspots, monitor sustainability performance over time, and evaluate carbon intensity relative to revenue and production.

-----------------------------------------------------------------------------------------------------------------------------------------

## **🔹 Project Scope and Assumptions**

The project uses synthetic datasets created for portfolio and analytical purposes.
Emissions estimates depend on the suitability of the activity data and emission factors used.
Scope 3 coverage is limited to the categories supported by the available datasets.

------------------------------------------------------------------------------------------------------------------------------------------

## **🚀 Project Requirements**
### Technical Requirements

Tools: 
- **Microsoft SQL Server**
- **SQL Server Management Studio (SSMS)**
- **Microsoft Power BI Desktop**

### Data Requirements
- 11 source CSV datasets covering operational activities and supporting business information.

- Activity-specific emission factors with documented sources, units, geographic applicability, and assumptions.

- Consistent business keys for integrating supplier, employee, and facility records.

- Validated date, quantity, cost, distance, and other measurement fields.

- Defined data-quality rules and documented decisions for missing, duplicate, invalid, and unmatched records.

### **BI: Analytics & Reporting (Data Analysis)**

Calculate Scope 1 emissions from relevant direct fuel combustion activities.

Calculate Scope 2 emissions from purchased electricity using appropriate emission factors.

Estimate selected Scope 3 emissions from purchased goods, transportation, waste, business travel, and employee commuting, subject to the chosen calculation methodology and available data.

Analyze emissions by period, scope, facility, country, supplier, and activity where applicable.

Evaluate carbon intensity relative to revenue and production.

Develop interactive Power BI reports to support sustainability monitoring and business decision-making.

