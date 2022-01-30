
--------------------------------------------
-- 테이블 제거
--------------------------------------------
drop sequence emp_sq;       -- <주의> emp_sq가 없으면 삭제 대상이 없다는 에러 메세지 출력
drop sequence cus_sq;
drop table salary_grade;
drop table customer;
drop table employee;
drop table dept;

--------------------------------------------
-- dept 테이블 만들기
--------------------------------------------
create table dept(
    dep_no      number(3)                       -- [부서번호] 저장 컬럼 선언. 자료형은 숫자형.
    ,dep_name   varchar2(20)    not null unique -- [부서명] 저장 컬럼 선언. 자료형은 문자형. 제약조건
    ,loc        varchar2(20)    not null        -- [부서위치] 저장 컬럼 선언. 자료형은 문자형. 제약조건
    ,primary key(dep_no)                        -- dep_no 컬럼에 primary key 설정하기.
);

--------------------------------------------
-- 행 입력하기
--------------------------------------------
insert into dept (dep_no, dep_name, loc) values (10, '총무부', '서울');  --문자는 작은 따옴표.
insert into dept (dep_no, dep_name, loc) values (20, '영업부', '부산');
insert into dept (dep_no, dep_name, loc) values (30, '전산부', '대전');
insert into dept (dep_no, dep_name, loc) values (40, '자재부', '광주');

--------------------------------------------
-- dept 테이블의 모든 컬럼과 모든 행을 검색하기
--------------------------------------------
select * from dept;


--------------------------------------------
-- employee 테이블에서 PK 값으로 사용할 일련번호를 생성하는 시퀀스 생성하기 (일련 번호 자동 생성기)
--------------------------------------------
create sequence emp_sq
    start with 1
    increment by 1
    minvalue 1
    maxvalue 999;

-- 데이터의 삽입 도중 행에 입력이 안될 오류 발생시 이미 시퀀스는 발행하기에 그 다음 행 입력시 숫자를 건너 뛸 수 있다.

--------------------------------------------
-- employee 테이블 만들기. 직원 정보가 저장되는 테이블이다.
--------------------------------------------
           -- //식별자
create table employee (
     emp_no          number(3)                              -- [직원번호]가 저장되는 컬럼 선언.
    ,emp_name        varchar2(20)        not null           -- [직원명]이 저장되는 컬럼 선언.
    ,dep_no          number(3)                              -- [소속부서번호]가 저장되는 컬럼 선언.
    ,jikup           varchar2(20)        not null           -- [직급]이 저장되는 컬럼 선언.
    ,salary          number(9)           default 0          -- [연봉]이 저장되는 컬럼 선언.
    ,hire_date       date                default sysdate    -- [입사일]이 저장되는 컬럼 선언. sysdate = 현재 시간
    ,jumin_num       char(13)            not null unique    -- [주민번호]가 저장되는 컬럼 선언.
    ,phone           varchar2(15)        not null           -- [전화번호]가 저장되는 컬럼 선언.
    ,mgr_emp_no      number(3)                              -- [직속상관 직원번호]가 저장되는 컬럼 선언.

    ,primary key(emp_no)                                    -- [직원번호] 컬럼에 PK 제약조건 주기
    ,foreign key(dep_no)    references dept(dep_no)         -- [소속부서번호] 컬럼에 FK 제약조건 주기. dept 테이블에 dep_no 컬럼 참조하게 하기.
    ,constraint employee_mgr_emp_no_fk   foreign key(mgr_emp_no)     references employee(emp_no)
    );                                                      --[직속상관 직원번호] 컬럼에 FK 제약조건 주기. employee 테이블에 emp_no 컬럼 참조하게 하기
                                                            -- employee_mgr_emp_no_fk 는 제약 조건에 붙이는 이름이다.


--insert into employee values( 1, '홍길동', 10, '사장', 5000, to_date('1980-01-01','YYYY-MM-DD'), 7211271109410, '01099699515', null);

--------------------------------------------
-- 지금 현재 로그인 한 계정이 날짜 데이터는 '년-월-일' 로 입력 가능하게 하기  default 값은 일/영문 월/년도
--------------------------------------------
alter session set nls_date_format = 'yyyy-mm-dd' ;


--------------------------------------------
-- employee_mgr_emp_no_fk 라는 이름의 FK 제약조건 끄기. 즉 제약조건 임시 무력화.
--------------------------------------------
alter table employee disable constraint employee_mgr_emp_no_fk;



--------------------------------------------
-- 행 전체 삭제
--------------------------------------------
--delete from employee;

--------------------------------------------
-- employee 테이블에 20개의 행 넣기
--------------------------------------------
                                                                                                          -- 처음 들어가는 값은 null값 허용
insert into employee values( emp_sq.nextval, '홍길동', 10, '사장', 5000, '1980-01-01', '7211271109410', '01099699515', null );
insert into employee values( emp_sq.nextval, '한국남', 20, '부장', 3000, '1988-11-01', '6002061841224', '01024948424', 1 );
insert into employee values( emp_sq.nextval, '이순신', 20, '과장', 3500, '1989-03-01', '6209172010520', '01026352672', 2 );
insert into employee values( emp_sq.nextval, '이미라', 30, '대리', 2503, '1983-04-01', '8409282070226', '01094215694', 17 );
insert into employee values( emp_sq.nextval, '이순라', 20, '사원', 1200, '1990-05-01', '8401041483626', '01028585900', 3 );
insert into employee values( emp_sq.nextval, '공부만', 30, '과장', 4003, '1995-05-01', '8402121563616', '01191338328', 17 );
insert into employee values( emp_sq.nextval, '놀기만', 20, '과장', 2300, '1996-06-01', '8011221713914', '01029463523', 2 );
insert into employee values( emp_sq.nextval, '채송화', 30, '대리', 1703, '1992-06-01', '8105271014112', '01047111052', 17 );
insert into employee values( emp_sq.nextval, '무궁화', 10, '사원', 1100, '1984-08-01', '8303291319116', '01025672300', 12 );
insert into employee values( emp_sq.nextval, '공부해', 30, '사원', 1303, '1988-11-01', '8410031281312', '01027073174', 4 );
insert into employee values( emp_sq.nextval, '류별나', 20, '과장', 1600, '1989-12-01', '8409181463545', '01071628290', 2 );
insert into employee values( emp_sq.nextval, '류명한', 10, '대리', 1800, '1990-10-01', '8207211661117', '01042072622', 20 );
insert into employee values( emp_sq.nextval, '무궁화', 10, '부장', 3000, '1996-11-01', '8603231183011', '01098110955', 1 );
insert into employee values( emp_sq.nextval, '채시라', 20, '사원', 3400, '1993-10-01', '8001172065410', '01044452437', 3 );
insert into employee values( emp_sq.nextval, '최진실', 10, '사원', 2000, '1991-04-01', '8303101932611', '01027491145', 12 );
insert into employee values( emp_sq.nextval, '김유신', 30, '사원', 4000, '1981-04-01', '7912031009014', '01098218448', 4 );
insert into employee values( emp_sq.nextval, '이성계', 30, '부장', 2803, '1984-05-01', '8102261713921', '0165358075', 1 );
insert into employee values( emp_sq.nextval, '강감찬', 30, '사원', 1003, '1986-07-01', '8203121977315', '01033583130', 4 );
insert into employee values( emp_sq.nextval, '임꺽정', 20, '사원', 2200, '1988-04-01', '8701301040111', '01086253078', 7 );
insert into employee values( emp_sq.nextval, '깨똥이', 10, '과장', 4500, '1990-05-01', '8811232452719', '01090084876', 13 );


--------------------------------------------
-- FK 제약조건 켜기
--------------------------------------------
alter table employee enable constraint employee_mgr_emp_no_fk;



select * from employee;


--------------------------------------------
-- customer 테이블에서 PK 값으로 사용할 일련번호를 생성하는 시퀀스 생성하기 (일련 번호 자동 생성기)
--------------------------------------------
create sequence cus_sq
    start with 1
    increment by 1
    minvalue 1
    maxvalue 999;

--------------------------------------------
-- customer 테이블 생성하기. 고객 정보가 저장되는 테이블이다.
--------------------------------------------
create table customer (
    cus_no          number(3)                               -- [고객번호]가 저장되는 컬럼 선언
    ,cus_name       varchar2(10)        not null            -- [고객명]이 저장되는 컬럼 선언
    ,tel_num        varchar2(15)        not null            -- [전화번호]가 저장되는 컬럼 선언
    ,jumin_num      char(13)            not null unique     -- [주민번호]가 저장되는 컬럼 선언
    ,emp_no   number(3)                                     -- [담당직원]이 저장되는 컬럼 선언

    ,primary key(cus_no)                                    -- [고객번호] 컬럼에 PK 제약조건 주기
    ,foreign key(emp_no)     references employee(emp_no)    -- [담당직원번호] 컬럼에 FK 제약조건 주기. employee 테이블에 emp_no 컬럼 참조하게 하기
    );


--------------------------------------------
-- customer 테이블에 10개 행 입력하기.
--------------------------------------------
insert into customer values( cus_sq.nextval , '류민이', '123-1234', '7001131537915', 3);
insert into customer values( cus_sq.nextval , '이강민', '343-1454', '6902161627914', 2);
insert into customer values( cus_sq.nextval , '이영희', '144-1655', '7503202636215', null);
insert into customer values( cus_sq.nextval , '김철이', '673-1674', '7704301234567', 4);
insert into customer values( cus_sq.nextval , '박류완', '123-1674', '7205211123675', 3);
insert into customer values( cus_sq.nextval , '서캔디', '673-1764', '6507252534566', null);
insert into customer values( cus_sq.nextval , '신똘이', '176-7677', '0006083648614', 7);
insert into customer values( cus_sq.nextval , '도쇠돌', '673-6774', '0008041346574', 9);
insert into customer values( cus_sq.nextval , '권홍이', '767-1234', '7312251234689', 13);
insert into customer values( cus_sq.nextval , '김안나', '767-1677', '7510152432168', 4);

select * from customer;

--------------------------------------------
-- salary_grade 테이블 생성하기. 연봉 등급을 관리하는 테이블이다.
--------------------------------------------
create table salary_grade (
    sal_grade_no        number(2)       primary key -- [연봉등급] 저장 컬럼 선언
    ,min_salary         number(5)       not null    -- [최소연봉] 저장 컬럼 선언
    ,max_salary         number(5)       not null    -- [최대연봉] 저장 컬럼 선언
    );

insert into salary_grade values( 1, 8000, 10000 );
insert into salary_grade values( 2, 6000, 7999 );
insert into salary_grade values( 3, 4000, 5999 );
insert into salary_grade values( 4, 2000, 3999 );
insert into salary_grade values( 5, 1000, 1999 );

select * from salary_grade;


update employee set dep_no = 40 where emp_no=2;

--------------------------------------------
-- 지금까지의 모든 입력, 수정, 삭제 작업을 실제 작업으로 인정하기
--------------------------------------------
commit;

--------------------------------------------
-- as ""를 이용하여 헤더 변경
-- || ''를 이용하여 연봉 뒤에 만원 추가
--------------------------------------------
	select
		emp_no		        as "직원번호"
		, emp_name	        as "직원명"
		, jikup		        as "직급"
		, salary || '만원'  as "연봉"
		, hire_date	        as "입사일"
	from
		employee;


--------------------------------------------
-- employee 테이블에서 직원명, 직급, 연봉, 세금, 실수령액 을 검색하면 ? (세금은 연봉의 12%)
--------------------------------------------

	select
		emp_name		as "직원명"
		, jikup			as "직급"
		, salary || '만원'		as "연봉"
		, salary*0.12 || '만원'	as "세금"
		, salary*0.88 || '만원'	as "실수령액"
	from
		employee;

--------------------------------------------
-- employee 테이블에서 직급을 중복없이 검색하면 ?
--------------------------------------------

    select distinct jikup from employee;

    select distinct(jikup) from employee;

    select unique(jikup) from employee;

--------------------------------------------
-- employee 테이블에서 부서번호와 직급을 중복없이 검색하면 ?
--------------------------------------------

    select distinct dep_no, jikup from employee;

--------------------------------------------
-- employee 테이블에서 연봉이 3000 이상인 직원을 검색하면 ?
--------------------------------------------

    select * from employee where salary >= 3000 ;

--------------------------------------------
-- employee 테이블에서 연봉 오름차순으로 검색하면 ?
--------------------------------------------

    select * from employee order by salary ASC ;

    select * from employee order by salary ;

	select * from employee order by 5 ;

	select * from employee order by salary DESC ;

--------------------------------------------
-- employee 테이블에서 연봉 내림차순으로 검색하면 ?
--------------------------------------------

    select * from employee order by salary desc;

	select * from employee order by 5 desc;

--------------------------------------------
-- employee 테이블에서 부서번호 오름차순을 유지하면서 연봉 내림차순으로 검색하면 ?
--------------------------------------------

    select * from employee order by dep_no asc , salary desc;


--------------------------------------------
-- employee 테이블에서 직급이 높은 순서 나열해서 검색하면 ? + 같은값일 시 연봉 내림차순
--------------------------------------------

	select * from employee order by decode ( jikup, '사장', 1, '부장', 2, '과장', 3, '대리', 4) , salary desc;

--------------------------------------------
-- employee 테이블에서 부장만 검색하면 ?
--------------------------------------------

	select * from employee where jikup = '부장'

--------------------------------------------
-- employee 테이블에서 20번 부서의 과장을 검색하면 ?
--------------------------------------------

	select * from employee where dep_no = 20 and jikup = '과장'

--------------------------------------------
-- employee 테이블에서 20번 부서 또는 과장을 검색하면 ?
--------------------------------------------

	select * from employee where dep_no = 20 or jikup = '과장'

--------------------------------------------
-- employee 테이블에서 과장 중에 연봉 3400 이상을 검색하면 ?
--------------------------------------------

	select * from employee where jikup = '과장' and salary >= 3400;

--------------------------------------------
-- employee 테이블에서 실수령액이 4000만원 이상 받는 직원을 검색하면 ? (세금은 12%)
--------------------------------------------

    select * from employee where salary*0.88 >= 4000;

--------------------------------------------
-- employee 테이블에서 세금을 제일 많이 내는 직원 순서로 나열하면서  부서번호가 내림차순이면서
-- 사장이 아닌 직원을 검색하면 ?
--------------------------------------------

	select * from employee where not jikup = '사장' order by salary*0.12 desc, dep_no desc ;

--------------------------------------------
-- employee 테이블에서 20번 부서 중에 연봉 2000~3000 사이 검색하면 ?
--------------------------------------------

	select * from employee where dep_no = 20 and salary between 2000 and 3000;

--------------------------------------------
-- employee 테이블에서 직속 상관이 없는 직원을 검색하면 ?
--------------------------------------------

	select * from employee where mgr_emp_no is null;

--------------------------------------------
-- employee 테이블에서 직속 상관이 있는 직원을 검색하면 ?
--------------------------------------------

    select * from employee where mgr_emp_no is not null;

    select min(salary) from employee;

    	select
		emp_no
		,emp_name
		,jikup
		,decode(
			substr(jumin_num,7,1)
			, '1', '19'
			, '2', '19'
			, '20'
		)  || substr(jumin_num,1,2)   || '년생'
	from
		employee;

	select
		*
	from
		employee
	order by
		case jikup
			when '사장' then 1
			when '부장' then 2
			when '과장' then 3
			when '대리' then 4
			when '주임' then 5
			else 6
		end
	asc;

    	select
		emp_no
		,emp_name
		,to_char(hire_date,'YYYY-MM-DD')
	from
		employee;

	select
		emp_no
		,emp_name
		, to_number(to_char(sysdate,'YYYY'))
		  - to_number(
			case substr(jumin_num,7,1)
			when '1' then '19'
			when '2' then '19'
			else '20'
            end
			|| substr(jumin_num, 1, 2)
		) +1 || '세'
	from
		employee;


	select
		emp_no				"직원번호"
		,emp_name			"직원명"
		,ceil((sysdate-hire_date)/365)	|| '년차'	"근무년차"
	from
		employee;

    select
		emp_no
		,emp_name
		,to_char(hire_date,'YYYY-MM-DD(DY) Q AM HH:MI:SS' , 'NLS_DATE_LANGUAGE = Korean')
	from
		employee;

        	select
		emp_no
		,emp_name
		,to_char(hire_date,'YYYY"년"MM"월"DD"일"(DY) Q"분기" AM HH"시"MI"분"SS"초"' , 'NLS_DATE_LANGUAGE = Korean')
	from
		employee;


	select * from employee
	where			to_char(
			to_date(
				to_number(to_char(sysdate,'YYYY')) || substr(jumin_num,3,4)
				, 'YYYYMMDD'
			)
			,'(dy)'
		= 'WED'


        	select * from employee
	where substr(jumin_num, 1 ,1) = '7' and
		substr(jumin_num, 7, 1) = '1' ;




           	select
		e1.emp_name	"직원명"
		,e1.jikup	"직원직급"
		,e2.emp_name	"직속상관명"
		,e2.jikup	"식속상관직급"
	from
		employee e1, employee e2
	where
		e1.mgr_emp_no = e2.emp_no



	select
		e1.emp_name	"직속상관명"
		,e1.jikup	"식속상관직급"
		,e2.emp_name	"직원명"
		,e2.jikup	"직원직급"
	from
		employee e1, employee e2
	where
		e1.emp_no = e2.mgr_emp_no

    select
		c.cus_name	"고객명"
		,c.tel_num	"고객전화번호"
		,e.emp_name	"담당직원명"
		,e.jikup	"담당직원직급"
		,e.dep_no	"부서번호"
	from
		customer c, employee e
	where
		c.emp_no = e.emp_no(+);


	select
		c.cus_no	"고객번호"
		,c.cus_name	"고객명"
		,c.tel_num	"고객전화번호"
		,e.emp_name	"담당직원명"
		,e.jikup	"담당직원직급"
		,s.sal_grade_no	"담당직원연봉등급"
	from
		customer c, employee e, salary_grade s
	where
		c.emp_no = e.emp_no(+) and (s.min_salary(+) <= e.salary and s.max_salary(+) >= e.salary);


	select
		c.cus_no
		,c.cus_name
		,c.tel_num
	from
		customer c, employee e
	where
		e.salary>=3000 and e.emp_no=c.emp_no;


        	select
		c.cus_no
		,c.cus_name
		,c.tel_num
	from
		customer c, employee e
	where
		c.emp_no = e.emp_no and substr(e.jumin_num,1,2) >=82;


	select
		c.cus_no				"고객번호"
		,c.cus_name				"고객명"
		,nvl(to_char(e1.emp_no), '없음')	"담당직원번호"
		,nvl(e1.emp_name, '없음')		"담당직원명"
		,nvl(d.dep_name, '없음')		"담당직원소속부서명"
		,nvl(to_char(s1.sal_grade_no), '없음') 	"담당직원연봉등급"
		,nvl(e2.emp_name, '없음')		"담당직원직속상관명"
		,nvl(e2.jikup, '없음')			"담당직원직속상관직급"
		,nvl(to_char(s2.sal_grade_no), '없음')	"직속상관연봉등급"
	from
		((((customer c left outer join employee e1 on c.emp_no = e1.emp_no)
		left outer join dept d on e1.dep_no = d.dep_no)
		left outer join salary_grade s1 on e1.salary between s1.min_salary and s1.max_salary)
		left outer join employee e2 on e1.mgr_emp_no = e2.emp_no)
		left outer join salary_grade s2 on e2.salary between s2.min_salary and s2.max_salary
	order by
		c.cus_no asc;


	select emp_name, phone from employee
	union
	select cus_name, tel_num from customer;


    select * from employee where salary = (select max(salary) from employee)

    select * from employee where salary = (select max(salary) from employee where dep_no = 20) and dep_no=20;

    	select
		emp_name	"직원명"
		,jikup		"직급"
		,salary		"연봉"
		,floor(salary/(select sum(salary) from employee)*100) ||'%' "연봉비율"
	from
		employee
	order by
		salary/(select sum(salary) from employee)*100	desc;


        select
		emp_name				"직원명"
		,salary					"연봉"
		,(select avg(salary) from employee)	"전체평균연봉"
		,(select max(salary) from employee)	"전체최대연봉"
	from
		employee
	where
		salary<(select max(salary) from employee) and salary >= (select avg(salary) from employee);



	select
		e.emp_no
		,e.emp_name
		,d.dep_name
		,e.salary
	from
		dept d,employee e
	where
		 d.dep_no=e.dep_no and e.salary = (select max(salary) from employee);

    select
		emp_no
		,emp_name
		,jikup
	from
		employee e
	where
		(select count(*) from customer c where e.emp_no = c.emp_no)>=2;



	select
		e.emp_no						"직원번호"
		,e.emp_name						"직원명"
		,(select count(*) from customer c where c.emp_no = e.emp_no) 	"담당고객수"
	from
		employee e ;


	select
		d.dep_name							"부서명"
		,(select count(*) from employee e where e.dep_no = d.dep_no) || '명'	"직원총수"
		,(select count(*) from employee e, customer c
			where e.dep_no=d.dep_no and e.emp_no = c.emp_no) || '명'	"담당총고객수"
	from
		dept d
	order by
		2 desc;

	select
		e1.emp_no			"직원번호"
		,e1.emp_name		"직원명"
		,e1.jikup			"직급"
		,e1.jumin_num		"주민번호"
		,(select count(*)+1 from employee e2
			where
				decode(e2.jikup,'사장','1','부장','2','과장','3','대리','4','주임','5',6)
					< decode(e1.jikup,'사장','1','부장','2','과장','3','대리','4','주임','5',6)
				or
				( e2.jikup = e1.jikup and
				case when substr(e2.jumin_num,7,1) in('1','2') then '19' else '20' end || substr(e2.jumin_num,1,6)
				<	case when substr(e1.jumin_num,7,1) in('1','2') then '19' else '20' end || substr(e1.jumin_num,1,6)))	"직급서열순위"
	from
		employee e1
	order by
		5;


    select
		e1.emp_no			"직원번호"
		,e1.emp_name		"직원명"
		,e1.jikup			"직급"
		,e1.jumin_num		"주민번호"
		,(select count(*)+1 from employee e2
			where
				decode(e2.jikup,'사장','1','부장','2','과장','3','대리','4','주임','5',6)
					< decode(e1.jikup,'사장','1','부장','2','과장','3','대리','4','주임','5',6)
				or
				( e2.jikup = e1.jikup and
				decode( substr(e2.jumin_num,7,1),'1','19','2','19','20') || substr(e2.jumin_num,1,6)
				<	decode( substr(e1.jumin_num,7,1),'1','19','2','19','20') || substr(e1.jumin_num,1,6)))	"직급서열순위"
	from
		employee e1
	order by
		5;


	select
		c.cus_no
		,c.cus_name
		,c.tel_num
		,e.emp_name
		,e.jikup
		,d.dep_no
	from
		customer c, employee e, dept d
	where
		c.emp_no = e.emp_no(+) and e.dep_no = d.dep_no(+) ;


	select
		c.cus_no
		,c.cus_name
		,c.tel_num
		,e.emp_name
		,e.jikup
		,d.dep_no
	from
		(customer c left outer join employee e on c.emp_no = e.emp_no)
		left outer join dept d on e.dep_no = d.dep_no;

	select
		c.cus_no							"고객번호"
		,c.cus_name						"고객명"
		,c.tel_num						"고객전화번호"
		,(select e.emp_name from employee e where c.emp_no=e.emp_no and e.dep_no = 10)"담당직원명"
		,(select e.jikup from employee e where c.emp_no=e.emp_no and e.dep_no = 10)	"담당직원직급"
		,(select e.dep_no from employee e where c.emp_no=e.emp_no and e.dep_no = 10)	"부서번호"
	from
		customer c
	order by
		1;


	select
		jikup			"직급"
		, sum(salary)		"급여합"
		, round(avg(salary),0)	"평균급여"
		, count(*)	||'명'		"인원수"
	from
		employee
	group by
		jikup;

	select
		dep_no			"부서번호"
		, jikup			"직급"
		, sum(salary)		"급여합"
		, round(avg(salary),1)	"평균급여"
		, count(*)			"인원수"
	from
		employee
	group by
		dep_no, jikup
	having
		count(*) >= 3;


	select
		dep_no			"부서번호"
		, decode(substr(jumin_num,7,1),'1','남','3','남','여')	"성"
		, sum(salary)		"급여합"
		, round(avg(salary),1)||'만원'	"평균급여"
		, count(*)||'명'			"인원수"
	from
		employee
	group by
		dep_no,decode(substr(jumin_num,7,1),'1','남','3','남','여');


	select
		to_char(hire_date,'YYYY')   "입사년도"
		,count(*)                     "인원수"
	from
		employee
	group by
		to_char(hire_date,'YYYY')
	order by
		"입사년도"   asc;

	select
		dep_no
		,round(avg((sysdate - hire_date)/365),1) || '년 근무'
	from
		employee
	group by
		dep_no;


	select
		to_char(hire_date,'Q')||'분기'	"입사분기"
		,count(*)		              "인원수"
	from
		employee
	group by
		to_char(hire_date,'Q')||'분기';



	select
		substr(to_char(hire_date,'YYYY'),1,3)||'년대'				"입사연대"
		,decode(substr(jumin_num,7,1),'1','남','3','남','여')		"성"
		,count(substr(to_char(hire_date,'YYYY'),1,3)||'년대')      "연대별 입사자수"
	from
		employee
	group by
		substr(to_char(hire_date,'YYYY'),1,3)||'년대', decode(substr(jumin_num,7,1),'1','남','3','남','여');



	select
		emp_name				"직원명"
		,to_char(hire_date, 'YYYY-MM-DD Q (DY)','NLS_DATE_LANGUAGE = Korean')	"입사일"
		,to_number(hire_date)					"퇴직일"
	from
		employee;


	select
		to_char(hire_date,'MM')	"입사월"
		,count(*)                           "인원수"
	from
		employee
	group by
		to_char(hire_date,'MM')
	order by
		"입사월";

	select
		d.dep_no			"부서번호"
		,d.loc			"부서위치"
		,count(e.emp_name)	"직원수"
	from
		employee e, dept d
	where
		e.dep_no = d.dep_no
	group by
		d.dep_no, d.loc
    order by
        d.dep_no;


	select
		e1.emp_no "[직원번호]"
		, e1.emp_name "[직원명]"
		, ceil((sysdate-e1.hire_date)/365) "[근무년차]"
		, to_number(to_char(sysdate,'yyyy'))-to_number((case substr(e1.jumin_num,7,1)
			when '1' then '19' when '2' then '19'else '20'end)||substr(e1.jumin_num,1,2))+1 "[나이]"
		, 60-(to_number(to_char(sysdate,'yyyy'))-to_number((case substr(e1.jumin_num,7,1)
			when '1' then '19' when '2' then '19'else '20'end)||substr(e1.jumin_num,1,2))+1) "[퇴직년도까지]"
		, to_char(to_date(case substr(e1.jumin_num,7,1)
			when '1' then '19' when '2' then '19' else '20' end
				||substr(e1.jumin_num,1,6),'yyyymmdd'),'yyyy-mm-dd')||' '
				||to_char(to_date(case substr(e1.jumin_num,7,1)
					when '1' then '19' when '2' then '19' else '20' end
				||substr(e1.jumin_num,1,6),'yyyymmdd'),'dy','nls_date_language = korean') "생일"
		,e1.jikup        "[직급]"
		,d1.dep_name  "[소속부서명]"
		,e2.emp_name  "[직속상관명]"
		,d2.dep_name   "[직속상관소속부서명]"
	from
		employee e1, dept d1, employee e2, dept d2
	where
		e1.dep_no = d1.dep_no(+)
		and e1.mgr_emp_no = e2.emp_no(+)
		and e2.dep_no = d2.dep_no(+)
	order by
		decode(e1.jikup,'사장','1','부장','2','과장','3','대리','4','5') asc
		,case when substr(e1.jumin_num,7,1) in('1','2') then '19' else '20' end ||substr(e1.jumin_num,1,6)


	select
		*
	from
		(select rownum RNUM, e.* from (select * from employee order by salary desc)e
		where rownum <=10)
	where
		RNUM>=1;


    select
		*
	from
		(select
			dep_no			DEP_NO
			,jikup			JIKUP
			,sum(salary)		TOT_SALARY
			,round(avg(salary),1)	AVG_SALARY
			,count(*)		EMP_CNT
		from
			employee
		group by
			dep_no, jikup)
	where
		emp_cnt>=3;


	select
		m.month||'월'	"입사월"
		,count(e.emp_name) "입사인원수"
	from
		(
			select '01' "MONTH" from dual union
			select '02' from dual union select '03' from dual union select '04' from dual union
			select '05' from dual union select '06' from dual union select '07' from dual union
			select '08' from dual union select '09' from dual union select '10' from dual union
			select '11' from dual union select '12' from dual
		) m
		, employee e
	where
		to_char(e.hire_date(+),'MM') = m.month
	group by
		m.month||'월'
	order by
		"입사월";


 	select
		d.dep_no			"부서번호"
		,d.dep_name			"부서명"
		,count(distinct e.emp_no)	"직원수"
		,count(c.emp_no)		"관리고객수"
	from
		employee e, dept d, customer c
	where
		e.dep_no(+) = d.dep_no and c.emp_no(+) = e.emp_no
	group by
		d.dep_no, d.dep_name;


	create view employee_vw1 as
		select
			emp_no, emp_name, dep_no, jikup, hire_date, jumin_num, phone, mgr_emp_no
		from
			employee;

    select
            *
    from
        employee_vw1;


	create view employee_vw3 as
	select
		d.dep_no		"부서번호"
		,d.dep_name	    "부서명"
		,e.jikup		"직급"
		,avg(e.salary)	"평균연봉"
	from
		employee e, dept d
	where
		e.dep_no = d.dep_no
	group by
		d.dep_no,d.dep_name, e.jikup
	order by
		"부서번호", "평균연봉" desc;


	insert into employee_vw1 (
		emp_no, emp_name, dep_no, jikup, hire_date, jumin_num, phone, mgr_emp_no
	) values (
		(select nvl(max(emp_no),0)+1 from employee_vw1)
		, '이승엽', 40, '과장', to_date('1990-09-01','YYYY-MM-DD'), '7811231452719', '01090056376', 1);


    update employee_vw1 set jikup = '부장' where emp_name = '이승엽' and jumin_num = '7811231452719';

    select * from employee_vw1;

    delete from employee_vw1 where jumin_num = '7811231452719';

    drop view employee_vw1;


    	create view employee_vw6 as
		select emp_no, emp_name, dep_no, jikup, salary from employee where salary>=3000
	with check option;

    update employee_vw6 set salary=salary*0.95 where salary>=3000 ;

    select view_name, text from user_views ;


	update
		employee
	set
		salary = salary * 0.9
	where
		emp_no in
		(select
			emp_no
		from
			(select rownum RNUM, e.* from (
			select emp_no from employee order by salary desc
			, decode(jikup, '사장','1','부장','2','과장','3','대리','4','주임','5','6') asc
			, hire_date asc
			, decode(substr(jumin_num,7,1),'1','19','2','19','20')||substr(jumin_num,1,6) asc
		) e
			where rownum <=5)
		where
			RNUM>=2);


	create table board(
		b_no	number(9)				--> 게시판 글 고유번호

		,subject 	varchar2(50)	not null	--> 글 제목
		,writer		varchar2(30)	not null	--> 글쓴이 이름
		,content	varchar2(2000)	not null	--> 글 내용
		,pwd		varchar2(12)	not null	--> 암호
		,email		varchar2(30)	not null	--> 이메일

		,reg_date	date	default sysdate		--> 등록일
		,readcount	number(5)	default 0	--> 조회수

		,group_no	number(9)	not null	--> 게시판 글의 소속 그룹번호.
		,print_no	number(9)	not null	--> 같은 그룹번호 내에서 화면 출력 순서 번호.

		,print_level	number(9)	not null	--> 같은 그룹번호 내에서 들여쓰기 레벨 단계 번호

		,primary key(b_no)
		);


    select
		x.cnt-rownum+1 "번호", b.*
	from
		(select
			LPAD( ' ', print_level*5, ' ')||decode(print_no,0,'','ㄴ')||subject	"글제목"
			, writer								"글쓴이명"
			, to_char(reg_date,'YYYY-MM-DD')					"등록일"
			, readcount								"조회수"
		from
			board
		order by
			group_no desc, print_no asc
		)b, (select count(*) CNT from board) x


        commit;