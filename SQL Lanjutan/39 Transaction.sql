use TsqlTraining
go

CREATE TABLE [dbo].[MyProduct](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[productname] [varchar](50) NOT NULL,
 CONSTRAINT [PK_MyProduct] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

select * from MyProduct
delete from MyProduct


-- test 1
BEGIN TRAN sp1;
insert into myproduct(productname) values('product1');
insert into myproduct(productname) values('product2');
insert into myproduct(productname) values('product3');
COMMIT TRAN sp1;

BEGIN TRAN sp2;
insert into myproduct(productname) values('product4');
insert into myproduct(productname) values('product5');
insert into myproduct(productname) values('product6');

ROLLBACK TRAN sp2;

BEGIN TRANSACTION; 
insert into myproduct(productname) values('product8');

SAVE TRANSACTION sp3;
insert into myproduct(productname) values('product9');

ROLLBACK TRAN sp3;

COMMIT TRANSACTION;