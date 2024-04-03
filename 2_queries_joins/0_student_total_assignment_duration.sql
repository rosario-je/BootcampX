SELECT SUM(assignment_submissions.duration) AS total_duration
FROM assignments
JOIN assignment_submissions ON assignment_id = assignments.id
JOIN students ON students.id = assignment_submissions.student_id
WHERE students.name = 'Ibrahim Schimmel';

SELECT students.name AS student, COUNT(assignment_submissions.*) AS total_submissions
FROM assignment_submissions
JOIN students ON students.id = student_id
WHERE students.end_date IS NULL
GROUP BY students.name
HAVING COUNT(total_submissions < 100)