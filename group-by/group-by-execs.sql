-- Q1
SELECT COUNT("endDate") AS "currentExperiences" FROM experiences;
-- Q2
SELECT "userId" id, COUNT(educations) FROM educations GROUP BY "userId";
-- Q3
SELECT users.name writer, COUNT(testimonials) testimonialCount FROM testimonials JOIN users ON testimonials."writerId"=users.id WHERE users.id=435 GROUP BY writer;
-- Q4
SELECT MAX(salary) "maximumSalary", roles.name AS role FROM jobs JOIN roles ON jobs."roleId"=roles.id GROUP BY role;
-- Q5(Bonus)
SELECT schools.name school, courses.name course, COUNT("userId") "studentsCount", e.status AS role FROM educations AS e JOIN schools ON schools.id=e."schoolId" JOIN courses ON courses.id=e."courseId" WHERE e.status='ongoing' OR e.status='finished' GROUP BY school, course, role ORDER BY "studentsCount" DESC LIMIT 3;
