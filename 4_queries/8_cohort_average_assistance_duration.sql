SELECT AVG(total_duration) AS average_total_duration
FROM (
  SELECT
  cohorts.name AS cohort,SUM(assistance_requests.completed_at - assistance_requests.started_at) AS total_duration
FROM
  cohorts
  JOIN students ON cohorts.id = cohort_id
  JOIN assistance_requests ON students.id = student_id
GROUP BY
  cohort
) AS subquery;