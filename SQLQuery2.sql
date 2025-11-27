

create table Employee(
	id int identity(1,1) primary key,
	Name varchar(50),
	Gender varchar(50),
	Salary int ,
	DeptId int
);

drop table Employee

INSERT INTO Employee 
VALUES('Pranaya', 'Male', 25000, 1),( 'Priyanka', 'Female', 30000, 2),( 'Anurag', 'Male',40000, 2),( 'Preety', 'Female', 35000, 3);

create proc ManageStud
@action nvarchar(10),
@Id int = null,
@Name varchar(20)=null ,
@Salary Int = null
as 
begin

SET NOCOUNT ON;

if @action='GetAll'
begin
select *from Employee;
end
else if @action='GetById'
begin
select *from Employee where id=@Id;
end
else if @action='Create'
begin
insert into Employee(Name,Salary)
values(@Name,@Salary);
end
else if @action='Update'
begin
update Employee set Name=@Name,Salary=@Salary where id=@Id
end
else if @action='Delete'
begin
delete from Employee where id=@Id
end
end


exec ManageStud @action='GetById',@Id=2;

exec ManageStud @action='Create',@Name='Alice',@Salary=8000;

exec ManageStud @action='Update', @Id=5, @Name='David', @Salary=47850;


exec ManageStud @action='Delete',@Id=1;


DROP PROC  ManageStud