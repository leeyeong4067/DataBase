--ch06 ���̺� �����ϱ�
--equl join
select employee.ename, employee.dno, department.dname, department.loc
from employee, department
where employee.dno = department.dno;

--�Ϲ����� ���� ���
select e.ename, e.dno, d.dname, d.loc
from employee e, department d
where e.dno = d.dno -- ���� ����
and e.dno = 20; -- �˻� ����;

--natural ���� ���
select e.ename, dno, d.dname, d.loc
from employee e natural join department d
where dno = 20; -- �˻� ����;

--join - using
select e.ename, dno, d.dname, d.loc
from employee e join department d
using (dno) -- ���� ����
where dno = 20; -- �˻� ����;

--join - using
select e.ename, e.dno, d.dname, d.loc
from employee e join department d
on e.dno = d.dno -- ���� ����
where e.dno = 20; -- �˻� ����;

--non-equal join
--����� �޿��� �޿���� �˻�
select e.ename, e.salary, s.grade
from employee e, salgrade s
where e.salary between losal and hisal;

select e.ename, e.salary, s.grade
from employee e join salgrade s
on e.salary between losal and hisal;

--����̸�, �μ��̸�, �޿�, �޿���� �˻�
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
--����̸��� ���ӻ���� �̸� �˻�
select e.ename, m.ename
from employee e, employee m
where e.manager = m.eno;

select e.ename, m.ename
from employee e join employee m
on e.manager = m.eno;

--outer join null���� ����
select e.ename, m.ename
from employee e left outer join employee m
on e.manager = m.eno;


-------------------ȥ���غ��� 6��

--1 equl ������ ����Ͽ� SCOTT ����� �μ���ȣ�� �μ��̸��� ����Ͻÿ�
select e.ename, d.dname, d.dno
from employee e, department d
where e.dno = d.dno;

--2 inner join�� on �����ڸ� ����Ͽ� ����̸��� �Բ� �� ����� �Ҽӵ� �μ��̸��� �������� ����Ͻÿ�
select e.ename, d.dname, d.loc
from employee e join department d
on e.dno = d.dno;

--3 inner join�� using �����ڸ� ����Ͽ� 10�� �μ��� ���ϴ� ��� ��� ������ ���� ��� (�� ������ ǥ��) �� �μ��� �������� �����Ͽ� ����Ͻÿ�
select dno, e.job, d.loc
from employee e join department d
using (dno) -- ���� ����
where dno = 10; -- �˻� ����;

--4 natural join�� ����Ͽ� Ŀ�̼��� �޴� ��� ����� �̸�, �μ��̸�, �������� ����Ͻÿ�
select e.ename, dname, d.loc
from employee e natural join department d
where commission > 0; -- �˻� ����;

--5 equl ���ΰ� wildcard�� ����Ͽ� �̸��� A�� ���Ե� ��� ����� �̸��� �μ����� ����Ͻÿ�
select e.ename, d.dname
from employee e, department d
where e.dno = d.dno
and e.ename like '%A%';

--6 natural join�� ����Ͽ� newyork �� �ٹ��ϴ� ��� ����� �̸�,����,�μ���ȣ �� �μ����� ����Ͻÿ�
select e.ename, e.job, dno, d.dname
from employee e natural join department d
where loc = 'NEW YORK';

--8 outer join self join �� ����Ͽ� �����ڰ� ���� ����� �����Ͽ� �����ȣ�� �������� �������� ������ �Ͻÿ�
select e.ename, e.eno, m.ename, m.eno
from employee e left outer join emloyee m
where e.manager = m.dno
order by 2 desc;

--9 self join�� ����Ͽ� ������ ����� �̸�, �μ���ȣ, ������ ����� ������ �μ����� �ٹ��ϴ� ����� ����Ͻÿ�. ��, ������ ��Ī�� �̸�,�μ���ȣ,����� �Ͻÿ�
select e.ename as �̸�, e.dno as �μ���ȣ, d.ename as ���� 
from employee e, employee d
where e.dno = d.dno;

--10 selfjoin�� ����Ͽ� ward ������� �ʰ� �Ի��� ����� �̸��� �Ի����� ����Ͻÿ�
select other.ename, other.hiredate
from employee ward, employee other
where other.hiredate > ward.hiredate
and ward.ename = 'WARD'
order by 2;

--11 self join�� ����Ͽ� �����ں��� ���� �Ի��� ��� ����� �̸� �� �Ի����� �������� �̸� �� �Ի��ϰ� �Բ� ����Ͻÿ�
select other.ename, other.hiredate, admin.ename, admin.hiredate 
from employee admin, employee other
where other.manager = admin.eno
and other.hiredate<=admin.hiredate;


