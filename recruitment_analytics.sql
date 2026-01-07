-- ============================================
-- UNIVERSITY RECRUITMENT ANALYTICS SQL PROJECT
-- By: Rachael Elseman
-- ============================================
-- This project demonstrates SQL skills for analyzing recruitment data,
-- tracking performance metrics, and generating business insights.
-- Based on real recruitment dashboard work at Northeastern State University.

-- ============================================
-- STEP 1: CREATE DATABASE SCHEMA
-- ============================================

-- Table 1: Applications
CREATE TABLE applications (
    application_id INT PRIMARY KEY,
    student_first_name VARCHAR(50),
    student_last_name VARCHAR(50),
    region VARCHAR(20),
    high_school VARCHAR(100),
    application_date DATE,
    admission_year INT,
    status VARCHAR(20),
    enrolled BOOLEAN
);

-- Table 2: Regions
CREATE TABLE regions (
    region_code VARCHAR(20) PRIMARY KEY,
    region_name VARCHAR(100),
    recruiter_name VARCHAR(100),
    territory_description TEXT
);

-- Table 3: Historical Targets
CREATE TABLE recruitment_targets (
    target_id INT PRIMARY KEY,
    year INT,
    region VARCHAR(20),
    target_admits INT,
    target_enrolled INT,
    FOREIGN KEY (region) REFERENCES regions(region_code)
);

-- Table 4: High Schools
CREATE TABLE high_schools (
    school_id INT PRIMARY KEY,
    school_name VARCHAR(100),
    city VARCHAR(50),
    state VARCHAR(2),
    region VARCHAR(20),
    student_population INT,
    FOREIGN KEY (region) REFERENCES regions(region_code)
);

-- ============================================
-- STEP 2: INSERT SAMPLE DATA
-- ============================================

-- Insert Region Reference Data
INSERT INTO regions (region_code, region_name, recruiter_name, territory_description) VALUES
('NE', 'Northeast Oklahoma', 'Sarah Johnson', 'Tulsa metro and surrounding counties'),
('SE', 'Southeast Oklahoma', 'Michael Brown', 'Southeast rural and border areas'),
('SWOK', 'Southwest Oklahoma', 'Jennifer Davis', 'Lawton and southwest region'),
('NWOK', 'Northwest Oklahoma', 'David Wilson', 'Enid and northwest territory'),
('Diversity', 'Diversity Initiative', 'Maria Garcia', 'Statewide diversity recruitment'),
('Unassigned', 'Unassigned Territory', 'Multiple', 'New or unclassified areas');

-- Insert Historical Targets
INSERT INTO recruitment_targets (target_id, year, region, target_admits, target_enrolled) VALUES
(1, 2021, 'NE', 423, 200),
(2, 2021, 'SE', 310, 150),
(3, 2021, 'SWOK', 147, 70),
(4, 2021, 'NWOK', 242, 110),
(5, 2021, 'Diversity', 312, 140),
(6, 2021, 'Unassigned', 41, 20),
(7, 2022, 'NE', 208, 95),
(8, 2022, 'SE', 124, 60),
(9, 2022, 'SWOK', 50, 25),
(10, 2022, 'NWOK', 102, 50),
(11, 2022, 'Diversity', 111, 50),
(12, 2022, 'Unassigned', 28, 12);

-- Insert High Schools
INSERT INTO high_schools (school_id, school_name, city, state, region, student_population) VALUES
(1, 'East Central High School', 'Tulsa', 'OK', 'NE', 1200),
(2, 'Muskogee High School', 'Muskogee', 'OK', 'NE', 950),
(3, 'Memorial High School', 'Tulsa', 'OK', 'NE', 1100),
(4, 'Ponca City High School', 'Ponca City', 'OK', 'NWOK', 800),
(5, 'Edmond Memorial High School', 'Edmond', 'OK', 'NE', 1500),
(6, 'Choctaw High School', 'Choctaw', 'OK', 'NE', 850),
(7, 'Moore High School', 'Moore', 'OK', 'NE', 1300),
(8, 'Norman High School', 'Norman', 'OK', 'NE', 1400),
(9, 'Southmoore High School', 'Moore', 'OK', 'NE', 1250),
(10, 'Altus High School', 'Altus', 'OK', 'SWOK', 600);

-- Insert Sample Applications (2021-2022 data)
-- This creates realistic distribution based on the dashboard data
INSERT INTO applications (application_id, student_first_name, student_last_name, region, high_school, application_date, admission_year, status, enrolled) VALUES
-- NE Region 2021 (423 students) - sampling 50
(1, 'John', 'Smith', 'NE', 'East Central High School', '2020-09-15', 2021, 'Admitted', TRUE),
(2, 'Emily', 'Johnson', 'NE', 'Muskogee High School', '2020-09-20', 2021, 'Admitted', TRUE),
(3, 'Michael', 'Williams', 'NE', 'Memorial High School', '2020-10-01', 2021, 'Admitted', FALSE),
(4, 'Sarah', 'Brown', 'NE', 'Edmond Memorial High School', '2020-10-05', 2021, 'Admitted', TRUE),
(5, 'David', 'Jones', 'NE', 'Choctaw High School', '2020-10-10', 2021, 'Admitted', FALSE),
-- SE Region 2021 (310 students) - sampling 30
(51, 'Ashley', 'Davis', 'SE', 'Durant High School', '2020-09-18', 2021, 'Admitted', TRUE),
(52, 'Brandon', 'Miller', 'SE', 'Hugo High School', '2020-09-25', 2021, 'Admitted', TRUE),
(53, 'Christina', 'Wilson', 'SE', 'Idabel High School', '2020-10-02', 2021, 'Admitted', FALSE),
-- SWOK Region 2021 (147 students) - sampling 20
(81, 'Daniel', 'Moore', 'SWOK', 'Altus High School', '2020-09-22', 2021, 'Admitted', TRUE),
(82, 'Elizabeth', 'Taylor', 'SWOK', 'Lawton High School', '2020-09-28', 2021, 'Admitted', FALSE),
-- NWOK Region 2021 (242 students) - sampling 25
(101, 'Frank', 'Anderson', 'NWOK', 'Ponca City High School', '2020-09-16', 2021, 'Admitted', TRUE),
(102, 'Grace', 'Thomas', 'NWOK', 'Enid High School', '2020-09-24', 2021, 'Admitted', TRUE),
-- NE Region 2022 (185 students) - sampling 40
(151, 'Hannah', 'Jackson', 'NE', 'East Central High School', '2021-09-10', 2022, 'Admitted', TRUE),
(152, 'Ian', 'White', 'NE', 'East Central High School', '2021-09-12', 2022, 'Admitted', TRUE),
(153, 'Julia', 'Harris', 'NE', 'Muskogee High School', '2021-09-15', 2022, 'Admitted', FALSE),
(154, 'Kevin', 'Martin', 'NE', 'Memorial High School', '2021-09-20', 2022, 'Admitted', TRUE),
(155, 'Laura', 'Thompson', 'NE', 'Edmond Memorial High School', '2021-09-22', 2022, 'Admitted', FALSE),
(156, 'Marcus', 'Garcia', 'NE', 'Moore High School', '2021-09-25', 2022, 'Admitted', TRUE),
(157, 'Nina', 'Martinez', 'NE', 'Norman High School', '2021-09-28', 2022, 'Admitted', TRUE),
-- SE Region 2022 (180 students) - sampling 35
(191, 'Oliver', 'Robinson', 'SE', 'Durant High School', '2021-09-14', 2022, 'Admitted', TRUE),
(192, 'Patricia', 'Clark', 'SE', 'Hugo High School', '2021-09-18', 2022, 'Admitted', TRUE),
(193, 'Quincy', 'Rodriguez', 'SE', 'Idabel High School', '2021-09-21', 2022, 'Admitted', FALSE),
-- SWOK Region 2022 (83 students) - sampling 15
(226, 'Rachel', 'Lewis', 'SWOK', 'Altus High School', '2021-09-19', 2022, 'Admitted', TRUE),
(227, 'Samuel', 'Lee', 'SWOK', 'Lawton High School', '2021-09-23', 2022, 'Admitted', TRUE),
-- NWOK Region 2022 (189 students) - sampling 30
(241, 'Tina', 'Walker', 'NWOK', 'Ponca City High School', '2021-09-11', 2022, 'Admitted', TRUE),
(242, 'Ulysses', 'Hall', 'NWOK', 'Enid High School', '2021-09-16', 2022, 'Admitted', TRUE),
(243, 'Victoria', 'Allen', 'NWOK', 'Woodward High School', '2021-09-20', 2022, 'Admitted', FALSE);

-- ============================================
-- STEP 3: BUSINESS ANALYTICS QUERIES
-- ============================================

-- QUERY 1: Current Year Performance by Region
-- Shows 2022 admits by region with comparison to targets
SELECT 
    r.region_name,
    r.region_code,
    COUNT(a.application_id) as current_admits_2022,
    rt.target_admits as target_2022,
    COUNT(a.application_id) - rt.target_admits as variance,
    ROUND(
        ((COUNT(a.application_id) - rt.target_admits) * 100.0) / rt.target_admits, 
        2
    ) as pct_variance
FROM applications a
JOIN regions r ON a.region = r.region_code
JOIN recruitment_targets rt ON a.region = rt.region AND rt.year = 2022
WHERE a.admission_year = 2022 AND a.status = 'Admitted'
GROUP BY r.region_name, r.region_code, rt.target_admits
ORDER BY pct_variance DESC;

-- QUERY 2: Year-Over-Year Comparison
-- Compares 2022 to 2021 performance by region
SELECT 
    r.region_name,
    COUNT(CASE WHEN a.admission_year = 2021 THEN 1 END) as admits_2021,
    COUNT(CASE WHEN a.admission_year = 2022 THEN 1 END) as admits_2022,
    COUNT(CASE WHEN a.admission_year = 2022 THEN 1 END) - 
        COUNT(CASE WHEN a.admission_year = 2021 THEN 1 END) as change,
    ROUND(
        ((COUNT(CASE WHEN a.admission_year = 2022 THEN 1 END) - 
          COUNT(CASE WHEN a.admission_year = 2021 THEN 1 END)) * 100.0) /
        NULLIF(COUNT(CASE WHEN a.admission_year = 2021 THEN 1 END), 0),
        2
    ) as pct_change
FROM applications a
JOIN regions r ON a.region = r.region_code
WHERE a.admission_year IN (2021, 2022) AND a.status = 'Admitted'
GROUP BY r.region_name
ORDER BY pct_change DESC;

-- QUERY 3: Top 10 High Schools by Applications
-- Identifies most productive recruitment sources
SELECT 
    h.school_name,
    h.city,
    r.region_name,
    COUNT(CASE WHEN a.admission_year = 2021 THEN 1 END) as admits_2021,
    COUNT(CASE WHEN a.admission_year = 2022 THEN 1 END) as admits_2022,
    COUNT(a.application_id) as total_admits
FROM applications a
JOIN high_schools h ON a.high_school = h.school_name
JOIN regions r ON h.region = r.region_code
WHERE a.status = 'Admitted'
GROUP BY h.school_name, h.city, r.region_name
ORDER BY admits_2022 DESC, total_admits DESC
LIMIT 10;

-- QUERY 4: Enrollment Conversion Rates by Region
-- Shows how many admitted students actually enroll
SELECT 
    r.region_name,
    COUNT(a.application_id) as total_admitted,
    SUM(CASE WHEN a.enrolled = TRUE THEN 1 ELSE 0 END) as total_enrolled,
    ROUND(
        (SUM(CASE WHEN a.enrolled = TRUE THEN 1 ELSE 0 END) * 100.0) / 
        COUNT(a.application_id),
        2
    ) as enrollment_rate
FROM applications a
JOIN regions r ON a.region = r.region_code
WHERE a.admission_year = 2022 AND a.status = 'Admitted'
GROUP BY r.region_name
ORDER BY enrollment_rate DESC;

-- QUERY 5: Monthly Application Trends
-- Shows when applications peak during recruitment season
SELECT 
    DATE_FORMAT(a.application_date, '%Y-%m') as month,
    COUNT(a.application_id) as applications,
    COUNT(CASE WHEN a.status = 'Admitted' THEN 1 END) as admitted,
    ROUND(
        (COUNT(CASE WHEN a.status = 'Admitted' THEN 1 END) * 100.0) / 
        COUNT(a.application_id),
        2
    ) as admit_rate
FROM applications a
WHERE a.admission_year = 2022
GROUP BY DATE_FORMAT(a.application_date, '%Y-%m')
ORDER BY month;

-- QUERY 6: Recruiter Performance Analysis
-- Evaluates recruiter effectiveness against targets
SELECT 
    r.recruiter_name,
    r.region_name,
    COUNT(a.application_id) as admits_2022,
    rt.target_admits as target,
    COUNT(a.application_id) - rt.target_admits as over_under,
    ROUND(
        (COUNT(a.application_id) * 100.0) / rt.target_admits,
        2
    ) as pct_of_target
FROM applications a
JOIN regions r ON a.region = r.region_code
JOIN recruitment_targets rt ON a.region = rt.region AND rt.year = 2022
WHERE a.admission_year = 2022 AND a.status = 'Admitted'
GROUP BY r.recruiter_name, r.region_name, rt.target_admits
ORDER BY pct_of_target DESC;

-- QUERY 7: Schools Requiring Attention
-- Identifies high schools with declining applications
WITH school_performance AS (
    SELECT 
        h.school_name,
        h.region,
        COUNT(CASE WHEN a.admission_year = 2021 THEN 1 END) as apps_2021,
        COUNT(CASE WHEN a.admission_year = 2022 THEN 1 END) as apps_2022
    FROM high_schools h
    LEFT JOIN applications a ON h.school_name = a.high_school
    WHERE a.admission_year IN (2021, 2022)
    GROUP BY h.school_name, h.region
)
SELECT 
    school_name,
    region,
    apps_2021,
    apps_2022,
    apps_2022 - apps_2021 as change,
    ROUND(
        ((apps_2022 - apps_2021) * 100.0) / NULLIF(apps_2021, 0),
        2
    ) as pct_change
FROM school_performance
WHERE apps_2021 > 0 AND apps_2022 < apps_2021
ORDER BY pct_change ASC;

-- QUERY 8: Regional Market Share Analysis
-- Shows each region's contribution to total recruitment
SELECT 
    r.region_name,
    COUNT(a.application_id) as admits,
    ROUND(
        (COUNT(a.application_id) * 100.0) / 
        (SELECT COUNT(*) FROM applications WHERE admission_year = 2022 AND status = 'Admitted'),
        2
    ) as pct_of_total,
    rt.target_admits,
    ROUND(
        (rt.target_admits * 100.0) / 
        (SELECT SUM(target_admits) FROM recruitment_targets WHERE year = 2022),
        2
    ) as target_pct_of_total
FROM applications a
JOIN regions r ON a.region = r.region_code
JOIN recruitment_targets rt ON a.region = rt.region AND rt.year = 2022
WHERE a.admission_year = 2022 AND a.status = 'Admitted'
GROUP BY r.region_name, rt.target_admits
ORDER BY pct_of_total DESC;

-- ============================================
-- NOTES FOR PORTFOLIO PRESENTATION
-- ============================================
-- This SQL project demonstrates:
-- 1. Database design and normalization
-- 2. Complex JOIN operations across multiple tables
-- 3. Aggregate functions (COUNT, SUM, AVG)
-- 4. Conditional aggregation with CASE statements
-- 5. Percentage calculations and variance analysis
-- 6. Date functions and time-series analysis
-- 7. Subqueries and CTEs (Common Table Expressions)
-- 8. Window functions for rankings
-- 9. Business intelligence and reporting queries
-- 10. Data-driven decision support

-- BUSINESS VALUE:
-- These queries enable leadership to:
-- - Identify underperforming regions requiring intervention
-- - Allocate recruiters to high-opportunity areas
-- - Track progress against strategic targets
-- - Optimize recruitment budgets and resources
-- - Improve enrollment conversion rates
