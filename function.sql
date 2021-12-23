--4장 다양한 함수
--일반 함수
--null 값 처리 : nvl() / nvl2()
--사원의 연봉 계산하기

select ename, salary, commission, salary*12+nvl(commission, 0) as 연봉
from employee
order by 연봉 desc;

select ename, salary, commission, nvl2(commission, salary*12+commission, salary*12) as 연봉
from employee
order by 4 desc;

--조건판별하는 switch case 문 : decode()
--부서 이름 출력하기
select ename, dno, decode(dno, 10, 'ACCOUNTING',
                                20, 'RESEARCH',
                                30, 'SALES',
                                40, 'OPERATIONS',
                                'DEFAULT') as 부서명
from employee
order by dno;

--조건판별하는 if else문 : case문
--부서 이름 출력하기
select ename, dno, case when dno = 10 then 'ACCOUNTING'
                                when dno = 20 then 'RESEARCH'
                                when dno = 30 then 'SALES'
                                when dno = 40 then 'OPERATIONS'
                                else 'DEFAULT' 
                                end as 부서명
from employee
order by dno;

--혼자 해보기
--1번 substr 함수를 사용하여 사원들의 입사한 년도와 입사한 달만 출력
select ename, hiredate, substr(hiredate, 1, 2) as 년도, substr(hiredate, 4, 2)
from employee;

--2번 substr 함수를 사용하여 4월에 입사한 사원만 출력
select * 
from employee
where substr(hiredate, 4, 2) = '04';

--3번 mod 함수를 사용하여 사원번호가 짝수인 사원만 검색
select *
from employee
where mod (eno, 2) = 0;

--4번 입사일을 연도는 2자리(YY), 월은 숫자(MON)로 표시하고 요일은 약어(DY)로 출력
select hiredate, to_char(hiredate, 'yy/mon/dd dy')
from employee;

--5번 올해 며칠이 지났는지 출력
--현재 날짜에서 올해 1월1일을 뺀 결과를 출력, to_date 함수를 사용하여 데이터 형을 일치
select trunc(sysdate - to_date('2021/01/01', 'yyyy-mm-dd')) as 지난날,
        trunc(to_date('2021/12/31', 'yyyy-mm-dd') - sysdate) as 남은날
from dual;

--6번 사원들의 직속상관 사번을 출력, 직속상관이 없는 사원은 NULL 대신에 0으로 출력



--7번 decode 함수로 직급에 따라 급여를 인상 --> case문으로도 작성해보기
--'ANANLYST' : 200 'SALESMAN' : 180, 'MANANGER' : 150, 'CLERK' : 100
