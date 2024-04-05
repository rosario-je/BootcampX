SELECT
  cohorts.name AS cohort,
  (AVG(assistance_requests.completed_at - assistance_requests.started_at)) AS average_assistance_time
FROM
  cohorts
  JOIN students ON cohort_id = cohorts.id
  JOIN assistance_requests ON student_id = students.id
GROUP BY
  cohort
ORDER BY
  average_assistance_time ASC;