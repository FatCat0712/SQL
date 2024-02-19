-- Thêm một cột vào table
ALTER TABLE student_3
	ADD year VARCHAR(255); 
-- Xóa một cột khỏi table
ALTER TABLE student_3
	DROP COLUMN YEAR;
-- Thay đổi tên và kiểu dữ liệu của một column
ALTER TABLE student_3 CHANGE year address VARCHAR(255);
	
-- Chỉnh sửa kiểu dữ liệu của một cột trong table
ALTER TABLE student_3
	MODIFY COLUMN year INT;