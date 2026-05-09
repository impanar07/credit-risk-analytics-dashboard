# Credit Risk Collections Analytics Dashboard

A professional end-to-end data analytics project that combines Python data preprocessing, SQL-based credit-risk analysis, and an interactive Power BI dashboard. The project analyzes Lending Club loan data to monitor portfolio health, identify high-risk borrower segments, and support data-driven collections decisions.

![Credit Risk Portfolio KPI Snapshot](assets/portfolio-kpi-snapshot.png)

## Project Overview

Financial institutions need reliable visibility into delinquency, default exposure, recovery performance, and borrower risk patterns. This project transforms raw loan data into a cleaned analytics dataset, loads it into a MySQL database, runs SQL analysis for portfolio and collections metrics, and presents the results in Power BI.

The final dashboard helps stakeholders answer key questions:

- What is the overall loan portfolio exposure?
- How many loans are current, late, charged off, or recovered?
- Which borrower segments show higher default risk?
- How do income group, loan size, and interest rate relate to default behavior?
- Where should collections teams focus intervention efforts?

## Business Problem

Loan portfolios can lose value when delinquency and charge-off patterns are not monitored early enough. Collections teams need a clear view of repayment behavior, default trends, and recovery performance to prioritize accounts and reduce financial losses.

This project solves that problem by building a complete analytics workflow that moves from raw data preparation to SQL analysis and Power BI reporting.

## Files Combined in This Project

| File | Role in Project |
| --- | --- |
| `Data_preprocessing.ipynb` | Cleans the raw Lending Club dataset, handles missing values, creates risk flags and borrower segments, exports `cleaned_loans.csv`, and loads the table into MySQL. |
| `SQL.sql` | Runs portfolio, default, recovery, exposure, and segmentation analysis on the cleaned `loans` table. |
| `Dashboard_project.pbix` | Power BI dashboard used to visualize KPIs, risk patterns, borrower segmentation, and collections performance. |

## Dataset

The project uses Lending Club loan data from `lending_club_loan_two.csv`.

| Attribute | Value |
| --- | ---: |
| Raw records | 396,030 |
| Raw columns | 27 |
| Cleaned records | 396,030 |
| Cleaned columns | 35 |
| Database | `credit_risk` |
| Main table | `loans` |
| Dashboard | `Dashboard_project.pbix` |

## Tools and Technologies

- Python
- Jupyter Notebook
- Pandas
- NumPy
- Matplotlib
- SQLAlchemy
- PyMySQL
- MySQL
- Power BI

## Project Workflow

```text
Raw Lending Club CSV
        ->
Python / Jupyter preprocessing
        ->
Cleaned loan dataset
        ->
MySQL database table: credit_risk.loans
        ->
SQL portfolio and risk analysis
        ->
Power BI dashboard
```

## Data Preprocessing

The preprocessing notebook prepares the raw dataset for analysis and dashboarding.

Key steps include:

- Load `lending_club_loan_two.csv` using Pandas.
- Inspect shape, columns, data types, missing values, mean, and median statistics.
- Fill missing numeric values with median values for `pub_rec_bankruptcies`, `mort_acc`, and `revol_util`.
- Fill missing categorical values with mode values for `emp_title`, `emp_length`, and `title`.
- Remove duplicate rows.
- Clean and convert `int_rate` into numeric format.
- Standardize `loan_status` text values.
- Engineer analytical flags:
  - `is_default`
  - `is_late`
  - `is_recovered`
  - `high_risk_flag`
- Create borrower and loan segments:
  - `income_group`
  - `loan_size`
- Extract issue-date features:
  - `issue_year`
  - `issue_month`
- Export the final cleaned dataset as `cleaned_loans.csv`.
- Load the cleaned data into MySQL table `credit_risk.loans`.

## SQL Analysis

The SQL script calculates portfolio-level and segment-level risk metrics.

Analysis areas include:

- Total loans, total exposure, average loan amount, and average interest rate.
- Default rate, late rate, and recovery rate.
- Loan status distribution.
- Current, late, and default loan counts.
- Default behavior by late-payment status.
- Default and recovery performance by income group.
- Default and late-payment performance by loan size.
- Default rate by interest-rate bucket.
- Monthly and yearly default trends.
- Combined segmentation by income group, loan size, and interest bucket.
- Default exposure as a percentage of total portfolio exposure.
- High-risk loan flag analysis.

## Power BI Dashboard

The Power BI dashboard turns the cleaned data and SQL insights into an interactive business reporting layer.

Dashboard focus areas:

- Executive portfolio KPI view.
- Loan status and repayment outcome monitoring.
- Default-risk segmentation by borrower income and loan size.
- Interest-rate bucket analysis.
- Time-based loan volume and default trend tracking.
- Drill-down views for deeper borrower segment analysis.

![Power BI Dashboard Structure](assets/power-bi-dashboard-structure.png)

## Key Visuals

### Loan Status Distribution

Shows the split of repayment outcomes across the portfolio.

![Loan Status Distribution](assets/loan-status-distribution.png)

### Default Rate by Income Group and Loan Size

Highlights borrower and loan-size segments with higher credit risk.

![Default Rate by Income and Loan Size](assets/default-rate-income-loan-size.png)

### Default Rate by Interest Bucket

Shows how default rates vary across interest-rate ranges.

![Default Rate by Interest Bucket](assets/default-rate-interest-bucket.png)

### Loan Volume and Default Trend

Compares loan volume and default rate over time.

![Loan Volume and Default Trend](assets/loan-volume-default-trend.png)

## Portfolio Snapshot

| Metric | Value |
| --- | ---: |
| Total loans | 396,030 |
| Total exposure | $5,589,523,100.00 |
| Average loan amount | $14,113.89 |
| Average interest rate | 13.64% |
| Default rate | 19.61% |
| Recovery rate | 80.39% |
| Default exposure | $1,174,905,175.00 |
| Default exposure percentage | 21.02% |

## Key Insights

- The portfolio contains more than 396K loan records and over $5.5B in total loan exposure.
- Charged-off loans account for a significant share of portfolio risk.
- Default rates vary across income groups, loan sizes, and interest-rate buckets.
- Interest-rate buckets provide a useful view for understanding pricing-related risk.
- High-risk flags help separate loans requiring closer collections monitoring.
- The dashboard gives stakeholders a single view of exposure, repayment outcomes, default behavior, and recovery performance.

## Project Structure

```text
.
|-- Data_preprocessing.ipynb
|-- SQL.sql
|-- Dashboard_project.pbix
|-- lending_club_loan_two.csv
|-- cleaned_loans.csv
|-- README.md
`-- assets/
    |-- portfolio-kpi-snapshot.png
    |-- power-bi-dashboard-structure.png
    |-- loan-status-distribution.png
    |-- default-rate-income-loan-size.png
    |-- default-rate-interest-bucket.png
    `-- loan-volume-default-trend.png
```

## How to Run the Project

1. Clone the repository.

```bash
git clone https://github.com/<your-username>/<your-repository>.git
cd <your-repository>
```

2. Install Python dependencies.

```bash
pip install pandas numpy matplotlib sqlalchemy pymysql jupyter
```

3. Create the MySQL database.

```sql
CREATE DATABASE credit_risk;
USE credit_risk;
```

4. Run the preprocessing notebook.

```bash
jupyter notebook Data_preprocessing.ipynb
```

5. Export `cleaned_loans.csv` and load it into the `credit_risk.loans` table using the notebook upload step.

6. Run the SQL analysis script.

```sql
SOURCE SQL.sql;
```

7. Open `Dashboard_project.pbix` in Power BI Desktop and refresh the data connection.

## Skills Demonstrated

- Data cleaning and preprocessing with Python.
- Missing-value treatment and duplicate handling.
- Feature engineering for credit-risk analysis.
- SQL aggregation, segmentation, and portfolio metric analysis.
- Power BI dashboard design and business reporting.
- End-to-end analytics workflow development.

# Author
## Impana R
