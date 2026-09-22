# Online Retail Reporting & Data Visualization

University project focused on data analysis, reporting, and visualization using T-SQL, Microsoft Power BI, and SQL Server Reporting Services (SSRS).

The project was developed as part of the Reporting and Visualization Tools course at the Faculty of Organizational Sciences, University of Belgrade.

## Project Overview

The project analyzes an Online Retail II transactional dataset and demonstrates multiple approaches to querying, aggregating, visualizing, and reporting business data.

The project is divided into three main parts:

- T-SQL data analysis
- Power BI dashboard development
- SSRS / Report Builder reports

## Technologies

- Microsoft SQL Server
- T-SQL
- Power BI
- SQL Server Reporting Services (SSRS)
- Microsoft Report Builder

## SQL Analysis

The SQL section demonstrates:

- TOP N queries and sorting
- INNER JOIN and LEFT JOIN
- WHERE and HAVING filtering
- SUM and AVG aggregate functions
- Median and percentile calculations
- ROLLUP grouping
- Window functions
- Cumulative revenue calculations
- LAG for month-over-month analysis
- Revenue percentage calculations
- PIVOT transformations
- 3-month rolling sum and average
- SQL views
- Materialization of query results

## Power BI Dashboard

The Power BI report contains two main pages:

### Overview

Provides a high-level overview of the retail data using KPI cards and multiple revenue and customer visualizations.

### Geography & Products

Provides geographic and country-level analysis using a map, table, donut chart, and interactive country filtering.

The complete Power BI project is available in:

`power-bi/online-retail-dashboard.pbix`

## SSRS Reports

The reporting section contains several SSRS / Report Builder report types:

- Tabular Report
- Master-Detail Report
- Matrix Report
- Chart Report
- Parameterized Report

The original `.rdl` files are available in the `ssrs/rdl` directory.

Selected PDF exports are available in the `ssrs/pdf` directory.

## Repository Structure

```text
sql/
    setup/
    SQL analysis queries

power-bi/
    Power BI dashboard

ssrs/
    rdl/
    pdf/

screenshots/
    Dashboard and report previews

## Dataset

The project uses an online retail transactional dataset containing invoice, product, quantity, price, customer, country, and transaction date information.

The raw dataset is not included in this repository.

## Notes

SSRS report data sources use a local Microsoft SQL Server instance and may need to be reconfigured before the reports can be executed on another computer.

## Author

Vuk Vasiljević

Faculty of Organizational Sciences  
University of Belgrade
