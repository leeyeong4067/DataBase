--ch06 테이블 조인하기
--equl join
select employee.ename, employee.dno, department.dname, department.loc
from employee, department
where employee.dno = department.dno;

--일반적인 조인 방법
select e.ename, e.dno, d.dname, d.loc
from employee e, department d
where e.dno = d.dno -- 조인 조건
and e.dno = 20; -- 검색 조건;

--natural 조인 방법
select e.ename, dno, d.dname, d.loc
from employee e natural join department d
where dno = 20; -- 검색 조건;

--join - using
select e.ename, dno, d.dname, d.loc
from employee e join department d
using (dno) -- 조인 조건
where dno = 20; -- 검색 조건;

--join - using
select e.ename, e.dno, d.dname, d.loc
from employee e join department d
on e.dno = d.dno -- 조인 조건
where e.dno = 20; -- 검색 조건;

--non-equal join
--사원의 급여와 급여등급 검색
select e.ename, e.salary, s.grade
from employee e, salgrade s
where e.salary between losal and hisal;

select e.ename, e.salary, s.grade
from employee e join salgrade s
on e.salary between losal and hisal;

--사원이름, 부서이름, 급여, 급여등급 검색
select e.ename, d.dname, e.salary, s.grade
from employee e, department d, salgrade s
where e.dno = d.dno
and e.salary between losal and hisal;

select e.ename, d.dname, e.salary, s.grade
from employee e join department d
on e.dno = d.dno
join salgrade s
on e.salary between losal and hisal;

--self join
--사원이름과 직속상관의 이름 검색
select e.ename, m.ename
from employee e, employee m
where e.manager = m.eno;

select e.ename, m.ename
from employee e join employee m
on e.manager = m.eno;

--outer join null값을 포함
select e.ename, m.ename
from employee e left outer join employee m
on e.manager = m.eno;


-------------------혼자해보기 6장

--1 equl 조인을 사용하여 SCOTT 사원의 부서번호와 부서이름을 출력하시오
select e.ename, d.dname, d.dno
from employee e, department d
where e.dno = d.dno;

--2 inner join과 on 연산자를 사용하여 사원이름과 함께 그 사원이 소속된 부서이름과 지역명을 출력하시오
select e.ename, d.dname, d.loc
from employee e join department d
on e.dno = d.dno;

--3 inner join과 using 연산자를 사용하여 10번 부서에 속하는 모든 담당 업무의 고유 목록 (한 번씩만 표시) 을 부서의 지역명을 포함하여 출력하시오
select dno, e.job, d.loc
from employee e join department d
using (dno) -- 조인 조건
where dno = 10; -- 검색 조건;

--4 natural join을 사용하여 커미션을 받는 모든 사원의 이름, 부서이름, 지역명을 출력하시오
select e.ename, dname, d.loc
from employee e natural join department d
where commission > 0; -- 검색 조건;

--5 equl 조인과 wildcard를 사용하여 이름에 A가 포함된 모든 사원의 이름과 부서명을 출력하시오
select e.ename, d.dname
from employee e, department d
where e.dno = d.dno
and e.ename like '%A%';

--6 natural join을 사용하여 newyork 에 근무하는 모든 사원의 이름,업무,부서번호 및 부서명을 출력하시오
select e.ename, e.job, dno, d.dname
from employee e natural join department d
where loc = 'NEW YORK';

--8 outer join self join 을 사용하여 관리자가 없는 사원을 포함하여 사원번호를 기준으로 내림차순 정렬을 하시오
select e.ename, e.eno, m.ename, m.eno
from employee e left outer join emloyee m
where e.manager = m.dno
order by 2 desc;

--9 self join을 사용하여 지정한 사원의 이름, 부서번호, 지정한 사원과 동일한 부서에서 근무하는 사원을 출력하시오. 단, 각열의 별칭은 이름,부서번호,동료로 하시오
select e.ename as 이름, e.dno as 부서번호, d.ename as 동료 
from employee e, employee d
where e.dno = d.dno;

--10 selfjoin을 사용하여 ward 사원보다 늦게 입사한 사원의 이름과 입사일을 출력하시오
select other.ename, other.hiredate
from employee ward, employee other
where other.hiredate > ward.hiredate
and ward.ename = 'WARD'
order by 2;

--11 self join을 사용하여 관리자보다 먼저 입사한 모든 사원의 이름 및 입사일을 관리자의 이름 및 입사일과 함께 출력하시오
select other.ename, other.hiredate, admin.ename, admin.hiredate 
from employee admin, employee other
where other.manager = admin.eno
and other.hiredate<=admin.hiredate;


