USE credit_risk;

SELECT 
    COUNT(*) AS total_loans,
    ROUND(SUM(loan_amnt), 2) AS total_exposure,
    ROUND(AVG(loan_amnt), 2) AS avg_loan_amount,
    ROUND(AVG(int_rate), 2) AS avg_interest_rate,
    ROUND(AVG(is_default) * 100, 2) AS default_rate_pct,
    ROUND(AVG(is_late) * 100, 2) AS late_rate_pct,
    ROUND(AVG(is_recovered) * 100, 2) AS recovery_rate_pct
FROM loans;

SELECT 
    loan_status,
    COUNT(*) AS total_loans,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER(), 2) AS pct_share
FROM loans
GROUP BY loan_status
ORDER BY total_loans DESC;

SELECT 
    SUM(CASE WHEN is_late = 0 AND is_default = 0 THEN 1 END) AS current_loans,
    SUM(CASE WHEN is_late = 1 THEN 1 END) AS late_loans,
    SUM(CASE WHEN is_default = 1 THEN 1 END) AS default_loans
FROM loans;

SELECT 
    is_late,
    COUNT(*) AS total_loans,
    ROUND(AVG(is_default) * 100, 2) AS default_rate_pct
FROM loans
GROUP BY is_late;

SELECT 
    income_group,
    COUNT(*) AS total_customers,
    ROUND(AVG(is_default) * 100, 2) AS default_rate_pct,
    ROUND(AVG(is_late) * 100, 2) AS late_rate_pct,
    ROUND(AVG(is_recovered) * 100, 2) AS recovery_rate_pct
FROM loans
GROUP BY income_group
ORDER BY default_rate_pct DESC;

SELECT 
    loan_size,
    COUNT(*) AS total_loans,
    ROUND(AVG(is_default) * 100, 2) AS default_rate_pct,
    ROUND(AVG(is_late) * 100, 2) AS late_rate_pct
FROM loans
GROUP BY loan_size
ORDER BY default_rate_pct DESC;

SELECT 
    FLOOR(int_rate) AS interest_bucket,
    COUNT(*) AS total_loans,
    ROUND(AVG(is_default) * 100, 2) AS default_rate_pct
FROM loans
GROUP BY interest_bucket
ORDER BY interest_bucket;

SELECT 
    issue_year,
    issue_month,
    COUNT(*) AS total_loans,
    ROUND(AVG(is_default) * 100, 2) AS default_rate_pct
FROM loans
GROUP BY issue_year, issue_month
ORDER BY issue_year, issue_month;

SELECT 
    income_group,
    COUNT(*) AS total_loans,
    SUM(is_recovered) AS recovered_loans,
    ROUND(SUM(is_recovered) * 100.0 / COUNT(*), 2) AS recovery_rate_pct
FROM loans
GROUP BY income_group
ORDER BY recovery_rate_pct DESC;

SELECT 
    income_group,
    loan_size,
    FLOOR(int_rate) AS interest_bucket,
    COUNT(*) AS total_loans,
    ROUND(AVG(is_default) * 100, 2) AS default_rate_pct
FROM loans
GROUP BY income_group, loan_size, interest_bucket
HAVING COUNT(*) > 50
ORDER BY default_rate_pct DESC;

SELECT 
    SUM(CASE WHEN is_default = 1 THEN loan_amnt ELSE 0 END) AS total_default_exposure,
    SUM(loan_amnt) AS total_portfolio,
    ROUND(
        SUM(CASE WHEN is_default = 1 THEN loan_amnt ELSE 0 END) * 100.0 / 
        SUM(loan_amnt), 2
    ) AS exposure_default_pct
FROM loans;

SELECT 
    high_risk_flag,
    COUNT(*) AS total_loans,
    ROUND(AVG(is_default) * 100, 2) AS default_rate_pct
FROM loans
GROUP BY high_risk_flag;

