/* 
Name: Haneefuddin Rasheed
Chosen Dataset: Datta Scientist_Fyi_Salary
Reason: I am an aspiring Data Scietist, and want to investigte information on Data Scientist Salary 
*/
/*
----------------------------------------------------------------------------
               Creation of Table
______________________________________________________________________________
*/
CREATE TABLE levels_fyi_salary_data (
    timestamp TIMESTAMP, -- Using TIMESTAMP for date and time data
    company VARCHAR(50), -- Slightly larger than the max observed length for future-proofing
    level VARCHAR(60), -- Accommodates the longest string in the dataset
    title VARCHAR(30), -- Sufficient length based on observed data
    totalyearlycompensation INTEGER, -- Integer type for total compensation
    location VARCHAR(50), -- Slightly larger to accommodate all locations
    yearsofexperience DECIMAL, -- Decimal to handle fractional years
    yearsatcompany DECIMAL, -- Decimal for the same reason as yearsofexperience
    tag VARCHAR(85), -- Based on the maximum length observed
    basesalary DECIMAL, -- Decimal type for base salary to accommodate decimals
    stockgrantvalue DECIMAL, -- Decimal type for stock grant value to accommodate decimals
    bonus DECIMAL, -- Decimal type for bonus to accommodate decimals
    gender VARCHAR(35), -- Based on the maximum length observed
    otherdetails VARCHAR(800), -- Significantly longer to accommodate detailed text
    cityid INTEGER, -- Integer for city ID
    dmaid INTEGER, -- Integer for DMA ID
    rowNumber INTEGER, -- Integer for row number
    masters_degree BOOLEAN, -- Boolean for binary (yes/no) data
    bachelors_degree BOOLEAN,
    doctorate_degree BOOLEAN,
    highschool BOOLEAN,
    some_college BOOLEAN,
    race_asian BOOLEAN,
    race_white BOOLEAN,
    race_two_or_more BOOLEAN,
    race_black BOOLEAN,
    race_hispanic BOOLEAN,
    race VARCHAR(15), -- Based on the maximum length observed
    education VARCHAR(20) -- Based on the maximum length observed
);
/*
Copying Data intocreated Table
------------------------------------------------------------------
*/
-- Set the datestyle to MDY to match the timestamp format in the CSV file
SET datestyle = "MDY";

-- Copy command to load data from the CSV file, treating "NA" as NULL
COPY levels_fyi_salary_data FROM 'C:\\Users\\Public\\Levels_Fyi_Salary_Data.csv' WITH (FORMAT csv, HEADER true, NULL 'NA');


select * from levels_fyi_salary_data;
/*
Part 2
(Cleaning)
*/
-----1.Creating Backup
CREATE TABLE levels_fyi_salary_data_backup AS
SELECT * FROM levels_fyi_salary_data;

---------2. creating duplicate column
-- Add a new column to the table
ALTER TABLE levels_fyi_salary_data
ADD COLUMN total_compensation_copy INTEGER;

-- Copy the data from the original column to the new column
-- Step 1: Add a new column to the table
ALTER TABLE levels_fyi_salary_data
ADD COLUMN total_compensation_copy INTEGER;

-- Step 2: Copy the data from the original column to the new column
UPDATE levels_fyi_salary_data
SET total_compensation_copy = totalyearlycompensation;
/*
Task:3. 
ocate and update values representing missing data in one column 
 - Change values so that they are correctly labeled and recognized by SQL as
NULL values
*/
UPDATE levels_fyi_salary_data
SET tag = NULL
WHERE tag = 'NA';
select * from levels_fyi_salary_data ---- Tag column was chosen because it contains a lot of missing data
*/
Task 4.
--Remove the data containing null values

-- Removing rows where the 'tag' column is NULL
-- This is done because rows with missing 'tag' information might not be useful for certain analyses
-- or could lead to incorrect conclusions if included in calculations or aggregations.
DELETE FROM levels_fyi_salary_data
WHERE tag IS NULL;
select * from levels_fyi_salary_data
*/
Task 5 
*/
-- Standardizing company names in the 'company' column
-- This update focuses on unifying different capitalizations and spellings of the company name 'Amazon'.
-- This standardization is crucial for maintaining data consistency, as it ensures all records referring to the same entity are uniformly represented.
-- This process is essential for accurate data analysis, particularly when aggregating or comparing data based on the company.
UPDATE levels_fyi_salary_data
SET company = 'Amazon'
WHERE company IN ('AMAZON', 'AMazon', 'amazon', 'Amazn');

-----Task 6
-- Correcting misplaced values in the 'Gender' column
-- This update is necessary because some rows have incorrect data, like job titles, in the 'Gender' column.
-- Replacing these incorrect values with 'Unknown' improves the accuracy of gender-related data 
-- and ensures that analyses involving gender are based on relevant and correct information.
UPDATE levels_fyi_salary_data
SET gender = 'Unknown'
WHERE gender = 'Title: Senior Software Engineer';

--Task 7
-- Trimming whitespace from the 'company' column
-- This is done to ensure that values in the column are consistent, improving the accuracy of string comparisons and searches.
-- Whitespace issues can lead to duplicates or missed matches in queries, so cleaning these up is an essential part of data preparation.
UPDATE levels_fyi_salary_data
SET company = TRIM(company);
------Task7 Alternate
-- Handling missing values in the 'Race' column
-- Missing values are set to 'Unknown'. This approach acknowledges the absence of specific racial information,
-- while maintaining the integrity of the dataset. It allows for more accurate demographic analysis, as it 
-- distinguishes between known and unknown racial data.
UPDATE levels_fyi_salary_data
SET Race = 'Unknown'
WHERE Race IS NULL;

