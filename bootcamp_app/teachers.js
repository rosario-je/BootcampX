const { Pool } = require("pg");

const pool = new Pool({
  user: "development",
  password: "development",
  host: "localhost",
  database: "bootcampx",
});



pool.query(`
  SELECT
    teachers.name AS teacher,
    cohorts.name AS cohort
  FROM
    teachers
    JOIN assistance_requests ON teachers.id = assistance_requests.teacher_id
    JOIN students ON students.id = assistance_requests.student_id
    JOIN cohorts ON cohorts.id = students.cohort_id
  WHERE
    cohorts.name LIKE '%${process.argv[2]}%'
  GROUP BY
    teachers.name,
    cohorts.name
  ORDER BY
    teachers.name;
  `)
  .then((res) => {
    res.rows.forEach((teacher) => {
      console.log(`${teacher.cohort}: ${teacher.teacher}`);
    });
  })
  .catch((err) => console.error("query error", err.stack));


// .then((res) => {
//   console.log(res.rows);
// })
// .catch((err) => console.error("query error", err.stack));