-- Tạo mới CSDL trong SQL
-- Cú pháp
-- CREATE DATABASE <database_name>;
CREATE DATABASE employees
ON
(NAME = 'employees_data',
	FILENAME = 'E:\SQL\MSSQL\bai_35\employees_data.mdf',
	SIZE = 10MB,
	MAXSIZE = 100MB,
	FILEGROWTH = 5MB)
LOG ON
(NAME ='employees_log',
	FILENAME = 'E:\SQL\MSSQL\bai_35\employees_log.ldf',
	SIZE = 5MB,
	MAXSIZE = 50MB,
	FILEGROWTH = 1MB);