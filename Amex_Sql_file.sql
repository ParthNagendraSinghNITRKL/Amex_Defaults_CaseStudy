--FINDING NUMBER OF DEFAULTERS
select * from dataset
where is_default = 1 
order by net_yearly_income desc;
--Relation between credit used and yearly income
select customer_id,net_yearly_income,yearly_debt_payments,credit_limit_used, is_default,credit_score,
migrant_worker,
used_limit = (0.01*credit_limit_used*credit_limit), 
credit_limit, ratio = (0.01*credit_limit_used*credit_limit)/net_yearly_income
from dataset
where is_default = 0
order by ratio  desc;
--STUDYING EMPLOYMENT DETAILS OF DEFAULTERS
select customer_id, age, no_of_days_employed, credit_score, is_default 
from dataset
where is_default = 1
order by no_of_days_employed desc;
--FINDING AGED PEOPLE WITH LESS WORK EXPERIENCE
select customer_id,age, no_of_days_employed,is_default, net_yearly_income
from dataset
where no_of_days_employed <365*5and is_default = 1 and age>40
--STUDYING FAMILY STATUS OF DEFAULTERS
select * from dataset
where  is_default = 1 and no_of_children>2
order by credit_score
--INCOME STANDARDS OF DEFAULTERS
select * from dataset
where is_default = 1 
order by net_yearly_income desc;

select * from dataset
where migrant_worker = 1 and 
(age > 40 and no_of_days_employed < 5*365) and is_default = 1
--STUDYING RELATIONSHIP OF CREDIT SCORE 
--AND CREDIT LIMIT USED BY NON DEFAULTERS WITH LESS THAN 700 CREDIT SCORE
select credit_limit_used
from dataset
where credit_score<700 and is_default = 0 and credit_limit_used>70
order by credit_limit_used
--FINDING TOTAL NO OF PEOPLE WITH LESS THAN TWO YEARS OF EXPERIENCE
select no_of_days_employed
from dataset where no_of_days_employed<365*2



