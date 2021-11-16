drop table toy_employee;
drop table toy_product;
drop table toy_position;
drop table toy_position_info;
drop sequence toy_position_info_seq;

create table toy_employee(
    emp_id      varchar2(30)    primary key
    ,emp_pw     varchar2(30)    not null
    ,emp_auth   varchar2(30)    default 'employee'
    ,emp_email  varchar2(100)   not null
    ,emp_indate   date            default sysdate
    ,emp_name   varchar2(30)    not null
);

create table toy_product(
    prod_num                 varchar2(30)    primary key
    ,prod_name               varchar2(100)   not null
    ,prod_category           varchar2(30)    not null
    ,prod_manufacturer       varchar2(30)    not null
    ,prod_contents           varchar2(1000)  
    ,prod_price              number          default 0
    ,prod_stock              number          default 0
    ,prod_boxea              number          default 0
    ,prod_originalfilename   varchar2(200)   
    ,prod_savedfilename      varchar2(200)
    ,prod_indate             date            default sysdate
    ,emp_id                  varchar2(30)    references toy_employee(emp_id)
);

create table toy_position(
    pos_num         number          primary key
);

Begin
    for i in 1..100
    loop
    insert into toy_position (pos_num) values (i);
    end loop;
end;
commit;

create table toy_position_info(
    pos_info_num     number      primary key
    ,pos_num         number      references toy_position(pos_num)
    ,prod_num        varchar(30) references toy_product(prod_num)
);

create sequence toy_position_info_seq;


rollback;

select
	pd.prodnum
	,pd.prodname
	,pd.prodcategory
	,pd.prodmanufacturer
	,pd.prodcontents
	,pd.prodprice
	,pd.prodstock
	,pd.prodboxquantity
	,pd.prodoriginalfilename
	,pd.prodsavedfilename
	,to_char(prodindate, 'YYYY-MM-DD') as prodindate
	,pd.empid
from
	toy_product	pd
    ,toy_position_info pi
where
    pd.prodnum = pi.prodnum
and
    pi.positionnum = 26;
    
select
	distinct pi.positionnum as positionnum
from
	toy_product	pd
    ,toy_position_info pi
where
    pd.prodnum = pi.prodnum
and
    upper(pd.prodname) like '%' || upper(trim('lego')) || '%';
    
select
	distinct pi.positionnum as positionnum
from
	toy_product	pd
    ,toy_position_info pi
where
    pd.prodnum = pi.prodnum
and
    upper(pd.prodname) like '%' upper(trim(#{searchText})) '%';
    
SELECT * FROM PRODUCT_COMPONENT_VERSION;

select
	prod_num as prodNum
	,prod_name as prodName
	,prod_category as prodCategory
	,prod_manufacturer as prodManufacturer
	,prod_contents as prodContents
	,prod_price as prodPrice
	,prod_stock as prodStock
	,prod_boxea as prodBoxea
	,prod_originalfilename as prodOriginalfilename
	,prod_savedfilename as prodSavedfilename
	,to_char(prod_indate, 'YYYY-MM-DD') as prodIndate
	,emp_id as empId
from
	toy_product
where
	prod_num = 'A001';