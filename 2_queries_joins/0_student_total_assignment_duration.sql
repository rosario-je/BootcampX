SELECT SUM(assignment_submissions.duration) AS total_duration
FROM assignments
JOIN assignment_submissions ON assignment_id = assignments.id
JOIN students ON students.id = assignment_submissions.student_id
WHERE students.name = 'Ibrahim Schimmel';
