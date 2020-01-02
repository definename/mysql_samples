# mysql_samles

Connect to mysql:

`mysql -u db_user -p123456`

Create table:

```
create table manufacturer(id serial, name varchar(255) not null, primary key(id)) engine innodb character set utf8;
```

Create table with foreign key:
```
create table component(
id serial, name varchar(255) not null,
manufacturer_id bigint unsigned not null,
primary key(id),
foreign key(manufacturer_id) references manufacturer(id) on delete restrict on update cascade)
engine innodb character set utf8;
```
