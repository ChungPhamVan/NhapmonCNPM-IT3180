create database NMCNPM;
use NMCNPM;
create table role(
	idrole bigint not null identity(1,1),
	name nvarchar(255) not null,
	code varchar(255) not null,
	constraint pk_idrole primary key(idrole)
);
create table user_human(
	iduser bigint not null identity(1,1),
	idrole bigint not null,
	username nvarchar(150) not null,
	password varchar(150) not null,
	fullname nvarchar(150) null,
	status int not null,
	constraint pk_iduser primary key(iduser),
	constraint fk_idrole foreign key(idrole) references role(idrole)
);
create table category(
	idcategory bigint not null identity(1,1),
	name nvarchar(255) not null,
	code varchar(255) not null, 
	constraint pk_idcategory primary key(idcategory)
);
create table product(
	idproduct bigint not null identity(1,1),
	idcategory bigint not null,
	title nvarchar(255) not null,
	thumbnail nvarchar(255) null,
	shortdescription text not null,
	content text not null,
	price int not null,
	constraint pk_idproduct primary key(idproduct),
	constraint fk_idcategory foreign key(idcategory) references category(idcategory)
);
create table cart(
	idcart bigint not null identity(1,1),
	iduser bigint not null,
	idproduct bigint not null,
	constraint pk_idcart primary key(idcart),
	constraint fk_iduser_human foreign key(iduser) references user_human(iduser),
	constraint fk_idproduct foreign key(idproduct) references product(idproduct)
);
