# 초롱대학교 데이터베이스 특강

## 제 4강: 데이터베이스와 대화하는 언어, SQL 기초 (DDL)

지난 3강 마지막에 드렸던 생각할 거리에 대한 정답부터 맞춰보겠습니다!
설계도(ERD)를 바탕으로 컴퓨터(DBMS 시스템: MySQL, Oracle 등)가 알아듣고 실제로 빈 테이블을 생성하도록 내리는 **표준 언어의 이름**은 바로 **SQL (Structured Query Language)** 입니다.

그리고 우리가 설계한 테이블의 뼈대를 새로 생성할 때 쓰는 명령어는 **`CREATE TABLE`** 입니다.

---

### 1. SQL (Structured Query Language) 의 3가지 종류

SQL은 그 쓰임새(목적)에 따라 크게 세 가지로 나눌 수 있습니다.

1. **DDL (Data Definition Language - 데이터 정의어):** 
   - 데이터베이스나 테이블의 '구조, 뼈대'를 **만들고(CREATE)**, **수정하고(ALTER)**, **삭제하는(DROP)** 명령어입니다. 건축으로 치면 건물의 뼈대를 세우고 허무는 일입니다.
2. **DML (Data Manipulation Language - 데이터 조작어):** 
   - 뼈대가 완성된 테이블 안에 실제 데이터(학생 정보 등)를 **조회(SELECT)**, **삽입(INSERT)**, **수정(UPDATE)**, **삭제(DELETE)**하는 명령어입니다. 건물 안에 가구를 넣고 빼는 일과 같습니다. (다음 5강에서 자세히 다룹니다!)
3. **DCL (Data Control Language - 데이터 제어어):** 
   - 데이터베이스에 접근할 수 있는 사용자 권한을 **부여(GRANT)**하거나 **회수(REVOKE)**하는 명령어입니다.

이번 4강에서는 뼈대를 만드는 **DDL**의 핵심인 `CREATE TABLE`을 살펴보겠습니다.

### 2. DDL: 테이블 만들기 (`CREATE TABLE`)

2강에서 설계했던 초롱대학교의 **[학과 테이블]**과 **[학생 테이블]**을 실제로 만들어 보겠습니다.

**문법 구조:**
```sql
CREATE TABLE 테이블이름 (
    컬럼명1 데이터타입(크기) [제약조건],
    컬럼명2 데이터타입(크기) [제약조건],
    ...
);
```

#### 예시 1) 학과 테이블 (Department) 생성

```sql
CREATE TABLE Department (
    department_code VARCHAR(10) PRIMARY KEY,  -- 학과코드 (기본키)
    department_name VARCHAR(50) NOT NULL,     -- 학과이름 (필수값)
    faculty_code    VARCHAR(10)               -- 소속학부코드
);
```
* `VARCHAR(10)`: 문자를 저장하며 최대 10자리를 넘을 수 없다는 뜻입니다. (가변길이 문자열)
* `PRIMARY KEY`: 이 컬럼을 기본키로 설정하겠다는 뜻입니다.
* `NOT NULL`: 이 항목은 반드시 값이 입력되어야 한다는(빈칸 허용 불가) 제약조건입니다.

#### 예시 2) 학생 테이블 (Student) 생성 및 외래키(FK) 설정

```sql
CREATE TABLE Student (
    student_id      INT PRIMARY KEY,          -- 학번 (숫자, 기본키)
    student_name    VARCHAR(30) NOT NULL,     -- 이름 (필수값)
    grade           INT,                      -- 학년 (숫자)
    entrance_year   INT,                      -- 입학년도 (숫자)
    department_code VARCHAR(10),              -- 소속학과코드
    professor_id    VARCHAR(10),              -- 지도교수_교번
    
    -- 외래키(Foreign Key) 설정: 
    -- 학생 테이블의 department_code는 Department 테이블의 department_code를 참조한다!
    FOREIGN KEY (department_code) REFERENCES Department(department_code)
);
```
* `INT`: 숫자(정수)를 의미합니다.
* `FOREIGN KEY (내_컬럼) REFERENCES 남의_테이블(남의_컬럼)`: 이 한 줄로 두 테이블(학생-학과) 간의 강력한 **연결 고리(관계)**가 실제로 형성됩니다. 
  *(이 제약조건 때문에 Department 테이블에 없는 유령 학과코드를 학생 데이터에 넣으려 하면 DB가 에러를 뿜으며 거부합니다!)*

### 3. DDL: 테이블 지우기 (`DROP TABLE`)

만약 테이블을 잘못 만들었거나 더 이상 필요 없을 때는 아래의 명령어로 흔적도 없이 지울 수 있습니다.

```sql
DROP TABLE Student;
```

> **🚨 주의사항:** 
> `DROP TABLE`은 데이터를 포함해서 뼈대 자체를 폭파시키는 무시무시한 명령이므로 실무에서는 매우 신중하게 사용해야 합니다!

---

### 📝 요약 및 과제

4강에서는 설계된 산출물을 진짜 데이터베이스에 반영하는 **SQL 언어**, 그중에서도 뼈대를 담당하는 **DDL(CREATE TABLE, DROP TABLE)**의 기본 사용법과 **외래키** 맺는 방법을 배웠습니다.

**🗣 생각해 볼 문제:** 
뼈대(테이블)가 완성되었으니 이제 빈 건물에 입주자(데이터)를 넣어야겠죠?
방금 만든 [학생 테이블]에, **"학번: 20240055, 이름: 이데이터, 학년: 1, 소속학과: CS01"** 인 학생 한 명을 새로 추가해 보려고 합니다.
데이터를 삽입할 때 쓰는 **SQL 명령어(DML)**는 무엇일까요?
