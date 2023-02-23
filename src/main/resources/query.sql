create table catalogStatus(
                              idCatalogStatus int auto_increment,
                              primary key(idCatalogStatus),
                              name varchar(35)
);
create table catalogGenre(
                             idCatalogGenre int auto_increment,
                             primary key(idCatalogGenre),
                             name varchar(2)
);

create table catalogSize(
                            idCatalogSize int auto_increment,
                            primary key(idCatalogSize),
                            name varchar(35)
);

create table catalogColor(
                             idCatalogColor int auto_increment,
                             primary key(idCatalogColor),
                             name varchar(6)
);

create table catalogTag(
                           idCatalogTag int auto_increment,
                           primary key(idCatalogTag),
                           name varchar(35),
                           idCatalogStatus int,
                           foreign key (idCatalogStatus) references catalogStatus(idCatalogStatus)

);

insert into catalogGenre(name)values("H");
insert into catalogGenre(name)values("M");
insert into catalogGenre(name)values("HN");
insert into catalogGenre(name)values("MN");
insert into catalogGenre(name)values("HB");
insert into catalogGenre(name)values("MB");
insert into catalogGenre(name)values("WO");

insert into catalogColor(name)values("000000");
insert into catalogColor(name)values("FFFFFF");
insert into catalogColor(name)values("000000");
insert into catalogColor(name)values("000000");
insert into catalogColor(name)values("000000");
insert into catalogColor(name)values("000000");
insert into catalogColor(name)values("000000");
insert into catalogColor(name)values("000000");

insert into catalogSize(name)values("XS");
insert into catalogSize(name)values("S");
insert into catalogSize(name)values("M");
insert into catalogSize(name)values("L");
insert into catalogSize(name)values("XL");
insert into catalogSize(name)values("XXL");

insert into catalogSize(name)values("2");
insert into catalogSize(name)values("4");
insert into catalogSize(name)values("6");
insert into catalogSize(name)values("8");
insert into catalogSize(name)values("10");
insert into catalogSize(name)values("12");
insert into catalogSize(name)values("14");
insert into catalogSize(name)values("16");

insert into catalogSize(name)values("26");
insert into catalogSize(name)values("28");
insert into catalogSize(name)values("30");
insert into catalogSize(name)values("32");
insert into catalogSize(name)values("34");
insert into catalogSize(name)values("36");
insert into catalogSize(name)values("38");
insert into catalogSize(name)values("40");
insert into catalogSize(name)values("42");

insert into catalogSize(name)values("1 plaza");
insert into catalogSize(name)values("1 1/2 plaza");
insert into catalogSize(name)values("2 plazas");
insert into catalogSize(name)values("Queen");
insert into catalogSize(name)values("King");

insert into catalogStatus(name)values("enable");
insert into catalogStatus(name)values("disable");
insert into catalogStatus(name)values("delete");

insert into catalogTag(name)values("1 botones");
insert into catalogTag(name)values("2 botones");
insert into catalogTag(name)values("3 botones");
insert into catalogTag(name)values("Estampado");
insert into catalogTag(name)values("Rasgado");

create table person(
                       idPerson int auto_increment,
                       primary key(idPerson),

                       idCatalogGenre int,
                       foreign key(idCatalogGenre) references catalogGenre(idCatalogGenre),

                       name varchar(35),
                       lastName varchar(35),
                       email varchar(35),
                       direction varchar(35),
                       phone varchar(9),

                       idCatalogStatus int,
                       foreign key(idCatalogStatus) references catalogStatus(idCatalogStatus)
);

create table enterprise(
                           idEnterprise int auto_increment,
                           primary key(idEnterprise),
                           ruc varchar(11),
                           direction varchar(35),
                           telephone varchar(9),
                           name varchar(35)
);

create table personEnterprise(
                                 idPersonEnterprise int auto_increment,
                                 primary key(idPersonEnterprise),

                                 idPerson int,
                                 foreign key(idPerson) references person(idPerson),

                                 idEnterprise int,
                                 foreign key(idEnterprise) references enterprise(idEnterprise),

                                 idCatalogStatus int,
                                 foreign key(idCatalogStatus) references catalogStatus(idCatalogStatus)
);

create table user(
                     idUser int auto_increment,
                     primary key(idUser),
                     name varchar(35),

                     idCatalogStatus int,
                     foreign key(idCatalogStatus) references catalogStatus(idCatalogStatus)

);

insert into user(name)values("admin");
insert into user(name)values("saler");
insert into user(name)values("database");


create table personUser(
                           idPersonUser int auto_increment,
                           primary key(idPersonUser),

                           idUser int,
                           foreign key(idUser) references user(idUser),

                           idPerson int,
                           foreign key(idPerson) references person(idPerson),

                           name varchar(35),
                           password varchar(35),

                           idCatalogStatus int,
                           foreign key(idCatalogStatus) references catalogStatus(idCatalogStatus)
);

drop table if exists login;
create table login(
                      idLogin int auto_increment,
                      primary key(idLogin),

                      idPersonUser int,
                      foreign key(idPersonUser) references personUser(idPersonUser),

                      dateLogin timestamp,

                      idCatalogStatus int,
                      foreign key(idCatalogStatus) references catalogStatus(idCatalogStatus)
);

drop table if exists customer;
create table customer(
                         idCustomer int auto_increment,
                         primary key(idCustomer),

                         idPerson int,
                         foreign key(idPerson) references person(idPerson)
);

drop table if exists expense;
create table expense(
                        idExpense int auto_increment,
                        primary key(idExpense),

                        title varchar(35),
                        description tinytext,

                        date timestamp,

                        idPersonUser int,
                        foreign key(idPersonUser) references personUser(idPersonUser),

                        idCatalogStatus int,
                        foreign key(idCatalogStatus) references catalogStatus(idCatalogStatus)
);

create table category(
                         idCategory int auto_increment,
                         primary key(idCategory),
                         name varchar(35),

                         idCatalogStatus int,
                         foreign key(idCatalogStatus) references catalogStatus(idCatalogStatus)
);

create table product(
                        idProduct int auto_increment,
                        primary key(idProduct),
                        name varchar(35),

                        idCategory int,
                        foreign key(idCategory) references category(idCategory),

                        idEnterprise int,
                        foreign key(idEnterprise) references enterprise(idEnterprise),

                        idCatalogGenre int,
                        foreign key(idCatalogGenre) references catalogGenre(idCatalogGenre),

                        idCatalogStatus int,
                        foreign key(idCatalogStatus) references catalogStatus(idCatalogStatus)

);

create table detailProduct(
                              idDetailProduct int auto_increment,
                              primary key(idDetailProduct),

                              idProduct int,
                              foreign key(idProduct) references product(idProduct),

                              idCatalogSize int,
                              foreign key(idCatalogSize) references catalogSize(idCatalogSize),

                              idCatalogColor int,
                              foreign key(idCatalogColor) references catalogColor(idCatalogColor),

                              salePrice double(9,2),
                              purchasePrice double(9,2),

                              quantity int,

                              idCatalogStatus int,
                              foreign key(idCatalogStatus) references catalogStatus(idCatalogStatus)
);

create table tagProduct(
                           idTaProduct int auto_increment,
                           primary key(idTaProduct),

                           idProduct int,
                           foreign key(idProduct) references product(idProduct),

                           idCatalogTag int,
                           foreign key(idCatalogTag) references catalogTag(idCatalogTag),

                           idCatalogStatus int,
                           foreign key(idCatalogStatus) references catalogStatus(idCatalogStatus)
);

create table payment(
                        idPayment int auto_increment,
                        primary key(idPayment),

                        name varchar(35),
                        discount float(9,2)
);

create table sale(
                     idSale int auto_increment,
                     primary key(idSale),

                     discount double,
                     subtotal double,
                     total double(9,2),

                     idPayment int,
                     foreign key(idPayment) references payment(idPayment),

                     idEnterprise int,
                     foreign key(idEnterprise) references enterprise(idEnterprise),

                     idCatalogStatus int,
                     foreign key(idCatalogStatus) references catalogStatus(idCatalogStatus)
);

create table saleDetail(
                           quantity int,

                           idSaleDetail int,
                           primary key(idSaleDetail),
                           idDetailProduct int,
                           foreign key(idDetailProduct) references detailProduct(idDetailProduct),

                           idSale int,
                           foreign key(idSale) references sale(idSale),

                           idCatalogStatus int,
                           foreign key(idCatalogStatus) references catalogStatus(idCatalogStatus)
);


insert into user(name)values("admin");
insert into user(name)values("saler");
insert into user(name)values("database");