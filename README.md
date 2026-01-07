# University Recruitment Analytics - SQL Portfolio Project

**Author:** Rachael Elseman  
**Date:** January 2026  
**Tools:** SQL (PostgreSQL/MySQL compatible), Database Design, Business Intelligence

## 📊 Project Overview

This SQL project demonstrates advanced data analysis capabilities applied to real-world university recruitment operations. Based on actual dashboard work managing 755+ applications across multiple regions, this project showcases how SQL can transform raw data into actionable business intelligence.

### Business Context

As Associate Director of Recruitment at Northeastern State University, I managed recruitment operations across seven distinct geographic regions. Leadership needed real-time visibility into application trends, performance against targets, and data-driven insights for resource allocation.

This SQL implementation recreates the analytical framework that enabled:
- 30% increase in overall applications
- Strategic reallocation of recruitment resources
- Early identification of underperforming regions
- Data-driven decision making at the executive level

## 🎯 Key Business Questions Answered

1. **Which regions are meeting recruitment targets?**
2. **How does this year compare to last year?**
3. **Which high schools are our best recruitment sources?**
4. **What are our enrollment conversion rates by region?**
5. **When do applications peak during recruitment season?**
6. **How are individual recruiters performing?**
7. **Which schools need additional attention?**
8. **What's our regional market share?**

## 🗄️ Database Schema

### Tables

**applications** - Core recruitment data
- `application_id` (Primary Key)
- `student_first_name`, `student_last_name`
- `region` (Foreign Key to regions)
- `high_school`
- `application_date`
- `admission_year`
- `status` (Admitted, Denied, Pending)
- `enrolled` (Boolean)

**regions** - Geographic territory management
- `region_code` (Primary Key)
- `region_name`
- `recruiter_name`
- `territory_description`

**recruitment_targets** - Performance benchmarks
- `target_id` (Primary Key)
- `year`
- `region` (Foreign Key)
- `target_admits`
- `target_enrolled`

**high_schools** - Recruitment source tracking
- `school_id` (Primary Key)
- `school_name`
- `city`, `state`
- `region` (Foreign Key)
- `student_population`

### Entity Relationship Diagram

```
applications ──┬─── regions
               │
               └─── high_schools
               
recruitment_targets ─── regions
```

## 💡 SQL Techniques Demonstrated

### Core Skills
- ✅ Database design and normalization
- ✅ Complex JOIN operations (INNER, LEFT, multiple table joins)
- ✅ Aggregate functions (COUNT, SUM, AVG, MIN, MAX)
- ✅ GROUP BY with multiple dimensions
- ✅ Conditional aggregation using CASE statements

### Advanced Skills
- ✅ Percentage calculations and variance analysis
- ✅ Year-over-year comparison queries
- ✅ Subqueries for benchmarking
- ✅ Common Table Expressions (CTEs)
- ✅ Date functions and time-series analysis
- ✅ NULL handling with NULLIF
- ✅ Data formatting with DATE_FORMAT/ROUND

### Business Intelligence
- ✅ Performance vs. target analysis
- ✅ Trend identification
- ✅ Market share calculations
- ✅ Conversion rate analysis
- ✅ Top N analysis
- ✅ Decline detection

## 📈 Sample Query Results

### Year-Over-Year Performance

| Region | 2021 Admits | 2022 Admits | Change | % Change |
|--------|-------------|-------------|--------|----------|
| Southeast | 310 | 180 | -130 | -41.94% |
| Northwest | 242 | 189 | -53 | -21.90% |
| Northeast | 423 | 185 | -238 | -56.26% |

**Key Insight:** Northeast region declined significantly, requiring immediate intervention and resource reallocation.

### Top Performing High Schools

| School | City | 2022 Admits |
|--------|------|-------------|
| East Central High School | Tulsa | 8 |
| Muskogee High School | Muskogee | 4 |
| Memorial High School | Tulsa | 4 |

**Key Insight:** Tulsa metro schools dominate recruitment - strengthen partnerships in underrepresented areas.

## 🚀 How to Use This Project

### Option 1: SQLite (Easiest)
```bash
# Copy the SQL file content
# Paste into SQLite Online (sqliteonline.com)
# Run the entire script
# Execute individual queries to see results
```

### Option 2: MySQL
```bash
# Install MySQL locally
mysql -u root -p
CREATE DATABASE recruitment_analytics;
USE recruitment_analytics;
SOURCE recruitment_analytics.sql;
```

### Option 3: PostgreSQL
```bash
# Using psql
createdb recruitment_analytics
psql recruitment_analytics < recruitment_analytics.sql
```

## 📊 Visualizing Results

After running queries, export results to:
- **Google Sheets** for quick charts
- **Excel** for pivot tables and dashboards
- **Tableau/Power BI** for advanced visualization
- **Python (pandas + matplotlib)** for custom analysis

## 🎓 Skills Transferable To

This analytical framework applies to:
- **Sales Operations:** Pipeline analysis, quota attainment, territory performance
- **Marketing Analytics:** Campaign ROI, channel performance, conversion tracking
- **Customer Success:** Retention rates, health scores, expansion opportunities
- **Nonprofit Programs:** Grant outcomes, program metrics, donor analysis
- **Event Management:** Attendance trends, sponsor value, participant engagement

## 📝 Real-World Impact

When implemented in production:
- **Reduced reporting time:** 4 hours → 30 minutes weekly (87% efficiency gain)
- **Enabled proactive management:** Early warning system for underperforming regions
- **Informed strategy:** Data-driven insights led to 30% application increase
- **Optimized resources:** 2 recruiters reallocated to high-opportunity territories

## 🔗 Connect

**LinkedIn:** [linkedin.com/in/rachaelelseman](https://linkedin.com/in/rachaelelseman)  
**Portfolio:** [View other projects](https://github.com/rachaelelseman)  
**Email:** elsemanr@alumni.nsuok.edu

## 📚 Additional Resources

- [Mode Analytics SQL Tutorial](https://mode.com/sql-tutorial/) - How I learned SQL
- [SQL Style Guide](https://www.sqlstyle.guide/) - Writing clean, readable queries
- [PostgreSQL Documentation](https://www.postgresql.org/docs/) - Advanced SQL reference

---

*This project demonstrates SQL proficiency for operations, analytics, and business intelligence roles. The schema and queries are production-ready and follow industry best practices.*
