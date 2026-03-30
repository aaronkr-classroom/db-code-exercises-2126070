데이터 요구 분석 명세서

1. 여행상품 관리
- 새로운 여행상품을 계속 개발하고 있다.
- 계속 새로운 여행상품을 개발하고 있다.
- 여행상품의 출발 여부는 늦어도 여행 출발 2주일 전까지 결정해야 한다.

2. 예약 관리
- 고객이 여행상품을 예약한 날짜와 예약금 납부 여부를 관리한다.
- 고객이 여행상품을 예약한 후 24시간 안에 예약금을 결제하지 않으면 예약을 취소한다.
- 여행상품의 출발이 취소된 경우, 1주일 안에 고객에게 예약금을 반환해야 한다.

3. 고객 관리
- 고객 등급은 '일반', '우수', '최우수'로 구분한다.
- 여행상품에 6회 이상 참여한 고객은 '최우수', 3~5회 참여한 고객은 '우수', 나머지 고객은 '일반'등급으로 구분한다.
- 고객 정보는 id와 이름, 주민등록번호, 휴대폰 번호, 주소 그리고 등급을 관리한다.

4. 직원 관리
- 현재 약 30명의 직원이 근무하고 있다.
- 직원별 담당 업무가 다르다.
- 각 직원은 자신이 담당하는 여행상품과 예약 상황을 확인할 수 있어야 한다.

2. 트랜잭션 요구 분석 명세서

1. 여행상품 관리
- 직원은 자신이 담당하는 여행상품을 검색할 수 있다.
- 고객은 자신이 예약한 여행상품을 검색할 수 있다.
- 직원은 여행상품에 배정된 버스기사를 삽입한다.

2. 예약 관리
- 고객이 여행상품의 예약 일자 정보를 삽입한다.
- 직원은 여행상품을 예약한 고객을 검색할 수 있다.
- 고객은 자신이 예약한 여행상품을 삭제할 수 있다.

3. 고객 관리
- 탈퇴한 고객 정보를 삭제한다.
- 직원은 예약금을 결제하지 않은 고객을 삭제한다.
- 직원은 여행상품 참여에 따라 고객의 등급을 변경한다.

4. 직원 관리
- 직원은 자신의 휴대폰 정보를 변경할 수 있다.
- 직원은 자신의 정보를 검색할 수 있다.
- 직원은 여행상품을 삭제할 수 있다.

step 1. 온라인 쇼핑몰

step 2. 
시스템 개요: 구매자가 상품을 원활하게 구매해야 한다.

step 3.
[Entities]
- Customer
- Goods
- Seller

[Customer Properties]
- id (BIGSERIAL)
- name (VARCHAR(20))
- sex (VARCHAR(10))
- address (VARCHAR(50))
- signup_date (DATE)

[Goods Properties]
- id (BIGSERIAL)
- name (VARCHAR(30))
- category (VARCHAR(20))
- price (INT)
- regist_date (DATE)

[Seller Properties]
- id (BIGSERIAL)
- name (VARCHAR(20))
- address (VARCHAR(50))
- regist_date (DATE)

step 4.
CREATE TABLE customer (
	id bigserial,
	name VARCHAR(20),
	sex VARCHAR(10),
	address VARCHAR(50),
	signup_date DATE
);

CREATE TABLE goods (
	id bigserial,
	name VARCHAR(30),
	category VARCHAR(20),
	price INT,
	regist_date DATE
);

CREATE TABLE seller (
	id bigserial,
	name VARCHAR(20),
	address VARCHAR(50),
	regist_date DATE
);

INSERT INTO customer (name, sex, address, signup_date) VALUES
('최영준', '남자', '서울시', '2024-1-1'),
('코로네', '여자', '대전시', '2025-4-30'),
('오카유', '여자', '대구시', '2025-10-15'),
('후부키', '여자', '부산시', '2025-12-31'),
('미오', '여자', '제주시', 2026-03-23');

INSERT INTO goods (name, category, price, regist_date) VALUES
('플레이스테이션5', '게임기', 600000, '2024-1-1'),
('닭가슴살 5kg', '가공육', 30000, '2025-4-30'),
('참이슬', '주류', 1500, '2025-10-15'),
('버즈4', '이어폰', 350000, '2025-12-31'),
('XM6', '헤드셋', 500000, '2026-3-30');

INSERT INTO seller (name, address, regist_date) VALUES
('게임점', '제주시', '2024-3-3'),
('정육점', '서울시', '2025-2-2'),
('가구점', '부산시', '2026-3-3');

SELECT * FROM customer;

SELECT name, price FROM goods WHERE name LIKE '%이슬' ORDER BY regist_date DESC;


