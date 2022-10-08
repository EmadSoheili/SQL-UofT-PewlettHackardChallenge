-- Extract table filtered by birth_date
SELECT
	em.emp_no,
	em.first_name,
	em.last_name,
	ti.title,
	ti.from_date,
	ti.to_date
INTO retirement_titles
FROM 
	employees AS em
	LEFT JOIN
	titles AS ti
	ON
	em.emp_no = ti.emp_no
WHERE
	em.birth_date BETWEEN '1952-01-01' AND '1955-12-01'
ORDER BY
	em.emp_no ASC;


-- Extract distinct titles
SELECT DISTINCT ON (emp_no)
	emp_no,
	first_name,
	last_name,
	title
INTO
	unique_titles
FROM
	retirement_titles
WHERE
	to_date = '9999-01-01'
ORDER BY
	emp_no ASC, to_date DESC;
	

-- Extract number of employees by title
SELECT
	COUNT(title),
	title
INTO
	retiring_titles
FROM
	unique_titles
GROUP BY
	title
ORDER BY
	COUNT(title) DESC;