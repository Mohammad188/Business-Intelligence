SELECT S.student_id, S.student_name, SU.subject_name, attended_exams=COUNT(E.student_id) FROM Students S
CROSS JOIN Subjects SU
LEFT OUTER JOIN Examinations E
ON S.student_id = E.student_id AND E.subject_name = SU.subject_name
GROUP BY S.student_id, S.student_name, SU.subject_name