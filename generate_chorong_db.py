import random

# 학부 3개
faculties = [
    ('F1', '융합소프트웨어대학', '정약용', '제1학술관 101호'),
    ('F2', '글로벌경영대학', '장영실', '제2학술관 202호'),
    ('F3', '창의디자인대학', '이순신', '제3학술관 303호')
]

# 학과 6개 (학부당 2개)
departments = [
    ('D11', '소프트웨어학과', 'F1'),
    ('D12', '인공지능학과', 'F1'),
    ('D21', '경영지원학과', 'F2'),
    ('D22', '글로벌회계학과', 'F2'),
    ('D31', '시각정보디자인학과', 'F3'),
    ('D32', '산업공간디자인학과', 'F3')
]

last_names = "김이박최정강조윤장임한오서신권황안송전홍유고문양손배"
first_names = ["민준","서연","도윤","서윤","시우","지우","민재","서현","하준","하은",
               "주원","하린","지호","지율","준우","지민","건우","수아","지훈","지아",
               "우진","채원","선우","다은","서진","예은","연우","시아","정우","지안"]

# 교수 24명 (학과별 4명)
professors = []
prof_idx = 1
for dept in departments:
    dept_code = dept[0]
    for _ in range(4):
        p_id = f"P{prof_idx:03d}"
        name = random.choice(last_names) + random.choice(first_names)
        email = f"prof{prof_idx}@chorong.ac.kr"
        phone = f"010-{random.randint(1000, 9999)}-{random.randint(1000, 9999)}"
        professors.append((p_id, name, email, phone, dept_code))
        prof_idx += 1

# 학생 123명
students = []
student_id_base = 20240001
for i in range(123):
    s_id = student_id_base + i
    name = random.choice(last_names) + random.choice(first_names)
    grade = random.randint(1, 4)
    entrance_year = 2024 - grade + 1
    
    dept_code = random.choice(departments)[0]
    dept_profs = [p[0] for p in professors if p[4] == dept_code]
    prof_id = random.choice(dept_profs)
    
    students.append((s_id, name, grade, entrance_year, dept_code, prof_id))

# SQL Generator
sql = ""
sql += "-- 초롱대학교 (MariaDB) DDL 및 더미 데이터 삽입 스크립트\n"
sql += "CREATE DATABASE IF NOT EXISTS chorong_db DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;\n"
sql += "USE chorong_db;\n\n"

sql += "SET FOREIGN_KEY_CHECKS = 0;\n"
sql += "DROP TABLE IF EXISTS Student;\n"
sql += "DROP TABLE IF EXISTS Professor;\n"
sql += "DROP TABLE IF EXISTS Department;\n"
sql += "DROP TABLE IF EXISTS Faculty;\n"
sql += "SET FOREIGN_KEY_CHECKS = 1;\n\n"

sql += "-- 1. 학부(Faculty) 테이블\n"
sql += "CREATE TABLE Faculty (\n"
sql += "    faculty_code VARCHAR(10) PRIMARY KEY COMMENT '학부코드',\n"
sql += "    faculty_name VARCHAR(50) NOT NULL COMMENT '학부이름',\n"
sql += "    dean_name VARCHAR(30) COMMENT '학부장명',\n"
sql += "    office_location VARCHAR(100) COMMENT '사무실위치'\n"
sql += ");\n\n"

sql += "-- 2. 학과(Department) 테이블\n"
sql += "CREATE TABLE Department (\n"
sql += "    department_code VARCHAR(10) PRIMARY KEY COMMENT '학과코드',\n"
sql += "    department_name VARCHAR(50) NOT NULL COMMENT '학과이름',\n"
sql += "    faculty_code VARCHAR(10) COMMENT '소속학부코드',\n"
sql += "    FOREIGN KEY (faculty_code) REFERENCES Faculty(faculty_code) ON DELETE SET NULL\n"
sql += ");\n\n"

sql += "-- 3. 교수(Professor) 테이블\n"
sql += "CREATE TABLE Professor (\n"
sql += "    professor_id VARCHAR(10) PRIMARY KEY COMMENT '교번',\n"
sql += "    name VARCHAR(30) NOT NULL COMMENT '이름',\n"
sql += "    email VARCHAR(100) COMMENT '이메일',\n"
sql += "    phone VARCHAR(20) COMMENT '전화번호',\n"
sql += "    department_code VARCHAR(10) COMMENT '소속학과코드',\n"
sql += "    FOREIGN KEY (department_code) REFERENCES Department(department_code) ON DELETE SET NULL\n"
sql += ");\n\n"

sql += "-- 4. 학생(Student) 테이블\n"
sql += "CREATE TABLE Student (\n"
sql += "    student_id INT PRIMARY KEY COMMENT '학번',\n"
sql += "    name VARCHAR(30) NOT NULL COMMENT '이름',\n"
sql += "    grade INT COMMENT '학년',\n"
sql += "    entrance_year INT COMMENT '입학년도',\n"
sql += "    department_code VARCHAR(10) COMMENT '소속학과코드',\n"
sql += "    professor_id VARCHAR(10) COMMENT '지도교수_교번',\n"
sql += "    FOREIGN KEY (department_code) REFERENCES Department(department_code) ON DELETE SET NULL,\n"
sql += "    FOREIGN KEY (professor_id) REFERENCES Professor(professor_id) ON DELETE SET NULL\n"
sql += ");\n\n"

sql += "-- ============================================\n"
sql += "-- 데이터 삽입\n"
sql += "-- ============================================\n\n"

for f in faculties:
    sql += f"INSERT INTO Faculty (faculty_code, faculty_name, dean_name, office_location) VALUES ('{f[0]}', '{f[1]}', '{f[2]}', '{f[3]}');\n"
sql += "\n"

for d in departments:
    sql += f"INSERT INTO Department (department_code, department_name, faculty_code) VALUES ('{d[0]}', '{d[1]}', '{d[2]}');\n"
sql += "\n"

for p in professors:
    sql += f"INSERT INTO Professor (professor_id, name, email, phone, department_code) VALUES ('{p[0]}', '{p[1]}', '{p[2]}', '{p[3]}', '{p[4]}');\n"
sql += "\n"

for s in students:
    sql += f"INSERT INTO Student (student_id, name, grade, entrance_year, department_code, professor_id) VALUES ({s[0]}, '{s[1]}', {s[2]}, {s[3]}, '{s[4]}', '{s[5]}');\n"
sql += "\n"

with open('chorong_db_init.sql', 'w', encoding='utf-8') as f:
    f.write(sql)
print("chorong_db_init.sql generation complete.")
