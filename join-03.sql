SELECT users.id, users.name, c.name course, s.name school, e."endDate" "endDate" FROM users INNER JOIN educations AS e ON status='finished' INNER JOIN courses AS c ON e."courseId"=c.id INNER JOIN schools AS s ON e."schoolId"=s.id WHERE users.id=30;