1.Total Weekly Expenditure by Ward This script identifies the geographical areas with the highest financial commitments.
SELECT 
    Ward, 
    SUM(Total_Weekly_Cost) AS Total_Weekly_Spend
FROM 
    Social_Care_Data
GROUP BY 
    Ward
ORDER BY 
    Total_Weekly_Spend DESC;

2. Average Cost by Deprivation Decile This script analyzes the correlation between socio-economic factors and individual care costs.
SELECT 
    Deprivation_Decile, 
    AVG(Total_Weekly_Cost) AS Average_Weekly_Cost
FROM 
    Social_Care_Data
GROUP BY 
    Deprivation_Decile
ORDER BY 
    Deprivation_Decile ASC;

3. Independence Outcomes by Carer Status This script quantifies the volume of service users achieving independence milestones based on carer presence.
SELECT 
    Carer_Flag, 
    Outcome_Improved_Independence, 
    COUNT(Person_ID) AS Resident_Count
FROM 
    Social_Care_Data
GROUP BY 
    Carer_Flag, 
    Outcome_Improved_Independence
ORDER BY 
    Resident_Count DESC;


