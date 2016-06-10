-- in mysql clause order matters
-- order: where -> group by -> having -> order by
select employee.eno, ename, sum(qty * price)
from employee
left join sales on (sales.eno = employee.eno)
left join product on (sales.pno = product.pno)
group by eno
having sum(qty * price) > 1
order by sum(qty * price) desc;

select employee.eno, ename, sum(qty * price)
from sales, employee, product
where sales.eno = employee.eno and sales.pno = product.pno
group by sales.eno
having sum(qty * price) > 1
order by sum(qty * price) desc;
