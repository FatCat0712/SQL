
-- nên đặt charset cho các table khi tạo database để tránh bị xung đột

/*
CREATE TABLE student_2(
	studentID CHAR(20),
	givenName VARCHAR(30),
	surName VARCHAR(30),
	dateOfBirth DATETIME,
	yearEnrolled YEAR
);
*/

-- Tạo một bảng dựa trên cấu trúc của bảng đã có
CREATE TABLE student_3 AS
SELECT studentID,givenName,surName
FROM student
