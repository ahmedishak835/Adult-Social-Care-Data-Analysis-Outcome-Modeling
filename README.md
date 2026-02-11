Adult Social Care: Financial & Outcome Analysis 📊
Project Overview
This project analyzes a comprehensive Adult Social Care dataset to identify trends in council spending, the impact of regional deprivation, and the effectiveness of carer support. The objective was to transform raw administrative data into strategic insights that could inform budget allocation and service improvement.

I utilized a full-stack data approach: SQL for data extraction, Excel (Power Query) for ETL (Extract, Transform, Load), and Tableau for executive-level visualization.

Technical Stack
Database: SQL (Data Aggregation & Analysis)

ETL Tool: Excel Power Query (Data Cleaning & Validation)

Visualization: Tableau (Interactive Dashboards)

Key Questions & SQL Logic
1. Total Spend by Ward
Goal: Identify geographical areas with the highest financial requirements.

SQL
SELECT 
    ward, 
    SUM(weekly_cost_gbp) AS total_weekly_spend
FROM 
    care_data
GROUP BY 
    ward
ORDER BY 
    total_weekly_spend DESC;
Insight: Highlights high-cost areas to help prioritize regional budget reviews.

2. Average Cost vs. Deprivation Decile
Goal: Analyze the correlation between local deprivation (1 = Most Deprived, 10 = Least) and individual care costs.

SQL
SELECT 
    deprivation_decile, 
    AVG(weekly_cost_gbp) AS average_weekly_cost
FROM 
    care_data
GROUP BY 
    deprivation_decile
ORDER BY 
    deprivation_decile ASC;
Insight: Determines if socioeconomic factors influence the "unit cost" of care per resident.

3. Impact of Carer Support on Independence
Goal: Evaluate if residents with carers achieve better independence outcomes.

SQL
SELECT 
    carer_flag, 
    outcome_improved_independence, 
    COUNT(person_id) AS resident_count
FROM 
    care_data
GROUP BY 
    carer_flag, 
    outcome_improved_independence
ORDER BY 
    carer_flag DESC;
Insight: Provides a statistical breakdown of service effectiveness, comparing "Success Rates" between supported and non-supported residents.

Data Pipeline & Transformation
Before visualization, I used Power Query to perform essential ETL tasks:

Data Cleaning: Handled null values and inconsistent naming conventions within the ward column.

Type Casting: Formatted currency fields and ensured the deprivation_decile was treated as an ordinal dimension.

Verification: Cross-referenced Power Query totals against SQL outputs to ensure 100% data integrity before importing into Tableau.

Visualizations (Tableau)
The final analysis was presented via an interactive dashboard featuring:

Ward Expenditure Map: A spatial view of total spending across the region.

Deprivation Trend Line: A visualization showing the cost-per-person across the 1–10 decile range.

Outcome Heatmap: A visual matrix showing the volume of residents achieving independence based on carer presence.

Key Findings
Carer Correlation: Residents with a recorded carer were significantly more likely to report "Improved Independence" compared to those without.

Deprivation Impact: Average weekly costs showed a distinct trend relative to deprivation deciles, suggesting that higher-deprivation areas require more complex, higher-cost care packages.
