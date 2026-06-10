-- DB Final Project
-- Student Name: 최영준
-- Student ID: 2126070

-- 0. Reset All Settings
DROP TABLE customer CASCADE;

-- 1. CREATE TABLE

-- I created bonus tables with essential tables

CREATE TABLE customer (
	cus_id VARCHAR(15) PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
	cell CHAR(13) NOT NULL UNIQUE,
	addr VARCHAR(100),
	c_code INT DEFAULT 3
);

CREATE TABLE staff (
	staff_id INTEGER PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
	birthday INTEGER NOT NULL,
	tel CHAR(12),
	salary INTEGER,
	t_code INTEGER NOT NULL,
	hire_date CHAR(8) NOT NULL 
);

CREATE TABLE tour (
	tour_num CHAR(8) PRIMARY KEY,
    departure VARCHAR(50) NOT NULL,
	arrival VARCHAR(50) NOT NULL,
	program VARCHAR(100),
	start_dt DATE NOT NULL,
	end_dt DATE NOT NULL,
	min_num INTEGER,
	max_num INTEGER,
	expense INTEGER NOT NULL,
	deposit INTEGER,
	dept_yn CHAR(1) DEFAULT 'N',
	staff_id INTEGER,
	FOREIGN KEY (staff_id) REFERENCES staff(staff_id)
);

CREATE TABLE tour_bus(
	bus_id INTEGER PRIMARY KEY,
	seat INTEGER,
	del_year INTEGER -- pdf에서는 del_yesr이라 나왔는데 오타인거 같아서 수정
);

CREATE TABLE driver(
	driver_id INTEGER PRIMARY KEY,
	name VARCHAR(20) NOT NULL,
	birthday CHAR(6) NOT NULL,
	cell CHAR(13) NOT NULL,
	pay INTEGER DEFAULT 15000,
	cont_date CHAR(8),
	cont_term CHAR(8)
);

CREATE TABLE reserve(
	cus_id VARCHAR(15),
	tour_num CHAR(8),
	res_date CHAR(8) DEFAULT TO_CHAR(CURRENT_DATE, 'YYYYMMDD'),
	dep_yn CHAR(1) DEFAULT 'N',
	exp_yn CHAR(1) DEFAULT 'N',
	PRIMARY KEY (cus_id, tour_num),
	FOREIGN KEY (cus_id) REFERENCES customer(cus_id),
	FOREIGN KEY (tour_num) REFERENCES tour(tour_num)
);

CREATE TABLE assign_driver(
	tour_num CHAR(8) PRIMARY KEY,
	driver_id INTEGER,
	work_hour INTEGER,
	FOREIGN KEY (driver_id) REFERENCES driver(driver_id)
);

CREATE TABLE assign_bus(
	tour_num CHAR(8) PRIMARY KEY,
	bus_id INTEGER,
	FOREIGN KEY (tour_num) REFERENCES tour(tour_num),
	FOREIGN KEY (bus_id) REFERENCES tour_bus(bus_id)
);

CREATE TABLE class_code(
	code INTEGER PRIMARY KEY,
	class VARCHAR(10),
	basis VARCHAR(20)
);

CREATE TABLE task_code(
	code INTEGER PRIMARY KEY,
	task VARCHAR(30)
);

-- 2. INSERT DATA
-- TODO: Insert at least 5 rows into each table

-- I used Gemini because it was too simple and repetitive
-- However I am aware of how foreign keys and DEFAULT options work
INSERT INTO customer VALUES ('user01', '김철수', '010-1111-2222', '서울특별시 강남구', 1);
INSERT INTO customer VALUES ('user02', '이영희', '010-3333-4444', '경기도 수원시', 2);
INSERT INTO customer VALUES ('user03', '박민수', '010-5555-6666', '충청북도 충주시', 3);
INSERT INTO customer VALUES ('user04', '최지우', '010-7777-8888', '대전광역시 서구', 3);
INSERT INTO customer VALUES ('user05', '정우성', '010-9999-0000', '부산광역시 해운대구', 2);

INSERT INTO staff VALUES (10001, '홍길동', 850101, '02-123-4567', 3500000, 1, '20200101');
INSERT INTO staff VALUES (10002, '강감찬', 880505, '02-987-6543', 3200000, 2, '20210515');
INSERT INTO staff VALUES (10003, '이순신', 751010, '02-555-5555', 4500000, 4, '20150301');
INSERT INTO staff VALUES (10004, '유관순', 951225, '02-777-7777', 2800000, 5, '20230701');
INSERT INTO staff VALUES (10005, '신사임당', 900303, '02-888-8888', 3000000, 3, '20220913');

INSERT INTO tour VALUES ('T0000001', '서울', '제주도', 'http://tour.com/jeju', '2026-07-01 09:00:00', '2026-07-04 18:00:00', 10, 30, 450000, 50000, 'Y', 10001);
INSERT INTO tour VALUES ('T0000002', '부산', '경주', 'http://tour.com/gyeongju', '2026-07-10 08:00:00', '2026-07-11 17:00:00', 15, 40, 150000, 20000, 'N', 10001);
INSERT INTO tour VALUES ('T0000003', '서울', '설악산', 'http://tour.com/seorak', '2026-07-15 07:00:00', '2026-07-15 20:00:00', 20, 45, 80000, 10000, 'N', 10002);
INSERT INTO tour VALUES ('T0000004', '인천', '울릉도', 'http://tour.com/ulleung', '2026-08-01 06:00:00', '2026-08-04 16:00:00', 8, 20, 600000, 100000, 'N', 10002);
INSERT INTO tour VALUES ('T0000005', '대구', '여수', 'http://tour.com/yeosu', '2026-08-12 10:00:00', '2026-08-14 15:00:00', 12, 30, 250000, 30000, 'Y', 10003);

INSERT INTO tour_bus VALUES (1, 45, 2018);
INSERT INTO tour_bus VALUES (2, 45, 2019);
INSERT INTO tour_bus VALUES (3, 28, 2021);
INSERT INTO tour_bus VALUES (4, 45, 2022);
INSERT INTO tour_bus VALUES (5, 28, 2023);

INSERT INTO driver VALUES (20001, '이민우', '781112', '010-1111-3333', 16000, '20200101', '12');
INSERT INTO driver VALUES (20002, '박준영', '820405', '010-2222-4444', 15000, '20210301', '24');
INSERT INTO driver VALUES (20003, '최현우', '850909', '010-5555-7777', 17000, '20220501', '12');
INSERT INTO driver VALUES (20004, '정재희', '900101', '010-6666-8888', 15000, '20230101', '36');
INSERT INTO driver VALUES (20005, '강동원', '880707', '010-9999-1111', 18000, '20240201', '12');

INSERT INTO reserve VALUES ('user01', 'T0000001', '20260501', 'Y', 'Y');
INSERT INTO reserve VALUES ('user02', 'T0000001', '20260502', 'Y', 'N');
INSERT INTO reserve VALUES ('user03', 'T0000002', '20260503', 'N', 'N');
INSERT INTO reserve VALUES ('user04', 'T0000003', '20260510', 'Y', 'Y');
INSERT INTO reserve VALUES ('user05', 'T0000005', '20260515', 'Y', 'N');

INSERT INTO assign_driver VALUES ('T0000001', 20001, 24);
INSERT INTO assign_driver VALUES ('T0000002', 20002, 12);
INSERT INTO assign_driver VALUES ('T0000003', 20003, 8);
INSERT INTO assign_driver VALUES ('T0000004', 20004, 36);
INSERT INTO assign_driver VALUES ('T0000005', 20005, 16);

INSERT INTO assign_bus VALUES ('T0000001', 1);
INSERT INTO assign_bus VALUES ('T0000002', 2);
INSERT INTO assign_bus VALUES ('T0000003', 3);
INSERT INTO assign_bus VALUES ('T0000004', 4);
INSERT INTO assign_bus VALUES ('T0000005', 5);

INSERT INTO class_code VALUES (1, '최우수', '우수 고객 상위 5%');
INSERT INTO class_code VALUES (2, '우수', '직전 분기 실적 우수');
INSERT INTO class_code VALUES (3, '일반', '기본 회원 등급');
INSERT INTO class_code VALUES (4, '기타1', '이벤트 참여 회원');
INSERT INTO class_code VALUES (5, '기타2', '장기 미이용 회원');

INSERT INTO task_code VALUES (1, '여행상품관리');
INSERT INTO task_code VALUES (2, '예약관리');
INSERT INTO task_code VALUES (3, '관광버스배차관리');
INSERT INTO task_code VALUES (4, '직원관리');
INSERT INTO task_code VALUES (5, '고객관리');

-- 3. INDEX
-- TODO: CREATE INDEX
CREATE INDEX tour_arrival_idx ON tour(arrival ASC);

CREATE INDEX driver_name_ix ON driver(name ASC);

-- 4. TEST QUERIES

-- Customer Grade Search
SELECT c.name AS "이름", cc.class AS "등급"
FROM customer c
JOIN class_code cc ON c.c_code = cc.code;

-- Employee Task Search
SELECT s.name AS "이름", tc.task AS "업무"
FROM staff s
JOIN task_code tc ON s.t_code = tc.code

-- Tour Reservation Search
SELECT c.name AS "이름", r.res_date AS "예약일자", r.dep_yn AS "결제여부"
FROM customer c
JOIN reserve r ON c.cus_id = r.cus_id;

-- Assigned Driver Search
SELECT t.departure AS "출발지", d.name AS "이름", d.cell AS "휴대폰"
FROM assign_driver ad
JOIN tour t ON ad.tour_num = t.tour_num
JOIN driver d ON ad.driver_id = d.driver_id;

-- INSERT example
INSERT INTO customer VALUES ('user06', '최영준', '010-1557-8848');

SELECT * FROM customer WHERE cus_id = 'user06';

-- UPDATE example
UPDATE staff
SET salary = salary + 200000
WHERE staff_id = 10003;

SELECT salary FROM staff WHERE staff_id = 10003;

-- DELETE example
-- Delete customer
DELETE FROM reserve
WHERE cus_id = 'user03';

DELETE FROM customer 
WHERE cus_id = 'user03';
 
SELECT * FROM customer;

-- Delete tour
DELETE FROM assign_bus
WHERE tour_num = 'T0000004';

DELETE FROM tour
WHERE tour_num = 'T0000004';

SELECT * FROM tour;
