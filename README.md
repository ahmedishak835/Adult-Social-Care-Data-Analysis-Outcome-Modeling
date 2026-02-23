<img width="1657" height="851" alt="Adult Social Care Financial   Outcomes" src="https://github.com/user-attachments/assets/c6557aca-6598-4600-a4ab-7c134d17f616" />
Adult Social Care: Financial & Outcome Intelligence Suite 📊
Project Overview
This project engineers a full-stack analytics pipeline to audit Adult Social Care (ASC) expenditure and service efficacy. By integrating SQL-driven extraction, Power Query ETL, and Tableau visualization, the analysis identifies high-variance spending zones and quantifies the impact of informal care on service user independence.

The objective was to transform raw administrative data into actionable business intelligence to optimize budget allocation and identify "crisis-entry" patterns in specific socio-economic demographics.

Technical Stack
Database: SQL (Data Normalization, Logical Modeling, & Aggregation)

ETL & Governance: Excel Power Query (Schema Standardization & Validation)

BI & Visualization: Tableau (Interactive Executive Dashboards)

1. Data Engineering & SQL Logic
The raw data was extracted and modeled to isolate three primary KPIs: regional spend, socio-economic cost correlation, and carer effectiveness.

A. Regional Expenditure Variance
Identifies geographical "hotspots" to prioritize regional budget audits.

SQL
SELECT ward, SUM(weekly_cost_gbp) AS total_weekly_spend 
FROM care_data 
GROUP BY ward 
ORDER BY total_weekly_spend DESC;
B. Socio-Economic Cost Correlation
Analyzes the "unit cost" of care relative to the Index of Multiple Deprivation (IMD).

SQL
SELECT deprivation_decile, AVG(weekly_cost_gbp) AS average_weekly_cost 
FROM care_data 
GROUP BY deprivation_decile 
ORDER BY deprivation_decile ASC;
C. Outcome Efficacy Matrix
Quantifies the success rate of independence outcomes based on carer presence.

SQL
SELECT carer_flag, outcome_improved_independence, COUNT(person_id) AS resident_count 
FROM care_data 
GROUP BY carer_flag, outcome_improved_independence 
ORDER BY resident_count DESC;
2. ETL Pipeline & Data Governance
Before visualization, data underwent a rigorous ETL process in Power Query to ensure a "Single Version of Truth" (SVOT):

Categorical Normalization: Consolidated 12+ fragmented string variations of "Independence Outcomes" into a standardized 3-tier ordinal scale (Yes | Partial | No).

Type Casting: Cast Deprivation_Decile as an integer to allow for continuous trend-line slope analysis.

Integrity Validation: Performed row-count and grand-total cross-checks against raw SQL outputs to verify zero data loss during ingestion.

3. Interactive Visualization (Tableau)
The dashboard provides an executive-level overview of the care landscape:

Geographical Expenditure Map: A spatial audit of total spending across wards.

Deprivation Trend Analysis: A visualization of average weekly costs across the 1–10 decile range.

Outcome Heatmap: A matrix correlating carer support with independence success rates.

4. Key Strategic Findings
The "Hazel Grove" Outlier: Identified a significant financial concentration in Hazel Grove (£9,045/week), triggering a recommendation for a provider-rate audit.

The Decile 7 Paradox: Costs do not scale linearly with poverty; a significant peak occurs at Decile 7 (£819 avg), suggesting middle-income residents enter the system at "crisis points" rather than through preventative care.

Carer ROI: Residents with recorded carers demonstrated a statistically higher likelihood of achieving improved independence, providing a fiscal evidence base for continued Carer Support Grants.

5. Future Roadmap
Live Integration: Transition from static flat-files to a live SQL Server connection.

Predictive Modeling: Utilize historical spend data to forecast 2026/27 budget requirements.

Data Quality: Implement CRM field validation to eliminate the 22% reporting gap in carer status documentation.
