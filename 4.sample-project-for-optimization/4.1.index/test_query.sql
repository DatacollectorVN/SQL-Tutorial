USE employees;
SELECT COUNT(*)
FROM salaries

-- Before index: 0.3s
-- After index: 0.25s