-- 초롱대학교 (MariaDB) DDL 및 더미 데이터 삽입 스크립트
CREATE DATABASE IF NOT EXISTS chorong_db DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE chorong_db;

SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS Student;
DROP TABLE IF EXISTS Professor;
DROP TABLE IF EXISTS Department;
DROP TABLE IF EXISTS Faculty;
SET FOREIGN_KEY_CHECKS = 1;

-- 1. 학부(Faculty) 테이블
CREATE TABLE Faculty (
    faculty_code VARCHAR(10) PRIMARY KEY COMMENT '학부코드',
    faculty_name VARCHAR(50) NOT NULL COMMENT '학부이름',
    dean_name VARCHAR(30) COMMENT '학부장명',
    office_location VARCHAR(100) COMMENT '사무실위치'
);

-- 2. 학과(Department) 테이블
CREATE TABLE Department (
    department_code VARCHAR(10) PRIMARY KEY COMMENT '학과코드',
    department_name VARCHAR(50) NOT NULL COMMENT '학과이름',
    faculty_code VARCHAR(10) COMMENT '소속학부코드',
    FOREIGN KEY (faculty_code) REFERENCES Faculty(faculty_code) ON DELETE SET NULL
);

-- 3. 교수(Professor) 테이블
CREATE TABLE Professor (
    professor_id VARCHAR(10) PRIMARY KEY COMMENT '교번',
    name VARCHAR(30) NOT NULL COMMENT '이름',
    email VARCHAR(100) COMMENT '이메일',
    phone VARCHAR(20) COMMENT '전화번호',
    department_code VARCHAR(10) COMMENT '소속학과코드',
    FOREIGN KEY (department_code) REFERENCES Department(department_code) ON DELETE SET NULL
);

-- 4. 학생(Student) 테이블
CREATE TABLE Student (
    student_id INT PRIMARY KEY COMMENT '학번',
    name VARCHAR(30) NOT NULL COMMENT '이름',
    grade INT COMMENT '학년',
    entrance_year INT COMMENT '입학년도',
    department_code VARCHAR(10) COMMENT '소속학과코드',
    professor_id VARCHAR(10) COMMENT '지도교수_교번',
    FOREIGN KEY (department_code) REFERENCES Department(department_code) ON DELETE SET NULL,
    FOREIGN KEY (professor_id) REFERENCES Professor(professor_id) ON DELETE SET NULL
);

-- ============================================
-- 데이터 삽입
-- ============================================

INSERT INTO Faculty (faculty_code, faculty_name, dean_name, office_location) VALUES ('F1', '융합소프트웨어대학', '정약용', '제1학술관 101호');
INSERT INTO Faculty (faculty_code, faculty_name, dean_name, office_location) VALUES ('F2', '글로벌경영대학', '장영실', '제2학술관 202호');
INSERT INTO Faculty (faculty_code, faculty_name, dean_name, office_location) VALUES ('F3', '창의디자인대학', '이순신', '제3학술관 303호');

INSERT INTO Department (department_code, department_name, faculty_code) VALUES ('D11', '소프트웨어학과', 'F1');
INSERT INTO Department (department_code, department_name, faculty_code) VALUES ('D12', '인공지능학과', 'F1');
INSERT INTO Department (department_code, department_name, faculty_code) VALUES ('D21', '경영지원학과', 'F2');
INSERT INTO Department (department_code, department_name, faculty_code) VALUES ('D22', '글로벌회계학과', 'F2');
INSERT INTO Department (department_code, department_name, faculty_code) VALUES ('D31', '시각정보디자인학과', 'F3');
INSERT INTO Department (department_code, department_name, faculty_code) VALUES ('D32', '산업공간디자인학과', 'F3');

INSERT INTO Professor (professor_id, name, email, phone, department_code) VALUES ('P001', '한도윤', 'prof1@chorong.ac.kr', '010-2528-8459', 'D11');
INSERT INTO Professor (professor_id, name, email, phone, department_code) VALUES ('P002', '신민준', 'prof2@chorong.ac.kr', '010-8306-9034', 'D11');
INSERT INTO Professor (professor_id, name, email, phone, department_code) VALUES ('P003', '유지호', 'prof3@chorong.ac.kr', '010-7167-6283', 'D11');
INSERT INTO Professor (professor_id, name, email, phone, department_code) VALUES ('P004', '배지안', 'prof4@chorong.ac.kr', '010-9003-6557', 'D11');
INSERT INTO Professor (professor_id, name, email, phone, department_code) VALUES ('P005', '전주원', 'prof5@chorong.ac.kr', '010-9004-2487', 'D12');
INSERT INTO Professor (professor_id, name, email, phone, department_code) VALUES ('P006', '문채원', 'prof6@chorong.ac.kr', '010-2010-4856', 'D12');
INSERT INTO Professor (professor_id, name, email, phone, department_code) VALUES ('P007', '손건우', 'prof7@chorong.ac.kr', '010-2327-3184', 'D12');
INSERT INTO Professor (professor_id, name, email, phone, department_code) VALUES ('P008', '황시우', 'prof8@chorong.ac.kr', '010-7595-4075', 'D12');
INSERT INTO Professor (professor_id, name, email, phone, department_code) VALUES ('P009', '윤시아', 'prof9@chorong.ac.kr', '010-3050-3284', 'D21');
INSERT INTO Professor (professor_id, name, email, phone, department_code) VALUES ('P010', '문서연', 'prof10@chorong.ac.kr', '010-4220-2809', 'D21');
INSERT INTO Professor (professor_id, name, email, phone, department_code) VALUES ('P011', '임하은', 'prof11@chorong.ac.kr', '010-2695-7925', 'D21');
INSERT INTO Professor (professor_id, name, email, phone, department_code) VALUES ('P012', '고주원', 'prof12@chorong.ac.kr', '010-7425-2917', 'D21');
INSERT INTO Professor (professor_id, name, email, phone, department_code) VALUES ('P013', '서하준', 'prof13@chorong.ac.kr', '010-6585-1062', 'D22');
INSERT INTO Professor (professor_id, name, email, phone, department_code) VALUES ('P014', '이서윤', 'prof14@chorong.ac.kr', '010-1183-7338', 'D22');
INSERT INTO Professor (professor_id, name, email, phone, department_code) VALUES ('P015', '문민준', 'prof15@chorong.ac.kr', '010-2046-9256', 'D22');
INSERT INTO Professor (professor_id, name, email, phone, department_code) VALUES ('P016', '유하준', 'prof16@chorong.ac.kr', '010-5316-3460', 'D22');
INSERT INTO Professor (professor_id, name, email, phone, department_code) VALUES ('P017', '손시우', 'prof17@chorong.ac.kr', '010-6075-8459', 'D31');
INSERT INTO Professor (professor_id, name, email, phone, department_code) VALUES ('P018', '전채원', 'prof18@chorong.ac.kr', '010-2311-2695', 'D31');
INSERT INTO Professor (professor_id, name, email, phone, department_code) VALUES ('P019', '송서윤', 'prof19@chorong.ac.kr', '010-1734-6358', 'D31');
INSERT INTO Professor (professor_id, name, email, phone, department_code) VALUES ('P020', '강우진', 'prof20@chorong.ac.kr', '010-2801-1579', 'D31');
INSERT INTO Professor (professor_id, name, email, phone, department_code) VALUES ('P021', '송선우', 'prof21@chorong.ac.kr', '010-2171-9872', 'D32');
INSERT INTO Professor (professor_id, name, email, phone, department_code) VALUES ('P022', '홍도윤', 'prof22@chorong.ac.kr', '010-6761-6127', 'D32');
INSERT INTO Professor (professor_id, name, email, phone, department_code) VALUES ('P023', '최지아', 'prof23@chorong.ac.kr', '010-4374-9950', 'D32');
INSERT INTO Professor (professor_id, name, email, phone, department_code) VALUES ('P024', '고우진', 'prof24@chorong.ac.kr', '010-5024-7234', 'D32');

INSERT INTO Student (student_id, name, grade, entrance_year, department_code, professor_id) VALUES (20240001, '강시아', 3, 2022, 'D12', 'P006');
INSERT INTO Student (student_id, name, grade, entrance_year, department_code, professor_id) VALUES (20240002, '서주원', 2, 2023, 'D12', 'P005');
INSERT INTO Student (student_id, name, grade, entrance_year, department_code, professor_id) VALUES (20240003, '전하린', 3, 2022, 'D11', 'P003');
INSERT INTO Student (student_id, name, grade, entrance_year, department_code, professor_id) VALUES (20240004, '안도윤', 4, 2021, 'D31', 'P020');
INSERT INTO Student (student_id, name, grade, entrance_year, department_code, professor_id) VALUES (20240005, '양민재', 3, 2022, 'D31', 'P019');
INSERT INTO Student (student_id, name, grade, entrance_year, department_code, professor_id) VALUES (20240006, '이지아', 4, 2021, 'D21', 'P010');
INSERT INTO Student (student_id, name, grade, entrance_year, department_code, professor_id) VALUES (20240007, '황준우', 4, 2021, 'D12', 'P008');
INSERT INTO Student (student_id, name, grade, entrance_year, department_code, professor_id) VALUES (20240008, '안지훈', 2, 2023, 'D32', 'P023');
INSERT INTO Student (student_id, name, grade, entrance_year, department_code, professor_id) VALUES (20240009, '서주원', 3, 2022, 'D22', 'P013');
INSERT INTO Student (student_id, name, grade, entrance_year, department_code, professor_id) VALUES (20240010, '박지민', 3, 2022, 'D12', 'P006');
INSERT INTO Student (student_id, name, grade, entrance_year, department_code, professor_id) VALUES (20240011, '장시우', 3, 2022, 'D11', 'P001');
INSERT INTO Student (student_id, name, grade, entrance_year, department_code, professor_id) VALUES (20240012, '안수아', 4, 2021, 'D32', 'P023');
INSERT INTO Student (student_id, name, grade, entrance_year, department_code, professor_id) VALUES (20240013, '홍서현', 1, 2024, 'D21', 'P012');
INSERT INTO Student (student_id, name, grade, entrance_year, department_code, professor_id) VALUES (20240014, '최우진', 3, 2022, 'D11', 'P004');
INSERT INTO Student (student_id, name, grade, entrance_year, department_code, professor_id) VALUES (20240015, '서지훈', 2, 2023, 'D21', 'P012');
INSERT INTO Student (student_id, name, grade, entrance_year, department_code, professor_id) VALUES (20240016, '박지율', 4, 2021, 'D12', 'P006');
INSERT INTO Student (student_id, name, grade, entrance_year, department_code, professor_id) VALUES (20240017, '장지우', 2, 2023, 'D11', 'P002');
INSERT INTO Student (student_id, name, grade, entrance_year, department_code, professor_id) VALUES (20240018, '신도윤', 3, 2022, 'D11', 'P004');
INSERT INTO Student (student_id, name, grade, entrance_year, department_code, professor_id) VALUES (20240019, '이연우', 1, 2024, 'D11', 'P001');
INSERT INTO Student (student_id, name, grade, entrance_year, department_code, professor_id) VALUES (20240020, '장예은', 1, 2024, 'D12', 'P007');
INSERT INTO Student (student_id, name, grade, entrance_year, department_code, professor_id) VALUES (20240021, '윤수아', 2, 2023, 'D12', 'P007');
INSERT INTO Student (student_id, name, grade, entrance_year, department_code, professor_id) VALUES (20240022, '한예은', 4, 2021, 'D11', 'P001');
INSERT INTO Student (student_id, name, grade, entrance_year, department_code, professor_id) VALUES (20240023, '권채원', 2, 2023, 'D12', 'P005');
INSERT INTO Student (student_id, name, grade, entrance_year, department_code, professor_id) VALUES (20240024, '최서현', 1, 2024, 'D32', 'P024');
INSERT INTO Student (student_id, name, grade, entrance_year, department_code, professor_id) VALUES (20240025, '홍지호', 3, 2022, 'D22', 'P016');
INSERT INTO Student (student_id, name, grade, entrance_year, department_code, professor_id) VALUES (20240026, '신하은', 2, 2023, 'D21', 'P009');
INSERT INTO Student (student_id, name, grade, entrance_year, department_code, professor_id) VALUES (20240027, '이지우', 2, 2023, 'D31', 'P019');
INSERT INTO Student (student_id, name, grade, entrance_year, department_code, professor_id) VALUES (20240028, '송하준', 2, 2023, 'D12', 'P007');
INSERT INTO Student (student_id, name, grade, entrance_year, department_code, professor_id) VALUES (20240029, '임하준', 1, 2024, 'D32', 'P021');
INSERT INTO Student (student_id, name, grade, entrance_year, department_code, professor_id) VALUES (20240030, '장서윤', 2, 2023, 'D22', 'P013');
INSERT INTO Student (student_id, name, grade, entrance_year, department_code, professor_id) VALUES (20240031, '서시아', 3, 2022, 'D21', 'P011');
INSERT INTO Student (student_id, name, grade, entrance_year, department_code, professor_id) VALUES (20240032, '전지민', 2, 2023, 'D31', 'P018');
INSERT INTO Student (student_id, name, grade, entrance_year, department_code, professor_id) VALUES (20240033, '최시우', 3, 2022, 'D32', 'P022');
INSERT INTO Student (student_id, name, grade, entrance_year, department_code, professor_id) VALUES (20240034, '신하린', 4, 2021, 'D32', 'P024');
INSERT INTO Student (student_id, name, grade, entrance_year, department_code, professor_id) VALUES (20240035, '장서현', 3, 2022, 'D12', 'P006');
INSERT INTO Student (student_id, name, grade, entrance_year, department_code, professor_id) VALUES (20240036, '홍건우', 4, 2021, 'D12', 'P007');
INSERT INTO Student (student_id, name, grade, entrance_year, department_code, professor_id) VALUES (20240037, '신하린', 4, 2021, 'D21', 'P012');
INSERT INTO Student (student_id, name, grade, entrance_year, department_code, professor_id) VALUES (20240038, '고예은', 4, 2021, 'D12', 'P006');
INSERT INTO Student (student_id, name, grade, entrance_year, department_code, professor_id) VALUES (20240039, '유주원', 3, 2022, 'D12', 'P008');
INSERT INTO Student (student_id, name, grade, entrance_year, department_code, professor_id) VALUES (20240040, '윤시아', 1, 2024, 'D21', 'P009');
INSERT INTO Student (student_id, name, grade, entrance_year, department_code, professor_id) VALUES (20240041, '권지우', 2, 2023, 'D31', 'P018');
INSERT INTO Student (student_id, name, grade, entrance_year, department_code, professor_id) VALUES (20240042, '권연우', 1, 2024, 'D12', 'P008');
INSERT INTO Student (student_id, name, grade, entrance_year, department_code, professor_id) VALUES (20240043, '정정우', 2, 2023, 'D32', 'P022');
INSERT INTO Student (student_id, name, grade, entrance_year, department_code, professor_id) VALUES (20240044, '전주원', 1, 2024, 'D21', 'P009');
INSERT INTO Student (student_id, name, grade, entrance_year, department_code, professor_id) VALUES (20240045, '강서진', 4, 2021, 'D31', 'P017');
INSERT INTO Student (student_id, name, grade, entrance_year, department_code, professor_id) VALUES (20240046, '최서윤', 3, 2022, 'D11', 'P003');
INSERT INTO Student (student_id, name, grade, entrance_year, department_code, professor_id) VALUES (20240047, '유채원', 4, 2021, 'D11', 'P003');
INSERT INTO Student (student_id, name, grade, entrance_year, department_code, professor_id) VALUES (20240048, '박수아', 1, 2024, 'D31', 'P017');
INSERT INTO Student (student_id, name, grade, entrance_year, department_code, professor_id) VALUES (20240049, '안서윤', 4, 2021, 'D32', 'P024');
INSERT INTO Student (student_id, name, grade, entrance_year, department_code, professor_id) VALUES (20240050, '서지훈', 1, 2024, 'D32', 'P021');
INSERT INTO Student (student_id, name, grade, entrance_year, department_code, professor_id) VALUES (20240051, '전서현', 1, 2024, 'D32', 'P023');
INSERT INTO Student (student_id, name, grade, entrance_year, department_code, professor_id) VALUES (20240052, '권하준', 4, 2021, 'D21', 'P010');
INSERT INTO Student (student_id, name, grade, entrance_year, department_code, professor_id) VALUES (20240053, '안지안', 3, 2022, 'D11', 'P002');
INSERT INTO Student (student_id, name, grade, entrance_year, department_code, professor_id) VALUES (20240054, '권지율', 4, 2021, 'D31', 'P019');
INSERT INTO Student (student_id, name, grade, entrance_year, department_code, professor_id) VALUES (20240055, '유채원', 1, 2024, 'D32', 'P024');
INSERT INTO Student (student_id, name, grade, entrance_year, department_code, professor_id) VALUES (20240056, '고지호', 1, 2024, 'D21', 'P009');
INSERT INTO Student (student_id, name, grade, entrance_year, department_code, professor_id) VALUES (20240057, '오준우', 2, 2023, 'D11', 'P003');
INSERT INTO Student (student_id, name, grade, entrance_year, department_code, professor_id) VALUES (20240058, '조연우', 4, 2021, 'D22', 'P015');
INSERT INTO Student (student_id, name, grade, entrance_year, department_code, professor_id) VALUES (20240059, '전도윤', 1, 2024, 'D12', 'P007');
INSERT INTO Student (student_id, name, grade, entrance_year, department_code, professor_id) VALUES (20240060, '강서연', 3, 2022, 'D11', 'P001');
INSERT INTO Student (student_id, name, grade, entrance_year, department_code, professor_id) VALUES (20240061, '손지율', 4, 2021, 'D22', 'P015');
INSERT INTO Student (student_id, name, grade, entrance_year, department_code, professor_id) VALUES (20240062, '임시아', 3, 2022, 'D31', 'P018');
INSERT INTO Student (student_id, name, grade, entrance_year, department_code, professor_id) VALUES (20240063, '장채원', 2, 2023, 'D31', 'P017');
INSERT INTO Student (student_id, name, grade, entrance_year, department_code, professor_id) VALUES (20240064, '장연우', 2, 2023, 'D12', 'P005');
INSERT INTO Student (student_id, name, grade, entrance_year, department_code, professor_id) VALUES (20240065, '임서연', 2, 2023, 'D12', 'P008');
INSERT INTO Student (student_id, name, grade, entrance_year, department_code, professor_id) VALUES (20240066, '문서현', 3, 2022, 'D32', 'P024');
INSERT INTO Student (student_id, name, grade, entrance_year, department_code, professor_id) VALUES (20240067, '양지안', 2, 2023, 'D32', 'P024');
INSERT INTO Student (student_id, name, grade, entrance_year, department_code, professor_id) VALUES (20240068, '안민준', 3, 2022, 'D12', 'P008');
INSERT INTO Student (student_id, name, grade, entrance_year, department_code, professor_id) VALUES (20240069, '장건우', 2, 2023, 'D21', 'P010');
INSERT INTO Student (student_id, name, grade, entrance_year, department_code, professor_id) VALUES (20240070, '조주원', 4, 2021, 'D32', 'P024');
INSERT INTO Student (student_id, name, grade, entrance_year, department_code, professor_id) VALUES (20240071, '장지우', 1, 2024, 'D22', 'P016');
INSERT INTO Student (student_id, name, grade, entrance_year, department_code, professor_id) VALUES (20240072, '서지민', 3, 2022, 'D11', 'P001');
INSERT INTO Student (student_id, name, grade, entrance_year, department_code, professor_id) VALUES (20240073, '정시우', 3, 2022, 'D22', 'P016');
INSERT INTO Student (student_id, name, grade, entrance_year, department_code, professor_id) VALUES (20240074, '문지우', 3, 2022, 'D22', 'P015');
INSERT INTO Student (student_id, name, grade, entrance_year, department_code, professor_id) VALUES (20240075, '신서연', 4, 2021, 'D21', 'P011');
INSERT INTO Student (student_id, name, grade, entrance_year, department_code, professor_id) VALUES (20240076, '신예은', 1, 2024, 'D22', 'P013');
INSERT INTO Student (student_id, name, grade, entrance_year, department_code, professor_id) VALUES (20240077, '임다은', 1, 2024, 'D32', 'P021');
INSERT INTO Student (student_id, name, grade, entrance_year, department_code, professor_id) VALUES (20240078, '조서현', 1, 2024, 'D32', 'P023');
INSERT INTO Student (student_id, name, grade, entrance_year, department_code, professor_id) VALUES (20240079, '손지우', 1, 2024, 'D31', 'P018');
INSERT INTO Student (student_id, name, grade, entrance_year, department_code, professor_id) VALUES (20240080, '황지훈', 4, 2021, 'D31', 'P018');
INSERT INTO Student (student_id, name, grade, entrance_year, department_code, professor_id) VALUES (20240081, '고지훈', 3, 2022, 'D11', 'P001');
INSERT INTO Student (student_id, name, grade, entrance_year, department_code, professor_id) VALUES (20240082, '신지아', 1, 2024, 'D11', 'P001');
INSERT INTO Student (student_id, name, grade, entrance_year, department_code, professor_id) VALUES (20240083, '전시우', 2, 2023, 'D11', 'P001');
INSERT INTO Student (student_id, name, grade, entrance_year, department_code, professor_id) VALUES (20240084, '신하은', 4, 2021, 'D32', 'P023');
INSERT INTO Student (student_id, name, grade, entrance_year, department_code, professor_id) VALUES (20240085, '최연우', 4, 2021, 'D12', 'P007');
INSERT INTO Student (student_id, name, grade, entrance_year, department_code, professor_id) VALUES (20240086, '이지율', 3, 2022, 'D31', 'P018');
INSERT INTO Student (student_id, name, grade, entrance_year, department_code, professor_id) VALUES (20240087, '송지안', 1, 2024, 'D32', 'P021');
INSERT INTO Student (student_id, name, grade, entrance_year, department_code, professor_id) VALUES (20240088, '신다은', 2, 2023, 'D12', 'P008');
INSERT INTO Student (student_id, name, grade, entrance_year, department_code, professor_id) VALUES (20240089, '권민재', 4, 2021, 'D31', 'P017');
INSERT INTO Student (student_id, name, grade, entrance_year, department_code, professor_id) VALUES (20240090, '배하린', 3, 2022, 'D11', 'P003');
INSERT INTO Student (student_id, name, grade, entrance_year, department_code, professor_id) VALUES (20240091, '전하린', 4, 2021, 'D12', 'P006');
INSERT INTO Student (student_id, name, grade, entrance_year, department_code, professor_id) VALUES (20240092, '고연우', 4, 2021, 'D32', 'P021');
INSERT INTO Student (student_id, name, grade, entrance_year, department_code, professor_id) VALUES (20240093, '임선우', 1, 2024, 'D21', 'P011');
INSERT INTO Student (student_id, name, grade, entrance_year, department_code, professor_id) VALUES (20240094, '장지민', 1, 2024, 'D11', 'P002');
INSERT INTO Student (student_id, name, grade, entrance_year, department_code, professor_id) VALUES (20240095, '윤지아', 1, 2024, 'D21', 'P009');
INSERT INTO Student (student_id, name, grade, entrance_year, department_code, professor_id) VALUES (20240096, '정채원', 3, 2022, 'D21', 'P012');
INSERT INTO Student (student_id, name, grade, entrance_year, department_code, professor_id) VALUES (20240097, '손지아', 4, 2021, 'D12', 'P005');
INSERT INTO Student (student_id, name, grade, entrance_year, department_code, professor_id) VALUES (20240098, '전하은', 4, 2021, 'D31', 'P018');
INSERT INTO Student (student_id, name, grade, entrance_year, department_code, professor_id) VALUES (20240099, '정지율', 2, 2023, 'D32', 'P022');
INSERT INTO Student (student_id, name, grade, entrance_year, department_code, professor_id) VALUES (20240100, '조주원', 1, 2024, 'D11', 'P003');
INSERT INTO Student (student_id, name, grade, entrance_year, department_code, professor_id) VALUES (20240101, '고지아', 3, 2022, 'D11', 'P002');
INSERT INTO Student (student_id, name, grade, entrance_year, department_code, professor_id) VALUES (20240102, '고지훈', 4, 2021, 'D12', 'P007');
INSERT INTO Student (student_id, name, grade, entrance_year, department_code, professor_id) VALUES (20240103, '전시아', 1, 2024, 'D32', 'P024');
INSERT INTO Student (student_id, name, grade, entrance_year, department_code, professor_id) VALUES (20240104, '최다은', 3, 2022, 'D32', 'P021');
INSERT INTO Student (student_id, name, grade, entrance_year, department_code, professor_id) VALUES (20240105, '유지호', 1, 2024, 'D32', 'P022');
INSERT INTO Student (student_id, name, grade, entrance_year, department_code, professor_id) VALUES (20240106, '김지아', 2, 2023, 'D22', 'P014');
INSERT INTO Student (student_id, name, grade, entrance_year, department_code, professor_id) VALUES (20240107, '서민준', 1, 2024, 'D22', 'P014');
INSERT INTO Student (student_id, name, grade, entrance_year, department_code, professor_id) VALUES (20240108, '임지아', 3, 2022, 'D21', 'P012');
INSERT INTO Student (student_id, name, grade, entrance_year, department_code, professor_id) VALUES (20240109, '양준우', 1, 2024, 'D21', 'P011');
INSERT INTO Student (student_id, name, grade, entrance_year, department_code, professor_id) VALUES (20240110, '임서윤', 1, 2024, 'D21', 'P011');
INSERT INTO Student (student_id, name, grade, entrance_year, department_code, professor_id) VALUES (20240111, '임지율', 3, 2022, 'D21', 'P011');
INSERT INTO Student (student_id, name, grade, entrance_year, department_code, professor_id) VALUES (20240112, '최주원', 3, 2022, 'D11', 'P004');
INSERT INTO Student (student_id, name, grade, entrance_year, department_code, professor_id) VALUES (20240113, '서채원', 2, 2023, 'D31', 'P020');
INSERT INTO Student (student_id, name, grade, entrance_year, department_code, professor_id) VALUES (20240114, '장서진', 3, 2022, 'D12', 'P008');
INSERT INTO Student (student_id, name, grade, entrance_year, department_code, professor_id) VALUES (20240115, '배예은', 3, 2022, 'D12', 'P005');
INSERT INTO Student (student_id, name, grade, entrance_year, department_code, professor_id) VALUES (20240116, '오채원', 4, 2021, 'D31', 'P019');
INSERT INTO Student (student_id, name, grade, entrance_year, department_code, professor_id) VALUES (20240117, '김우진', 4, 2021, 'D22', 'P015');
INSERT INTO Student (student_id, name, grade, entrance_year, department_code, professor_id) VALUES (20240118, '한채원', 4, 2021, 'D21', 'P011');
INSERT INTO Student (student_id, name, grade, entrance_year, department_code, professor_id) VALUES (20240119, '박지안', 4, 2021, 'D22', 'P013');
INSERT INTO Student (student_id, name, grade, entrance_year, department_code, professor_id) VALUES (20240120, '정지민', 3, 2022, 'D32', 'P022');
INSERT INTO Student (student_id, name, grade, entrance_year, department_code, professor_id) VALUES (20240121, '권예은', 2, 2023, 'D31', 'P019');
INSERT INTO Student (student_id, name, grade, entrance_year, department_code, professor_id) VALUES (20240122, '오지호', 4, 2021, 'D31', 'P019');
INSERT INTO Student (student_id, name, grade, entrance_year, department_code, professor_id) VALUES (20240123, '윤우진', 1, 2024, 'D22', 'P013');

